using Quokka.RTL;

namespace rtl.modules
{
    public class IOTupleStateInternalOutputModule : RTLSynchronousModule<IOTupleModuleInputs, IOTupleStateInputOutputModuleState>
    {
        IOTupleModuleInputs InternalValue => State.Value;

        public IOTupleModuleInputs Output => InternalValue;

        protected override void OnStage()
        {
            NextState.Value = Inputs;
        }
    }
}
