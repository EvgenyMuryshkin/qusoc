using Quokka.RTL;
using RTL.Modules;
using System;
using System.Linq;

namespace rtl.modules
{
    public class AXI4MemoryModuleInputs
    {
        public AXI4MemoryModuleInputs() : this(axiSize.B4) { }

        public AXI4MemoryModuleInputs(axiSize size)
        {
            M2S = new AXI4_M2S(size);
            //WDATA = new byte[AXI4Tools.Bytes(size)];
        }

        public AXI4_M2S M2S;
        /*
        public bool WE = false;
        public byte[] WDATA = null;
        */
    }

    public class AXI4MemoryModuleState
    {
        public AXI4MemoryModuleState() : this(axiSize.B4, 0) { }
        public AXI4MemoryModuleState(axiSize size, int depth) 
        {
            buff = Enumerable.Range(0, depth).Select(i => new byte[AXI4Tools.Bytes(size)]).ToArray();
            rdata = new byte[AXI4Tools.Bytes(size)];
            wdata = new byte[AXI4Tools.Bytes(size)];
            wstrb = new RTLBitArray().Resized(AXI4Tools.Bytes(size));
        }

        public byte[][] buff;
        public byte[] rdata;
        public uint raddr;

        public bool waddrSet;
        public bool wdataSet;
        public uint waddr;
        public byte[] wdata;
        public RTLBitArray wstrb;
    }

    public class AXI4MemoryModule : RTLSynchronousModule<AXI4MemoryModuleInputs, AXI4MemoryModuleState>
    {
        internal AXI4NonBufferedSlaveModule axiSlave;
        private readonly axiSize size;
        private readonly int addressLSB;
        public AXI4MemoryModule(axiSize size, int depth)
        {
            this.size = size;
            this.addressLSB = AXI4Tools.AddressLSB(size);

            axiSlave = new AXI4NonBufferedSlaveModule(size);
            InitInputs(new AXI4MemoryModuleInputs(size));
            InitState(new AXI4MemoryModuleState(size, depth));
        }

        public void Initialize(byte[][] data)
        {
            data.CopyTo(State.buff, 0);
        }

        /*
        public byte[] OutData => State.bytes;
        public bool OutACK => Inputs.WE;
        */
        public AXI4_S2M S2M => axiSlave.S2M;

        bool internalSameTxWrite => Inputs.M2S.W.AW.AWVALID && Inputs.M2S.W.W.WVALID;
        bool internalDelayedTxWrite => State.waddrSet && State.wdataSet;
        bool internalWE => internalSameTxWrite || internalDelayedTxWrite;

        RTLBitArray internalWSTRB =>
            internalSameTxWrite
            ? axiSlave.outWSTRB
            : State.wstrb;

        uint internalWADDR =>
            (internalSameTxWrite
            ? axiSlave.outAWADDR
            : State.waddr) >> addressLSB;

        byte[] internalWDATA =>
            internalSameTxWrite
            ? axiSlave.outWDATA
            : State.wdata;

        uint internalRADDR =>
            (axiSlave.outARREADYConfirming
            ? axiSlave.outARADDR
            : State.raddr) >> addressLSB;

        protected override void OnSchedule(Func<AXI4MemoryModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            axiSlave.Schedule(() => new AXI4NonBufferedSlaveModuleInputs()
            {
                M2S = Inputs.M2S,
                inRDATA = State.rdata,
                inARREADY = true,
                inRVALID = true,
                inAWREADY = true,
                inWREADY = true,
                inBVALID = true,
            });
        }

        protected override void OnStage()
        {
            if (axiSlave.outAWREADYConfirming)
            {
                NextState.waddr = axiSlave.outAWADDR;
                NextState.waddrSet = true;
            }

            if (axiSlave.outWREADYConfirming)
            {
                NextState.wdata = axiSlave.outWDATA;
                NextState.wstrb = axiSlave.outWSTRB;
                NextState.wdataSet = true;
            }

            if (axiSlave.outWriteTXCompleting)
            {
                NextState.waddrSet = false;
                NextState.wdataSet = false;
            }

            foreach (var w in range(AXI4Tools.Bytes(size)))
            {
                if (internalWE && internalWSTRB[w])
                    NextState.buff[internalWADDR][w] = internalWDATA[w];
            }

            if (axiSlave.outARREADYConfirming)
            {
                NextState.raddr = axiSlave.outARADDR;
            }

            NextState.rdata = NextState.buff[internalRADDR];
        }
    }
}
