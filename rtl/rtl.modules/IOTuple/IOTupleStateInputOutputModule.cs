using Quokka.RTL;

namespace rtl.modules
{
    public class IOTupleStateInputOutputModuleState
    {
        public IOTupleModuleInputs Value { get; set; } = new IOTupleModuleInputs();
    }

    public class IOTupleStateInputOutputModule : RTLSynchronousModule<IOTupleModuleInputs, IOTupleStateInputOutputModuleState>
    {
        public IOTupleModuleInputs Output => State.Value;

        protected override void OnStage()
        {
            NextState.Value = Inputs;
        }
    }
}
