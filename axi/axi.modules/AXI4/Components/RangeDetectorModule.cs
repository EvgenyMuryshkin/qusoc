using Quokka.RTL;
using RTL.Modules;

namespace rtl.modules
{
    public class RangeInfo
    {
        public uint rangeFrom;
        public uint rangeTo;

        public RangeInfo(uint rangeFrom, uint rangeTo)
        {
            this.rangeFrom = rangeFrom;
            this.rangeTo = rangeTo;
        }
    }

    public class RangeDetectorModuleInputs
    {
        public uint Value { get; set; }
    }

    public class RangeDetectorModule : RTLCombinationalModule<RangeDetectorModuleInputs>
    {
        readonly uint rangeFrom;
        readonly uint rangeTo;

        public RangeDetectorModule(uint rangeFrom, uint rangeTo)
        {
            this.rangeFrom = rangeFrom;
            this.rangeTo = rangeTo;
        }

        public bool IsActive => Inputs.Value >= rangeFrom && Inputs.Value <= rangeTo;
    }
}
