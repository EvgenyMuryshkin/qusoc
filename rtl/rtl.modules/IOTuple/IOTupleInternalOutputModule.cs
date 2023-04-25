using Quokka.RTL;

namespace rtl.modules
{
    public class IOTupleInternalOutputModule : RTLCombinationalModule<IOTupleModuleInputs>
    {
        IOTupleModuleInputs Internal => Inputs;

        public IOTupleModuleInputs Output => Internal;
    }
}
