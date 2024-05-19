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
        Reset,
        Idle,
        StartBit,
        Data,
        StopBit
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
        public bool rxReceiving = false;
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
                inRDATA = new RTLBitArray(uartReceiver.oValue).Resized(sizeBits),
            });

            uartReceiver.Schedule(() => new()
            {
                iCE = State.rxClockCounter == 0,
                iRX = State.rx
            });

            uartTransmitter.Schedule(() => new()
            {
                iCE = State.txCE,//State.txClockCounter == 0,
                iValid = axiSlave.outWREADYConfirming,
                iValue = axiSlave.outWDATA[0]
            });
        }
        public bool oTX => uartTransmitter.oTX;
        public bool oTransmitting => uartTransmitter.oTransmitting;
        public bool oCE => uartTransmitter.oCE;

        public AXI4_S2M oS2M => axiSlave.S2M;
        public byte oRXData => uartReceiver.oValue;
        public int oTXCounter => State.txClockCounter;

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

            if (State.rxReceiving)
            {
                /*if (uartReceiver.oReceivingLastBit)
                {
                    NextState.rxReceiving = false;
                }
                else */if (State.rxClockCounter == 0)
                {
                    NextState.rxClockCounter = clocksPerBit;
                }
                else
                {
                    NextState.rxClockCounter = State.rxClockCounter - 1;
                }
            }
            else if (!Inputs.iRX)
            {
                NextState.rxClockCounter = halfClocksPerBit;
                NextState.rxReceiving = true;
            }
            else
            {
                NextState.rxClockCounter = halfClocksPerBit;
            }
        }

        protected override void OnStage()
        {
            TXLogic();
            RXLogic();
        }
    }
}
