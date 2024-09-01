using Quokka.RTL;
using System;

namespace axi.modules
{
    public class AXI4ProgrammerInputs
    {
        public AXI4ProgrammerInputs() : this(axiSize.B4) { }
        
        public AXI4ProgrammerInputs(axiSize size)
        {
            S2M = new AXI4_S2M(size);
        }

        public bool iRX { get; set; }

        public AXI4_S2M S2M { get; set; }
    }

    public enum AXI4ProgrammerFSM
    {
        Reset,
        DispatchIdle,
        DispatchInstruction,
        ReadReadAddr,
        AXIReadBegin,
        AXIReadEnd,
        ReadWriteAddr,
        ReadWriteData,
        AXIWriteBegin,
        AXIWriteEnd,
        Sync
    }

    public class AXI4ProgrammerState
    {
        public AXI4ProgrammerState() : this(axiSize.B4) { }
        public AXI4ProgrammerState(axiSize size)
        {
            masterInput = new AXI4MasterModuleInput(size);
            txWDATA = new RTLBitArray(uint.MinValue);
            addr = new RTLBitArray(uint.MinValue);
            data = new RTLBitArray(uint.MinValue);
        }

        public AXI4MasterModuleInput masterInput;
        public AXI4ProgrammerFSM fsm;

        public bool txWE;
        public RTLBitArray txWDATA;

        public bool rxRE;

        public byte counter;
        public RTLBitArray addr;
        public RTLBitArray data;
    }

    public class AXI4Programmer : RTLSynchronousModule<AXI4ProgrammerInputs, AXI4ProgrammerState>
    {
        AXI4MasterModule masterModule = new AXI4MasterModule(axiSize.B4);
        internal UARTTransmitterModule uartTransmitter;
        internal UARTReceiverModule uartReceiver;
        internal FIFOModule transmitterFIFO;
        internal FIFOModule receiverFIFO;
        internal UARTClockControlModule uartClockControl;

        public AXI4Programmer()
        {
            uartTransmitter = new UARTTransmitterModule();
            uartReceiver = new UARTReceiverModule();
            receiverFIFO = new FIFOModule(8, 256);
            transmitterFIFO = new FIFOModule(8, 256);
            uartClockControl = new UARTClockControlModule(434); // 115200

            InitState(new AXI4ProgrammerState(axiSize.B4));
        }

        protected override void OnSchedule(Func<AXI4ProgrammerInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            masterModule.Schedule(
                () => new AXI4MasterModuleInputs() 
                {
                    Master = State.masterInput,
                    S2M = Inputs.S2M
                }
            );

            uartClockControl.Schedule(() => new()
            {
                iEN_RX = true,
                iEN_TX = true,
                iRX = Inputs.iRX,
                iReceiverValid = uartReceiver.oValid,
                iTransmitting = uartTransmitter.oTransmitting
            });

            uartReceiver.Schedule(() => new()
            {
                iCE = uartClockControl.oRXCE,
                iRX = uartClockControl.oRX,
                iACK = !receiverFIFO.oIsFull
            });

            uartTransmitter.Schedule(() => new()
            {
                iCE = uartClockControl.oTXCE,
                iValid = transmitterFIFO.oRACK,
                iValue = transmitterFIFO.oRData
            });

            transmitterFIFO.Schedule(() => new()
            {
                iWE = State.txWE,
                iWData = State.txWDATA[31, 24],
                iRE = !uartTransmitter.oTransmitting && !uartTransmitter.oWillStartTransmitting
            });

            receiverFIFO.Schedule(() => new()
            {
                iWE = uartReceiver.oValid,
                iWData = uartReceiver.oValue,
                iRE = State.rxRE// !receiverFIFO.oIsEmpty && axiSlave.outARREADYConfirming && byteAddr == 0,//axiReadTransactionCompleting
            });
        }

        public AXI4_M2S M2S => masterModule.M2S;
        public bool oTX => uartTransmitter.oTX;


        //void ReadFlow()
        //{
        //    switch (State.fsm)
        //    {
        //
        //    }
        //}

