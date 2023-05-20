using Quokka.RTL;

namespace rtl.modules
{
    public class IOTupleMuxStateOutputModuleInputs
    {
        public bool Selector { get; set; }
        public IOTupleModuleInputs Sel0 = new IOTupleModuleInputs();
        public IOTupleModuleInputs Sel1 = new IOTupleModuleInputs();
    }

    public class IOTupleMuxStateOutputModuleState
    {
        public IOTupleModuleInputs Sel0 = new IOTupleModuleInputs();
        public IOTupleModuleInputs Sel1 = new IOTupleModuleInputs();
    }

    public class IOTupleMuxStateOutputModule : RTLSynchronousModule<IOTupleMuxStateOutputModuleInputs, IOTupleMuxStateOutputModuleState>
    {
        public IOTupleModuleInputs Output => Inputs.Selector ? State.Sel1 : State.Sel0;

        protected override void OnStage()
        {
            NextState.Sel0 = Inputs.Sel0;
            NextState.Sel1 = Inputs.Sel1;
        }
    }
}
