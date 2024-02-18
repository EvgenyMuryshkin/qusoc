using Quokka.RTL;

namespace RTL.Modules
{
    public class IOSingleBitMemoryInputs
    {
        public RTLBitArray iBit = new RTLBitArray(false);
        public RTLBitArray[] iBitArrayBlock = new RTLBitArray[] { new RTLBitArray(false) };
        public bool[] iBoolBlock = new bool[] { false };
    }

    public class IOSingleBitMemoryState
    {
        public RTLBitArray bit = new RTLBitArray(false);
        public RTLBitArray bitInternal = new RTLBitArray(false);
        public RTLBitArray[] bitArrayBlock = new RTLBitArray[] { new RTLBitArray(true) };
        public bool[] boolBlock = new bool[] { false };
    }

    public class IOSingleBitMemoryModule : RTLSynchronousModule<IOSingleBitMemoryInputs, IOSingleBitMemoryState>
    {
        RTLBitArray[] bitArrayBlock => Inputs.iBitArrayBlock;
        bool[] boolBlock => Inputs.iBoolBlock;
        RTLBitArray intBit => Inputs.iBit;
        
        public RTLBitArray oBitInternal => intBit;
        public RTLBitArray oBit => Inputs.iBit;
        public bool oBit0 => Inputs.iBit[0];
        public RTLBitArray oBitState => State.bit;
        public RTLBitArray oBitStateInternal => State.bitInternal;
        public bool[] oInputBoolBlock => Inputs.iBoolBlock;
        public bool[] oInternalBoolBlock => boolBlock;
        
        public RTLBitArray[] oStateBitArrayBlock => State.bitArrayBlock;
        public bool[] oStateBoolBlock => State.boolBlock;

        protected override void OnStage()
        {
            NextState.bit = Inputs.iBit;
            NextState.bitInternal = intBit;
            
            NextState.bitArrayBlock = bitArrayBlock;
            NextState.boolBlock = boolBlock;
        }
    }
}