        protected override void OnStage()
        {
            NextState.rxRE = false;
            NextState.txWE = false;

            switch (State.fsm)
            {
                case AXI4ProgrammerFSM.Reset:
                    NextState.fsm = AXI4ProgrammerFSM.DispatchIdle;
                    break;
                case AXI4ProgrammerFSM.DispatchIdle:

                    if (!receiverFIFO.oIsEmpty)
                    {
                        NextState.rxRE = true;
                        NextState.fsm = AXI4ProgrammerFSM.DispatchInstruction;
                    }
                    break;
                case AXI4ProgrammerFSM.DispatchInstruction:
                    {
                        if (receiverFIFO.oRACK)
                        {
                            NextState.counter = 0;
                            switch ((byte)receiverFIFO.oRRawData)
                            {
                                case 1: // read
                                    NextState.fsm = AXI4ProgrammerFSM.ReadReadAddr;
                                    break;
                                case 2: // write
                                    NextState.fsm = AXI4ProgrammerFSM.ReadWriteAddr;
                                    break;
                                case 0x55:
                                    NextState.fsm = AXI4ProgrammerFSM.Sync;
                                    NextState.txWDATA = new RTLBitArray(0x55000000);
                                    break;
                                default:
                                    NextState.fsm = AXI4ProgrammerFSM.DispatchIdle;
                                    break;
                            }
                        }
                    }
                    break;
                case AXI4ProgrammerFSM.ReadReadAddr:
                    {
                        if (State.counter == 4)
                        {
                            NextState.fsm = AXI4ProgrammerFSM.AXIReadBegin;
                            NextState.masterInput.RE = true;
                            NextState.masterInput.ARADDR = State.addr;
                            NextState.masterInput.RREADY = true;
                            NextState.counter = 0;
                        }
                        else if (receiverFIFO.oRACK)
                        {
                            NextState.addr = (State.addr << 8 | receiverFIFO.oRData)[31, 0];
                            NextState.counter = (byte)(State.counter + 1);
                        }
                        else if (!receiverFIFO.oIsEmpty)
                        {
                            NextState.rxRE = true;
                        }
                    }
                    break;
                case AXI4ProgrammerFSM.AXIReadBegin:
                    {
                        if (masterModule.RACK)
                        {
                            NextState.fsm = AXI4ProgrammerFSM.AXIReadEnd;
                            NextState.txWDATA = new RTLBitArray(masterModule.RDATA);
                            NextState.masterInput.RE = false;
                            NextState.masterInput.RREADY = false;
                        }
                    }
                    break;
                case AXI4ProgrammerFSM.AXIReadEnd:
                    {
                        if (State.counter == 4)
                        {
                            NextState.fsm = AXI4ProgrammerFSM.DispatchIdle;
                        }
                        else if (transmitterFIFO.oWACK)
                        {
                            NextState.counter = (byte)(State.counter + 1);
                            NextState.txWDATA = (NextState.txWDATA << 8)[31, 0];
                        }
                        else if (!transmitterFIFO.oIsFull && !State.txWE)
                        {
                            NextState.txWE = true;
                        }
                    }
                    break;
                case AXI4ProgrammerFSM.ReadWriteAddr:
                    {
                        if (State.counter == 4)
                        {
                            NextState.fsm = AXI4ProgrammerFSM.ReadWriteData;
                            NextState.counter = 0;
                        }
                        else if (receiverFIFO.oRACK)
                        {
                            NextState.addr = (State.addr << 8 | receiverFIFO.oRData)[31, 0];
                            NextState.counter = (byte)(State.counter + 1);
                        }
                        else if (!receiverFIFO.oIsEmpty)
                        {
                            NextState.rxRE = true;
                        }
                    }
                    break;
                case AXI4ProgrammerFSM.ReadWriteData:
                    {
                        if (State.counter == 4)
                        {
                            NextState.fsm = AXI4ProgrammerFSM.AXIWriteBegin;
                            NextState.counter = 0;
                            NextState.masterInput.WE = true;
                            NextState.masterInput.AWADDR = State.addr;
                            NextState.masterInput.WDATA = State.data;
                            NextState.masterInput.WSTRB = new RTLBitArray(0xF).Resized(4);// [3,0];
                            NextState.masterInput.BREADY = true;
                        }
                        else if (receiverFIFO.oRACK)
                        {
                            NextState.data = (State.data << 8 | receiverFIFO.oRData)[31, 0];
                            NextState.counter = (byte)(State.counter + 1);
                        }
                        else if (!receiverFIFO.oIsEmpty)
                        {
                            NextState.rxRE = true;
                        }
                    }
                    break;
                case AXI4ProgrammerFSM.AXIWriteBegin:
                    {
                        if (masterModule.WACK)
                        {
                            NextState.fsm = AXI4ProgrammerFSM.AXIWriteEnd;
                            NextState.masterInput.WE = false;
                            NextState.masterInput.BREADY = false;
                        }
                    }
                    break;
                case AXI4ProgrammerFSM.AXIWriteEnd:
                    {
                        NextState.fsm = AXI4ProgrammerFSM.DispatchIdle;
                    }
                    break;
                case AXI4ProgrammerFSM.Sync:
                    {
                        if (transmitterFIFO.oWACK)
                        {
                            NextState.fsm = AXI4ProgrammerFSM.DispatchIdle;
                        }
                        else if (!transmitterFIFO.oIsFull && !State.txWE)
                        {
                            NextState.txWE = true;
                        }
                    }
                    break;
                default:
                    NextState.fsm = AXI4ProgrammerFSM.DispatchIdle;
                    break;
            }
        }
    }
}
