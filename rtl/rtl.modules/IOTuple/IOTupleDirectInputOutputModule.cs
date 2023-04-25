using Quokka.RTL;

namespace rtl.modules
{
    public class IOTupleDirectInputOutputModule : RTLCombinationalModule<IOTupleModuleInputs>
    {
        public IOTupleModuleInputs Output => Inputs;
    }
}
