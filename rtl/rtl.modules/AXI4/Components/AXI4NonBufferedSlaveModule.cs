using Quokka.RTL;
using RTL.Modules;
using System;

namespace rtl.modules
{
    public class AXI4NonBufferedSlaveModuleInputs
    {
        public AXI4NonBufferedSlaveModuleInputs() : this(axiSize.B4) { }

        public AXI4NonBufferedSlaveModuleInputs(axiSize size)
        {
            M2S = new AXI4_M2S(size);
            RDATA = new byte[AXI4Tools.Bytes(size)];
        }

        public AXI4_M2S M2S;
        public byte[] RDATA;
        public bool RACK;
        public bool WACK;
    }

    public class AXI4NonBufferedSlaveModuleState
    {
        public axiSlaveReadFSM readFSM = axiSlaveReadFSM.RESET;
        public axiSlaveWriteFSM writeFSM = axiSlaveWriteFSM.RESET;
    }

    public class AXI4NonBufferedSlaveModule : RTLSynchronousModule<AXI4NonBufferedSlaveModuleInputs, AXI4NonBufferedSlaveModuleState>
    {
        private readonly axiSize size;
        public AXI4NonBufferedSlaveModule(axiSize size)
        {
            this.size = size;
            InitInputs(new AXI4NonBufferedSlaveModuleInputs(size));
        }

        public AXI4_S2M S2M => new AXI4_S2M()
        {
            AR =
            { 
                ARREADY = State.readFSM == axiSlaveReadFSM.Idle 
            },
            R =
            {
                RID = Inputs.M2S.AR.ARID,
                RUSER = Inputs.M2S.AR.ARUSER,
                RVALID = State.readFSM == axiSlaveReadFSM.OK && Inputs.RACK, 
                RDATA = Inputs.RDATA,
                RRESP = axiResp.OKAY
            },
            AW =
            {
                AWREADY = State.writeFSM == axiSlaveWriteFSM.Idle
            },
            W =
            {
                WREADY = State.writeFSM == axiSlaveWriteFSM.Idle && Inputs.WACK
            },
            B =
            {
                BID = Inputs.M2S.W.WID,
                BRESP = axiResp.OKAY,
                BUSER = Inputs.M2S.W.WUSER,
                BVALID = State.writeFSM == axiSlaveWriteFSM.OK
            }
        };

        bool axiWE => Inputs.M2S.AW.AWVALID && Inputs.M2S.W.WVALID;
        bool axiRE => Inputs.M2S.AR.ARVALID;

        public RTLBitArray WSTRB => Inputs.M2S.W.WSTRB;
        public byte[] WDATA => Inputs.M2S.W.WDATA;
        public bool WVALID => axiWE;
        public bool RVALID => axiRE;

        public uint ARADDR => Inputs.M2S.AR.ARADDR;
        public uint AWADDR => Inputs.M2S.AW.AWADDR;

        protected override void OnStage()
        {
            AssertData();

            switch (State.readFSM)
            {
                case axiSlaveReadFSM.RESET:
                {
                    NextState.readFSM = axiSlaveReadFSM.Idle;
                }
                break;
                case axiSlaveReadFSM.Idle:
                {
                    if (Inputs.M2S.AR.ARVALID)
                    {
                        NextState.readFSM = axiSlaveReadFSM.OK;
                    }
                }
                break;
                case axiSlaveReadFSM.OK:
                {
                    if (Inputs.M2S.R.RREADY && Inputs.RACK)
                        NextState.readFSM = axiSlaveReadFSM.Idle;
                }
                break;
                default:
                {
                    NextState.readFSM = axiSlaveReadFSM.Idle;
                }
                break;
            }
 
            switch (State.writeFSM)
            {
                case axiSlaveWriteFSM.RESET:
                {
                    NextState.writeFSM = axiSlaveWriteFSM.Idle;
                }
                break;
                case axiSlaveWriteFSM.Idle:
                {
                    if (axiWE)
                        NextState.writeFSM = axiSlaveWriteFSM.OK;
                }
                break;
                case axiSlaveWriteFSM.OK:
                {
                    if (Inputs.M2S.B.BREADY && Inputs.WACK)
                        NextState.writeFSM = axiSlaveWriteFSM.Idle;
                }
                break;
                default:
                {
                    NextState.writeFSM = axiSlaveWriteFSM.Idle;
                }
                break;
            } 
        }

        [RTLNonSynthesizable]
        void AssertData()
        {
            Assert(Inputs.M2S.W.WDATA != null, "WDATA should not be null");
            Assert(Inputs.M2S.W.WSTRB != null, "WSTRB should not be null");
            Assert(Inputs.M2S.W.WDATA.Length == AXI4Tools.Bytes(size), $"WDATA size should be {AXI4Tools.Bytes(size)}");
            Assert(Inputs.M2S.W.WSTRB.Size == AXI4Tools.Bytes(size), $"WSTRB size should be {AXI4Tools.Bytes(size)}");
        }
    }
}
