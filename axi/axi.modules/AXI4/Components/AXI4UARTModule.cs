using Quokka.RTL;
using System;
using System.Diagnostics;

namespace axi.modules
{
    public class AXI4UARTModuleInputs
    {
        public AXI4UARTModuleInputs() : this(axiSize.B4) { }
        public AXI4UARTModuleInputs(axiSize size)
        {
            M2S = new AXI4_M2S(size);
        }

        public AXI4_M2S M2S;
        public bool iRX;
    }

    public enum uartState
    {
        Idle,
        StartBit,
        Receiving
    }

    public class AXI4UARTModuleState
    {
        public AXI4UARTModuleState() : this(axiSize.B4, 0) { }
        public AXI4UARTModuleState(axiSize size, int clocksPerBit)
        {
            txClockCounter = Math.Min(1, clocksPerBit);
            rxClockCounter = Math.Min(1, clocksPerBit);
        }

        // TX
        public int txClockCounter = 0;
        public bool txCE = false;

        // RX
        public int rxClockCounter = 0;
        public bool rxCE = false;
        public uartState rxState = uartState.Idle;
        public bool rx = true;
    }

    public class AXI4UARTModule : RTLSynchronousModule<AXI4UARTModuleInputs, AXI4UARTModuleState>
    {
        private readonly int clocksPerBit = 0;
        private readonly int halfClocksPerBit = 0;
        private readonly axiSize size;
        private readonly int sizeBits;
        internal AXI4NonBufferedSlaveModule axiSlave;
        internal UARTTransmitterModule uartTransmitter;
        internal UARTReceiverModule uartReceiver;

        public AXI4UARTModule(axiSize size, int clocksPerBit)
        {
            this.clocksPerBit = clocksPerBit;
            this.halfClocksPerBit = clocksPerBit / 2;
            this.size = size;
            this.sizeBits = AXI4Tools.Bits(size);

            axiSlave = new AXI4NonBufferedSlaveModule(size);
            uartTransmitter = new UARTTransmitterModule();
            uartReceiver = new UARTReceiverModule();

            InitInputs(new AXI4UARTModuleInputs(size));
            InitState(new AXI4UARTModuleState(size, clocksPerBit));
        }

        protected override void OnSchedule(Func<AXI4UARTModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            axiSlave.Schedule(() => new AXI4NonBufferedSlaveModuleInputs()
            {
                M2S = Inputs.M2S,
                inARREADY = true,
                inRVALID = true,
                inAWREADY = true,
                inWREADY = !uartTransmitter.oTransmitting,
                inBVALID = true,
                inRDATA = rdata,
            });

            uartReceiver.Schedule(() => new()
            {
                iCE = State.rxCE,
                iRX = State.rx,
                iACK = axiSlave.outReadTXCompleting
            });

            uartTransmitter.Schedule(() => new()
            {
                iCE = State.txCE,
                iValid = axiSlave.outWREADYConfirming,
                iValue = axiSlave.outWDATA[0]
            });
        }

        RTLBitArray rdata 
            => new RTLBitArray(
                RTLBitArrayInitType.MSB,
                uartTransmitter.oTransmitting ? (byte)1 : (byte)0,
                uartReceiver.oValid ? (byte)1 : (byte)0,
                uartReceiver.oValue
            ).Resized(sizeBits);

        public bool oTX => uartTransmitter.oTX;
        public bool oTransmitting => uartTransmitter.oTransmitting;
        public bool oCE => uartTransmitter.oCE;

        public AXI4_S2M oS2M => axiSlave.S2M;
        public byte oRXData => uartReceiver.oValue;
        public bool oRXValid => uartReceiver.oValid;

        public int oTXCounter => State.txClockCounter;
        public int oRXCounter => State.rxClockCounter;

        void TXLogic()
        {
            if (uartTransmitter.oTransmitting)
            {
                if (State.txClockCounter == 0)
                {
                    NextState.txClockCounter = clocksPerBit;
                }
                else
                {
                    NextState.txClockCounter = State.txClockCounter - 1;
                }
            }
            else
            {
                NextState.txClockCounter = Math.Min(1, clocksPerBit);
            }

            NextState.txCE = NextState.txClockCounter == 0;
        }

        void RXLogic()
        {
            NextState.rx = Inputs.iRX;

            switch (State.rxState)
            {
                case uartState.Idle:
                    {
                        if (!Inputs.iRX)
                        {
                            NextState.rxClockCounter = halfClocksPerBit;
                            NextState.rxState = uartState.StartBit;
                        }
                    }
                    break;
                case uartState.StartBit:
                    {
                        if (State.rxClockCounter == 0)
                        {
                            if (!Inputs.iRX)
                            {
                                NextState.rxState = uartState.Receiving;
                                NextState.rxCE = true;
                            }
                            else
                            {
                                NextState.rxState = uartState.Idle;
                            }
                        }
                        else
                        {
                            NextState.rxClockCounter = State.rxClockCounter - 1;
                        }
                    }
                    break;
                case uartState.Receiving:
                    {
                        if (uartReceiver.oValid)
                        {
                            NextState.rxState = uartState.Idle;
                            NextState.rxClockCounter = Math.Min(1, clocksPerBit);
                        }
                        else if (State.rxClockCounter == 0)
                        {
                            NextState.rxClockCounter = clocksPerBit;
                        }
                        else
                        {
                            NextState.rxClockCounter = State.rxClockCounter - 1;
                        }

                        NextState.rxCE = NextState.rxClockCounter == 0;
                    }
                    break;
            }
        }

        protected override void OnStage()
        {
            TXLogic();
            RXLogic();
        }
    }
}
