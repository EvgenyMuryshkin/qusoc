using Quokka.RTL;
using System;
using System.Linq;

namespace axi.modules
{
    public class FIFOModuleInputs
    {
        public FIFOModuleInputs() : this(8) { }
        public FIFOModuleInputs(int width)
        {
            iWData = new RTLBitArray(false).Resized(width);
        }

        public bool iWE;
        public RTLBitArray iWData;
        public bool iRE;
    }

    public class FIFOModuleState
    {
        public FIFOModuleState() : this(8, 2, 2) { }
        public FIFOModuleState(int width, int depth, int addrBits)
        {
            buffer = Enumerable.Range(0, depth).Select(_ => new RTLBitArray(false).Resized(width)).ToArray();
            rData = new RTLBitArray(false).Resized(width);
            rAddr = new RTLBitArray(false).Resized(addrBits);
            wAddr = new RTLBitArray(false).Resized(addrBits);
        }

        public RTLBitArray[] buffer;
        public RTLBitArray rAddr;
        public RTLBitArray rData;
        public bool rValid;
        public bool rACK;
        public RTLBitArray wAddr;

        public bool isEmpty = true;
        public bool isFull = false;
        public bool isWrapAround = false;

        public bool wACK = false;
    }

    public class FIFOModule : RTLSynchronousModule<FIFOModuleInputs, FIFOModuleState>
    {
        internal readonly int width;
        internal readonly int depth;
        internal readonly int addrBits;
        internal readonly RTLBitArray defaultValue;

        public FIFOModule(int width, int depth)
        {
            AXI4Tools.EnsurePowerOf2(depth, "FIFO size");

            this.width = width;
            this.depth = depth;
            this.addrBits = AXITools.log2(depth) + 1;

            InitInputs(new FIFOModuleInputs(width));
            InitState(new FIFOModuleState(width, depth, addrBits));

            defaultValue = new RTLBitArray(false).Resized(width);
        }

        protected bool isEmptyNext => wAddrNext == rAddrNext;
        protected bool isFullNext => wAddrNext[addrBits - 2, 0] == rAddrNext[addrBits - 2, 0] && isWrapAroundNext;
        protected bool isWrapAroundNext => wAddrNext[addrBits - 1] != rAddrNext[addrBits - 1];

        protected RTLBitArray wAddr => State.wAddr[addrBits - 2, 0];
        protected RTLBitArray rAddr => State.rAddr[addrBits - 2, 0];

        public RTLBitArray oRData => State.rACK ? State.rData : defaultValue;
        public RTLBitArray oRRawData => State.rData;

        public bool oRACK => State.rACK;

        public bool oIsEmpty => State.isEmpty;
        public bool oIsFull => State.isFull;
        public bool oRValid => State.rValid;

        public bool oWACK => State.wACK;

        bool we => Inputs.iWE && !State.isFull;
        protected RTLBitArray wAddrNext => we ? (State.wAddr + 1)[addrBits - 1, 0] : State.wAddr;


        bool re => Inputs.iRE && !State.isEmpty;
        protected RTLBitArray rAddrNext => re ? (State.rAddr + 1)[addrBits - 1, 0] : State.rAddr;

        protected override void OnStage()
        {
            // dual port RAM with read-first behaviour
            if (we)
            {
                NextState.buffer[wAddr] = Inputs.iWData;
            }

            NextState.rData = State.buffer[rAddr];


            NextState.wAddr = wAddrNext;
            NextState.rAddr = rAddrNext;
            NextState.rValid = !State.isEmpty;
            NextState.rACK = re;

            NextState.isEmpty = isEmptyNext;
            NextState.isFull = isFullNext;
            NextState.isWrapAround = isWrapAroundNext;

            NextState.wACK = we;
        }
    }
}
