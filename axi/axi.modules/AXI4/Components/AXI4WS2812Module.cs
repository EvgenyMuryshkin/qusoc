using Quokka.RTL;
using System;
using System.Diagnostics;
using System.Drawing.Drawing2D;

namespace axi.modules
{
    public class AXI4WS2812ModuleInputs
    {
        public AXI4WS2812ModuleInputs() : this(axiSize.B4) { }
        public AXI4WS2812ModuleInputs(axiSize size)
        {
            M2S = new AXI4_M2S(size);
        }

        public AXI4_M2S M2S;
    }

    public enum ws2812State
    {
        Reset,
        Idle,
        txDispatch,
        high,
        low
    }

    public class AXI4WS2812ModuleState
    {
        public AXI4WS2812ModuleState() : this(axiSize.B4) { }
        public AXI4WS2812ModuleState(axiSize size)
        {
            data = new RTLBitArray(false).Resized(24);
        }

        public RTLBitArray data;
        public ws2812State state;
        public bool tx;
        public byte txCounter;
        public uint clockCounter;
        public bool txBit;
    }

    public class AXI4WS2812Module : RTLSynchronousModule<AXI4WS2812ModuleInputs, AXI4WS2812ModuleState>
    {
        private readonly uint zeroLow = 0;
        private readonly uint zeroHigh = 0;
        private readonly uint oneLow = 0;
        private readonly uint oneHigh = 0;

        internal AXI4NonBufferedSlaveModule axiSlave;

        public AXI4WS2812Module(axiSize size, int clockSpeed)
        {
            zeroHigh = NsToClocks(clockSpeed, 280);
            zeroLow = NsToClocks(clockSpeed, 980);
            oneHigh = NsToClocks(clockSpeed, 880);
            oneLow = NsToClocks(clockSpeed, 380);

            axiSlave = new AXI4NonBufferedSlaveModule(size);

            InitInputs(new AXI4WS2812ModuleInputs(size));
            InitState(new AXI4WS2812ModuleState(size));
        }
        public AXI4_S2M oS2M => axiSlave.S2M;

        uint NsToClocks(int clockSpeed, int ns)
        {
            double nsPerClock = (1000000000.0 / clockSpeed);
            return (uint)(ns / nsPerClock);
        }

        protected override void OnSchedule(Func<AXI4WS2812ModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            axiSlave.Schedule(() => new AXI4NonBufferedSlaveModuleInputs()
            {
                M2S = Inputs.M2S,
                inARREADY = true,
                inRVALID = true,
                inAWREADY = true,
                inWREADY = true,
                inBVALID = true,
                inRDATA = rData,
            });
        }

        public bool oTX => State.tx;
        public bool oTXBit => State.txBit;

        RTLBitArray rData => new RTLBitArray(
            RTLBitArrayInitType.MSB,
            byte.MinValue,
            byte.MinValue,
            byte.MinValue,
            State.state == ws2812State.Idle ? (byte)1 : (byte)0
        );

        void Dispatch()
        {
            if (State.txCounter == 0)
            {
                NextState.state = ws2812State.Idle;
                NextState.txBit = false;
            }
            else
            {
                NextState.txCounter = (byte)(State.txCounter - 1);
                NextState.state = ws2812State.high;
                NextState.tx = true;
                NextState.txBit = State.data[0];

                if (State.data[0])
                {
                    NextState.clockCounter = oneHigh;
                }
                else
                {
                    NextState.clockCounter = zeroHigh;
                }
            }
        }

        protected override void OnStage()
        {
            NextState.clockCounter = State.clockCounter - 1;
            switch (State.state)
            {
                case ws2812State.Reset:
                    NextState.state = ws2812State.Idle;
                    break;
                case ws2812State.Idle:
                    if (axiSlave.outWVALID)
                    {
                        // incoming data in RGB format
                        // convert to GRB
                        // reverse bits to have MSB transmission
                        NextState.data = new RTLBitArray(RTLBitArrayInitType.MSB, axiSlave.outWDATA[1], axiSlave.outWDATA[2], axiSlave.outWDATA[0]).Reversed();
                        NextState.state = ws2812State.txDispatch;
                        NextState.txCounter = 24;
                    }
                    break;
                case ws2812State.txDispatch:
                    Dispatch();
                    break;
                case ws2812State.high:
                    if (State.clockCounter == 1)
                    {
                        NextState.state = ws2812State.low;
                        NextState.data = State.data >> 1;
                        NextState.tx = false;

                        if (State.txBit)
                        {
                            NextState.clockCounter = oneLow;
                        }
                        else
                        {
                            NextState.clockCounter = zeroLow;
                        }
                    }
                    break;
                case ws2812State.low:
                    if (State.clockCounter == 1)
                    {
                        Dispatch();
                    }
                    break;
            }
        }
    }
}
