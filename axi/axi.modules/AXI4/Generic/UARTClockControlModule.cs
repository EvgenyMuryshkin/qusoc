using Quokka.RTL;
using System;

namespace axi.modules
{
    public enum uartState
    {
        Idle,
        StartBit,
        Receiving
    }

    public class UARTClockControlModuleInputs
    {
        public bool iRX;

        public bool iTransmitting;
        public bool iReceiverValid;

        public bool iEN_RX = true;
        public bool iEN_TX = true;
    }

    public class UARTClockControlModuleState
    {
        // TX
        public int txClockCounter = 0;
        public bool txCE = false;

        // RX
        public int rxClockCounter = 0;
        public bool rxCE = false;
        public uartState rxState = uartState.Idle;
        public bool rx = true;
    }

    public class UARTClockControlModule : RTLSynchronousModule<UARTClockControlModuleInputs, UARTClockControlModuleState>
    {
        private readonly int clocksPerBit = 0;
        private readonly int halfClocksPerBit = 0;

        public UARTClockControlModule(int clocksPerBit)
        {
            this.clocksPerBit = clocksPerBit;
            this.halfClocksPerBit = clocksPerBit / 2;
        }

        public bool oRXCE => State.rxCE;
        public bool oRX => State.rx;

        public bool oTXCE => State.txCE;
        public int oTXCounter => State.txClockCounter;
        public int oRXCounter => State.rxClockCounter;

        void TXLogic()
        {
            if (Inputs.iTransmitting)
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
                            if (halfClocksPerBit == 0)
                            {
                                NextState.rxState = uartState.Receiving;
                                NextState.rxCE = true;
                            }
                            else
                            {
                                NextState.rxClockCounter = halfClocksPerBit;
                                NextState.rxState = uartState.StartBit;
                            }
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
                        if (Inputs.iReceiverValid)
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
            if (Inputs.iEN_TX)
            {
                TXLogic();
            }

            if (Inputs.iEN_RX)
            {
                RXLogic();
            }
        }
    }
}
