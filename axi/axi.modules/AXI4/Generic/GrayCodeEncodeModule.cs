using Quokka.RTL;

namespace axi.modules
{
    public class GrayCodeModuleInputs
    {
        public GrayCodeModuleInputs() { }

        public GrayCodeModuleInputs(int width)
        {
            iValue = new RTLBitArray(false).Resized(width);
        }

        public RTLBitArray iValue;
    }

    public class GrayCodeEncodeModule : RTLCombinationalModule<GrayCodeModuleInputs>
    {
        public GrayCodeEncodeModule(int width)
        {
            InitInputs(new GrayCodeModuleInputs(width));
        }

        public RTLBitArray oValue => Inputs.iValue ^ (Inputs.iValue >> 1);
    }
}
