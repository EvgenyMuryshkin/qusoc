using Quokka.RTL;
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
        }

        public AXI4_S2M S2M;

        public uint AXADDR = 0;
        public bool RE = false;
        public bool WE = false;
        public byte[] WDATA = null;
        public RTLBitArray WSTRB = null;
    }

    public class AXI4MasterModuleState
    {
        public AXI4MasterModuleState() { }
        public AXI4MasterModuleState(axiSize size)
        {
            ARDATA = new byte[AXI4Tools.Bytes(size)];
            AWDATA = new byte[AXI4Tools.Bytes(size)];
            WSTRB = new RTLBitArray().Resized(AXI4Tools.Bytes(size));
        }

        public axiMasterFSM fsm = axiMasterFSM.RESET;
        public uint AXADDR;
        public byte[] ARDATA;
        public byte[] AWDATA;
        public RTLBitArray WSTRB;
    }

    public class AXI4MasterModule : RTLSynchronousModule<AXI4MasterModuleInputs, AXI4MasterModuleState>
    {
        private readonly axiSize size;

        public AXI4MasterModule(axiSize size)
        {
            this.size = size;
            InitInputs(new AXI4MasterModuleInputs(size));
            InitState(new AXI4MasterModuleState(size));
        }

        bool internalInvalidInputs => Inputs.RE & Inputs.WE;
        public bool InvalidInputs => internalInvalidInputs;
        public bool OutACK => State.fsm == axiMasterFSM.RACK || State.fsm == axiMasterFSM.WACK;
        public byte[] RDATA => State.ARDATA;
        public AXI4_M2S M2S => new AXI4_M2S(size)
        {
            AR = new AXI4_M_AR()
            {
                ARADDR = State.AXADDR,                
                ARVALID = State.fsm == axiMasterFSM.RWAIT                
            },
            R = new AXI4_M_R()
            {
                RREADY = State.fsm == axiMasterFSM.RACK
            },
            AW = new AXI4_M_AW()
            {
                AWADDR = State.AXADDR,
                AWVALID = State.fsm == axiMasterFSM.WWAIT                
            },
            W = new AXI4_M_W()
            {
                WID = 0,
                WDATA = State.AWDATA,
                WSTRB = State.WSTRB,
                WVALID = State.fsm == axiMasterFSM.WWAIT
            },
            B = new AXI4_M_B()
            {
                BREADY = State.fsm == axiMasterFSM.WACK
            }
        };

        protected override void OnStage()
        {
            switch (State.fsm)
            {
                case axiMasterFSM.RESET:
                    NextState.fsm = axiMasterFSM.Idle;
                    break;
                case axiMasterFSM.Idle:
                    if (!internalInvalidInputs)
                    {
                        if (Inputs.WE)
                        {
                            NextState.AXADDR = Inputs.AXADDR;
                            NextState.AWDATA = Inputs.WDATA;
                            NextState.WSTRB = Inputs.WSTRB;
                            NextState.fsm = axiMasterFSM.WWAIT;
                        }
                        else if (Inputs.RE)
                        {
                            NextState.AXADDR = Inputs.AXADDR;
                            NextState.fsm = axiMasterFSM.RWAIT;
                        }
                    }
                    break;
                case axiMasterFSM.RWAIT:
                    if (Inputs.S2M.R.RVALID)
                    {
                        NextState.ARDATA = Inputs.S2M.R.RDATA;
                        NextState.fsm = axiMasterFSM.RACK;
                    }
                    break;
                case axiMasterFSM.RACK:
                    NextState.fsm = axiMasterFSM.Idle;
                    break;
                case axiMasterFSM.WWAIT:
                    if (Inputs.S2M.B.BVALID)
                    {
                        NextState.fsm = axiMasterFSM.WACK;
                    }
                    break;
                case axiMasterFSM.WACK:
                    NextState.fsm = axiMasterFSM.Idle;
                    break;
                default:
                {
                    NextState.fsm = axiMasterFSM.Idle;
                }
                break;
            }
        }
    }
}
