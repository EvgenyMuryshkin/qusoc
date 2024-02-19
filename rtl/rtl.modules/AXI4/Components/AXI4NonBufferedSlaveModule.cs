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
            inRDATA = new byte[AXI4Tools.Bytes(size)];
        }

        public AXI4_M2S M2S;
        public byte[] inRDATA;
        public bool inARREADY;
        public bool inRVALID;


        public bool inAWREADY;
        public bool inWREADY;
        public bool inBVALID;
    }

    public class AXI4NonBufferedSlaveModuleState
    {
        public axiSlaveReadFSM readFSM = axiSlaveReadFSM.RESET;

        public axiSlaveWriteFSM writeAWFSM = axiSlaveWriteFSM.RESET;
        public axiSlaveWriteFSM writeWFSM = axiSlaveWriteFSM.RESET;
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
            R =
            {
                AR =
                {
                    ARREADY = internalARREADY
                },
                R =
                {
                    RID = Inputs.M2S.R.AR.ARID,
                    RUSER = Inputs.M2S.R.AR.ARUSER,
                    RVALID = internalRVALID,
                    RDATA = Inputs.inRDATA,
                    RRESP = axiResp.OKAY
                }
            },
            W =
            {
                AW =
                {
                    AWREADY = internalAWREADY
                },
                W =
                {
                    WREADY = internalWREADY
                },
                B =
                {
                    BID = Inputs.M2S.W.W.WID,
                    BRESP = axiResp.OKAY,
                    BUSER = Inputs.M2S.W.W.WUSER,
                    BVALID = internalBVALID
                }
            }
,        };

        // tx
        bool readTXCompleting => internalRVALID && Inputs.M2S.R.R.RREADY;
        bool writeTXCompleting => internalBVALID && Inputs.M2S.W.B.BREADY;
        // read channel
        bool internalARREADY => State.readFSM == axiSlaveReadFSM.Idle && Inputs.inARREADY;
        bool internalRVALID => State.readFSM == axiSlaveReadFSM.Ack && Inputs.inRVALID;

        // write channel
        bool internalAWREADY => State.writeAWFSM == axiSlaveWriteFSM.Idle && Inputs.inAWREADY;
        bool internalWREADY => State.writeWFSM == axiSlaveWriteFSM.Idle && Inputs.inWREADY;
        bool internalBVALID => State.writeAWFSM == axiSlaveWriteFSM.Ack && State.writeWFSM == axiSlaveWriteFSM.Ack && Inputs.inBVALID;

        // tx
        public bool outReadTXCompleting => readTXCompleting;
        public bool outWriteTXCompleting => writeTXCompleting;

        // read channel
        public bool outARREADYConfirming => State.readFSM == axiSlaveReadFSM.Idle && NextState.readFSM == axiSlaveReadFSM.Ack;
        public bool outARVALID => Inputs.M2S.R.AR.ARVALID;
        public uint outARADDR => Inputs.M2S.R.AR.ARADDR;

        // write channel
        public bool outAWREADYConfirming => State.writeAWFSM == axiSlaveWriteFSM.Idle && NextState.writeAWFSM == axiSlaveWriteFSM.Ack;
        public bool outAWVALID => Inputs.M2S.W.AW.AWVALID;
        public uint outAWADDR => Inputs.M2S.W.AW.AWADDR;

        public bool outWREADYConfirming => State.writeWFSM == axiSlaveWriteFSM.Idle && NextState.writeWFSM == axiSlaveWriteFSM.Ack;
        public bool outWVALID => Inputs.M2S.W.W.WVALID;
        public byte[] outWDATA => Inputs.M2S.W.W.WDATA;
        public RTLBitArray outWSTRB => Inputs.M2S.W.W.WSTRB;

        protected override void OnStage()
        {
            AssertData();

            switch (State.readFSM)
            {
                case axiSlaveReadFSM.RESET:
                    NextState.readFSM = axiSlaveReadFSM.Idle;
                    break;
                case axiSlaveReadFSM.Idle:
                    if (internalARREADY && Inputs.M2S.R.AR.ARVALID)
                        NextState.readFSM = axiSlaveReadFSM.Ack;
                    break;
                case axiSlaveReadFSM.Ack:
                    if (readTXCompleting)
                        NextState.readFSM = axiSlaveReadFSM.Idle;
                    break;
            }

            switch (State.writeAWFSM)
            {
                case axiSlaveWriteFSM.RESET:
                    NextState.writeAWFSM = axiSlaveWriteFSM.Idle;
                    break;
                case axiSlaveWriteFSM.Idle:
                    if (internalAWREADY && Inputs.M2S.W.AW.AWVALID)
                        NextState.writeAWFSM = axiSlaveWriteFSM.Ack;
                    break;
                case axiSlaveWriteFSM.Ack:
                    if (writeTXCompleting)
                        NextState.writeAWFSM = axiSlaveWriteFSM.Idle;
                    break;
            }

            switch (State.writeWFSM)
            {
                case axiSlaveWriteFSM.RESET:
                    NextState.writeWFSM = axiSlaveWriteFSM.Idle;
                    break;
                case axiSlaveWriteFSM.Idle:
                    if (internalWREADY && Inputs.M2S.W.W.WVALID)
                        NextState.writeWFSM = axiSlaveWriteFSM.Ack;
                    break;
                case axiSlaveWriteFSM.Ack:
                    if (writeTXCompleting)
                        NextState.writeWFSM = axiSlaveWriteFSM.Idle;
                    break;
            }
        }

        [RTLNonSynthesizable]
        void AssertData()
        {
            Assert(Inputs.M2S.W.W.WDATA != null, "WDATA should not be null");
            Assert(Inputs.M2S.W.W.WSTRB != null, "WSTRB should not be null");
            Assert(Inputs.M2S.W.W.WDATA.Length == AXI4Tools.Bytes(size), $"WDATA size should be {AXI4Tools.Bytes(size)}");
            Assert(Inputs.M2S.W.W.WSTRB.Size == AXI4Tools.Bytes(size), $"WSTRB size should be {AXI4Tools.Bytes(size)}");
        }
    }
}
