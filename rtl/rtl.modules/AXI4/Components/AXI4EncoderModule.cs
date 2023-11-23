using Quokka.RTL;

namespace rtl.modules
{
    public class AXI4EncoderModuleInputs
    {
        public AXI4EncoderModuleInputs() { }
        public AXI4EncoderModuleInputs(int width)
        {
            iValues = new bool[width];
        }

        public bool[] iValues = new bool[0];
    }

    public class AXI4EncoderModule : RTLCombinationalModule<AXI4EncoderModuleInputs>
    {
        private readonly int inputWidth;
        private readonly int resultWidth;
        public AXI4EncoderModule(int width)
        {
            InitInputs(new AXI4EncoderModuleInputs(width));
            inputWidth = width;
            resultWidth = AXITools.log2(width);
        }

        RTLBitArray internalEncoded
        {
            get
            {
                var result = new RTLBitArray(false).Resized(resultWidth);
                for (var idx = Inputs.iValues.Length; idx > 0; idx--)
                {
                    if (Inputs.iValues[idx - 1])
                        result = idx - 1;
                }

                return result.Resized(resultWidth);
            }
        }

        bool internalHasActive
        {
            get
            {
                bool result = false;
                for (var idx = 0; idx < Inputs.iValues.Length; idx++)
                {
                    if (Inputs.iValues[idx])
                        result = result | Inputs.iValues[idx];
                }

                return result;
            }
        }

        public bool HasActive => internalHasActive;
        public RTLBitArray MSBIndex => internalEncoded;
        public RTLBitArray MSBValue => new RTLBitArray(internalHasActive).ShiftLeft(internalEncoded).Resized(inputWidth);
    }
}
