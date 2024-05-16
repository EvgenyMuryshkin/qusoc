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
        public AXI4UARTModuleState() : this(axiSize.B4) { }
        public AXI4UARTModuleState(axiSize size)
        {
        }

        // TX
        public uartState txUARTState = uartState.Reset;
        public byte txData = 0;
        public bool tx = true;
        public bool hasTXData = false;
        public int txClockCounter = 0;
        public byte txBitCounter;

        // RX
        public uartState rxUARTState = uartState.Reset;
        public byte rxData = 0;
        public int rxClockCounter = 0;
        public byte rxBitCounter = 0;

    }

    public class AXI4UARTModule : RTLSynchronousModule<AXI4UARTModuleInputs, AXI4UARTModuleState>
    {
        private readonly int clocksPerBit = 0;
        private readonly int halfClocksPerBit = 0;
        private readonly axiSize size;
        private readonly int sizeBits;
        internal AXI4NonBufferedSlaveModule axiSlave;

        public AXI4UARTModule(axiSize size, int clocksPerBit)
        {
            this.clocksPerBit = clocksPerBit;
            this.halfClocksPerBit = clocksPerBit / 2;
            this.size = size;
            this.sizeBits = AXI4Tools.Bits(size);
            axiSlave = new AXI4NonBufferedSlaveModule(size);

            InitInputs(new AXI4UARTModuleInputs(size));
            InitState(new AXI4UARTModuleState(size));
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
                inWREADY = State.txUARTState == uartState.Idle,
                inBVALID = true,
                inRDATA = new RTLBitArray(State.rxData).Resized(sizeBits),
            });
        }


        public bool oTX => State.tx;
        public AXI4_S2M oS2M => axiSlave.S2M;
        public byte oRXData => State.rxData;

        bool txBit => new RTLBitArray(State.txData)[0];

        void TXDataLogic()
        {
            NextState.txBitCounter = (byte)(State.txBitCounter + 1);
            NextState.txData = (byte)(State.txData >> 1);
            NextState.tx = txBit;
        }

        void TXLogic()
        {
            if (axiSlave.outWREADYConfirming)
            {
                NextState.hasTXData = true;
                NextState.txData = axiSlave.outWDATA[0];
                NextState.txClockCounter = 0;
            }
            
            if (State.txClockCounter == 0)
            {
                switch (State.txUARTState)
                {
                    case uartState.Reset:
                        {
                            NextState.txUARTState = uartState.Idle;
                            NextState.tx = true;
                        }
                        break;
                    case uartState.Idle:
                        {
                            if (State.hasTXData)
                            {
                                NextState.txUARTState = uartState.StartBit;
                                NextState.tx = false;
                                NextState.txBitCounter = 0;
                            }
                        }
                        break;
                    case uartState.StartBit:
                        {
                            NextState.txUARTState = uartState.Data;
                            TXDataLogic();
                        }
                        break;
                    case uartState.Data:
                        {
                            TXDataLogic();

                            if (State.txBitCounter == 8)
                            {
                                NextState.txUARTState = uartState.StopBit;
                                NextState.tx = true;
                            }
                        }
                        break;
                    case uartState.StopBit:
                        NextState.txUARTState = uartState.Idle;
                        NextState.hasTXData = false;
                        break;
                }

                NextState.txClockCounter = clocksPerBit;
            }
            else
            {
                NextState.txClockCounter = State.txClockCounter - 1;
            }
        }

        RTLBitArray rxPart => new RTLBitArray(Inputs.iRX) << 7;
        void RXLogic()
        {
            if (State.rxClockCounter == 0)
            {
                NextState.rxClockCounter = clocksPerBit;

                switch (State.rxUARTState)
                {
                    case uartState.Reset:
                        {
                            NextState.rxUARTState = uartState.Idle;
                        }
                        break;
                    case uartState.Idle:
                        {
                            if (!Inputs.iRX)
                            {
                                NextState.rxClockCounter = halfClocksPerBit;

                                if (halfClocksPerBit == 0)
                                {
                                    NextState.rxData = 0;
                                    NextState.rxBitCounter = 0;
                                    NextState.rxUARTState = uartState.Data;
                                }
                                else
                                {
                                    NextState.rxUARTState = uartState.StartBit;
                                }
                            }
                        }
                        break;
                    case uartState.StartBit:
                        {
                            if (Inputs.iRX)
                            {
                                // failure
                                NextState.rxUARTState = uartState.Idle;
                            }
                            else
                            {
                                NextState.rxData = 0;
                                NextState.rxBitCounter = 0;
                                NextState.rxUARTState = uartState.Data;
                            }
                        }
                        break;
                    case uartState.Data:
                        {
                            NextState.rxData = (byte)((State.rxData >> 1) | rxPart);
                            NextState.rxBitCounter = (byte)(State.rxBitCounter + 1);

                            Trace.WriteLine($"{NextState.rxBitCounter}: {NextState.rxData}");

                            if (State.rxBitCounter == 7)
                            {
                                NextState.rxUARTState = uartState.StopBit;
                            }
                        }
                        break;
                    case uartState.StopBit:
                        {
                            NextState.rxUARTState = uartState.Idle;
                        }
                        break;
                }
            }
            else
            {
                NextState.rxClockCounter = State.rxClockCounter - 1;
            }
        }

        protected override void OnStage()
        {
            TXLogic();
            RXLogic();
        }
    }
}
