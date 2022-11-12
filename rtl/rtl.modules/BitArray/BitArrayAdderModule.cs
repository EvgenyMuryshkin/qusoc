using Quokka.RTL;

namespace RTL.Modules
{
    public class BitArrayAdderInputs
    {
        public RTLBitArray I1 = new RTLBitArray(byte.MinValue);
        public RTLBitArray I2 = new RTLBitArray(byte.MinValue);
    }

    public class BitArrayAdderState
    {
        public RTLBitArray S = new RTLBitArray(byte.MinValue);

    }
    public class BitArrayAdderModule : RTLSynchronousModule<BitArrayAdderInputs, BitArrayAdderState>
    {
        public RTLBitArray O => State.S;
        public RTLBitArray OComb => Inputs.I1 + Inputs.I2;

        protected override void OnStage()
        {
            NextState.S = Inputs.I1 + Inputs.I2;
        }
    }
}
