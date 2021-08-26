using Quokka.RTL;
using RTL.Modules;
using System;

namespace rtl.modules
{
    public class AXI4RegisterModuleInputs
    {
        public AXI4RegisterModuleInputs() { }

        public AXI4RegisterModuleInputs(axiSize size)
        {
            M2S = new AXI4_M2S(size);
            WDATA = new byte[AXI4Tools.Bytes(size)];
        }

        public AXI4_M2S M2S;
        public bool WE = false;
        public byte[] WDATA;
    }

    public class AXI4RegisterModuleState
    {
        public AXI4RegisterModuleState() { }
        public AXI4RegisterModuleState(axiSize size) 
        {
            bytes = new byte[AXI4Tools.Bytes(size)];
        }

        public byte[] bytes;
        public axiSlaveReadFSM readFSM = axiSlaveReadFSM.RESET;
        public axiSlaveWriteFSM writeFSM = axiSlaveWriteFSM.RESET;
    }

    public class AXI4RegisterModule : RTLSynchronousModule<AXI4RegisterModuleInputs, AXI4RegisterModuleState>
    {
        private readonly axiSize size;
        public AXI4RegisterModule(axiSize size)
        {
            this.size = size;
            InitInputs(new AXI4RegisterModuleInputs(size));
            InitState(new AXI4RegisterModuleState(size));
        }

        public byte[] OutData => State.bytes;
        public bool OutACK => State.readFSM == axiSlaveReadFSM.Idle && Inputs.WE;

        public AXI4_S2M S2M => new AXI4_S2M()
        {
            AR = new AXI4_S_AR() 
            { 
                ARREADY = State.readFSM == axiSlaveReadFSM.Idle 
            },
            R = new AXI4_S_R() 
            {
                RID = Inputs.M2S.AR.ARID,
                RUSER = Inputs.M2S.AR.ARUSER,
                RVALID = State.readFSM == axiSlaveReadFSM.OK, 
                RDATA = State.bytes,
                RRESP = axiResp.OKAY
            },
            AW = new AXI4_S_AW()
            {
                AWREADY = State.writeFSM == axiSlaveWriteFSM.Idle
            },
            W = new AXI4_S_W()
            {
                WREADY = State.writeFSM == axiSlaveWriteFSM.Idle
            },
            B = new AXI4_S_B()
            {
                BID = Inputs.M2S.W.WID,
                BRESP = axiResp.OKAY,
                BUSER = Inputs.M2S.W.WUSER,
                BVALID = State.writeFSM == axiSlaveWriteFSM.OK
            }
        };

        protected override void OnStage()
        {
            Assert(Inputs.M2S.W.WDATA != null, "WDATA should not be null");
            Assert(Inputs.M2S.W.WSTRB != null, "WSTRB should not be null");
            Assert(Inputs.M2S.W.WDATA.Length == AXI4Tools.Bytes(size), $"WDATA size should be {AXI4Tools.Bytes(size)}");
            Assert(Inputs.M2S.W.WSTRB.Size == AXI4Tools.Bytes(size), $"WSTRB size should be {AXI4Tools.Bytes(size)}");

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
                    if (Inputs.M2S.R.RREADY)
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
                    // do not write to register while AXI read transaction is in progress
                    if (State.readFSM == axiSlaveReadFSM.Idle)
                    {
                        var axiWE = Inputs.M2S.AW.AWVALID && Inputs.M2S.W.WVALID;

                        // complete AXI write transaction regardless of external WE
                        if (axiWE)
                            NextState.writeFSM = axiSlaveWriteFSM.OK;

                        // external WE has higher priority. External data takes over during write clash
                        // TODO: make this behavior configurable via module parameters
                        if (Inputs.WE)
                        {
                            foreach (var w in range(AXI4Tools.Bytes(size)))
                            {
                                NextState.bytes[w] = Inputs.WDATA[w];
                            }
                        }
                        else if (axiWE)
                        {
                            foreach (var w in range(AXI4Tools.Bytes(size)))
                            {
                                if (Inputs.M2S.W.WSTRB[w])
                                    NextState.bytes[w] = Inputs.M2S.W.WDATA[w];
                            }
                        }
                    }
                }
                break;
                case axiSlaveWriteFSM.OK:
                {
                    if (Inputs.M2S.B.BREADY)
                        NextState.writeFSM = axiSlaveWriteFSM.Idle;
                }
                break;
            }
 
        }
    }
    public class AXI4RegisterModuleB4 : AXI4RegisterModule
    {
        public AXI4RegisterModuleB4() : base(axiSize.B4)
        {

        }
    }
}
