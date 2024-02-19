﻿using Quokka.RTL;
using RTL.Modules;

namespace rtl.modules
{
    public class AXI4MasterModuleInputs
    {
        public AXI4MasterModuleInputs() : this(axiSize.B4) { }
        public AXI4MasterModuleInputs(axiSize size)
        {
            S2M = new AXI4_S2M(size);
            WDATA = new byte[AXI4Tools.Bytes(size)];
            WSTRB = new RTLBitArray().Resized(AXI4Tools.Bytes(size));
            ARADDR = new RTLBitArray().Resized(AXI4Tools.Bits(size));
            AWADDR = new RTLBitArray().Resized(AXI4Tools.Bits(size));
        }

        public AXI4_S2M S2M;

        public RTLBitArray ARADDR;
        public bool RE = false;

        public RTLBitArray AWADDR;
        public bool WE = false;
        public RTLBitArray WSTRB;

        public byte[] WDATA;
    }

    public class AXI4MasterModuleState
    {
        public AXI4MasterModuleState() { }

        public axiMasterReadFSM readFSM = axiMasterReadFSM.RESET;
        public axiMasterWriteFSM writeFSM = axiMasterWriteFSM.RESET;

        // read channel
        public bool ARREADYACK;

        // write channel
        public bool AWREADYACK;
        public bool WREADYACK;
    }

    public class AXI4MasterModule : RTLSynchronousModule<AXI4MasterModuleInputs, AXI4MasterModuleState>
    {
        private readonly axiSize size;

        public AXI4MasterModule(axiSize size)
        {
            this.size = size;
            InitInputs(new AXI4MasterModuleInputs(size));
            InitState(new AXI4MasterModuleState());
        }

        bool readAck => State.ARREADYACK && Inputs.S2M.R.R.RVALID;
        bool writeAck => State.AWREADYACK && State.WREADYACK && Inputs.S2M.W.B.BVALID;

        public bool RACK => State.readFSM == axiMasterReadFSM.OK && readAck;
        public byte[] RDATA => Inputs.S2M.R.R.RDATA;

        public bool WACK => State.writeFSM == axiMasterWriteFSM.OK && writeAck;

        public AXI4_M2S M2S => new AXI4_M2S(size)
        {
            R =
            {
                AR =
                {
                    ARADDR = Inputs.ARADDR,
                    ARVALID = Inputs.RE
                },
                R =
                {
                    RREADY = true
                }
            },
            W =
            {
                AW =
                {
                    AWADDR = Inputs.AWADDR,
                    AWVALID = Inputs.WE
                },
                W =
                {
                    WID = 0,
                    WDATA = Inputs.WDATA,
                    WSTRB = Inputs.WSTRB,
                    WVALID = Inputs.WE
                },
                B =
                {
                    BREADY = true
                }
            }
        };

        void ResetRead()
        {
            NextState.readFSM = axiMasterReadFSM.Idle;
            NextState.ARREADYACK = false;
        }

        void ResetWrite()
        {
            NextState.writeFSM = axiMasterWriteFSM.Idle;
            NextState.AWREADYACK = false;
            NextState.WREADYACK = false;
        }

        protected override void OnStage()
        {
            switch (State.readFSM)
            {
                case axiMasterReadFSM.RESET:
                    ResetRead();
                    break;
                case axiMasterReadFSM.Idle:
                    if (Inputs.RE)
                    {
                        NextState.readFSM = axiMasterReadFSM.OK;
                        NextState.ARREADYACK = Inputs.S2M.R.AR.ARREADY;
                    }
                    break;
                case axiMasterReadFSM.OK:
                    if (Inputs.S2M.R.AR.ARREADY)
                    {
                        NextState.ARREADYACK = true;
                    }

                    if (readAck)
                    {
                        ResetRead();
                    }

                    break;
            }

            switch (State.writeFSM)
            {
                case axiMasterWriteFSM.RESET:
                    ResetWrite();
                    break;
                case axiMasterWriteFSM.Idle:
                    if (Inputs.WE)
                    {
                        NextState.writeFSM = axiMasterWriteFSM.OK;
                        NextState.AWREADYACK = Inputs.S2M.W.AW.AWREADY;
                        NextState.WREADYACK = Inputs.S2M.W.W.WREADY;
                    }
                    break;
                case axiMasterWriteFSM.OK:
                    if (Inputs.S2M.W.AW.AWREADY)
                    {
                        NextState.AWREADYACK = true;
                    }

                    if (Inputs.S2M.W.W.WREADY)
                    {
                        NextState.WREADYACK = true;
                    }

                    if (writeAck)
                    {
                        ResetWrite();
                    }
                    break;
            }
        }
    }
}
