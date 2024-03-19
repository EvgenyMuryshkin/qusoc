using Quokka.RTL;

namespace rtl.modules
{
    public class IOSimpleTupleModuleInputs
    {
        public (bool, byte) iValue = (false, 0);
    }

    public class IOSimpleTupleModule : RTLCombinationalModule<IOSimpleTupleModuleInputs>
    {
        (bool, byte) value => Inputs.iValue;

        public (bool, byte) oValueDirect => Inputs.iValue;
        public (bool, byte) oValueParts => (Inputs.iValue.Item1, Inputs.iValue.Item2);

        public (bool, byte) oValueInternal => value;

        public (bool, byte) oValueInternalParts => (value.Item1, value.Item2);
    }
}
