using Quokka.RTL;
using RTL.Modules;

namespace rtl.modules
{
    public class AXIRangeDetectorModuleInputs
    {
        public AXIRangeDetectorModuleInputs() { }
        public AXIRangeDetectorModuleInputs(axiSize size)
        {
            RangeFrom = new RTLBitArray().Resized(AXI4Tools.Bits(size));
            RangeTo = new RTLBitArray().Resized(AXI4Tools.Bits(size));
            Value = new RTLBitArray().Resized(AXI4Tools.Bits(size));
        }

        public RTLBitArray RangeFrom { get; set; }
        public RTLBitArray RangeTo { get; set; }
        public RTLBitArray Value { get; set; }
    }

    public class AXIRangeDetectorModule : RTLCombinationalModule<AXIRangeDetectorModuleInputs>
    {
        public AXIRangeDetectorModule(axiSize size)
        {
            InitInputs(new AXIRangeDetectorModuleInputs(size));
        }

        public bool IsActive => Inputs.Value >= Inputs.RangeFrom && Inputs.Value <= Inputs.RangeTo;
    }
}
