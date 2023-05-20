using Quokka.RTL;

namespace rtl.modules
{
    public class IOTupleMuxStateArrayOutputModuleInputs
    {
        public bool Selector { get; set; }
        public IOTupleModuleInputs Sel0 = new IOTupleModuleInputs();
        public IOTupleModuleInputs Sel1 = new IOTupleModuleInputs();
    }

    public class IOTupleMuxStateArrayOutputModuleState
    {
        public IOTupleModuleInputs[] Sel = new IOTupleModuleInputs[]
        {
            new IOTupleModuleInputs(),
            new IOTupleModuleInputs()
        };
    }

    public class IOTupleMuxStateArrayOutputModule : RTLSynchronousModule<IOTupleMuxStateArrayOutputModuleInputs, IOTupleMuxStateArrayOutputModuleState>
    {
        public IOTupleModuleInputs Output => Inputs.Selector ? State.Sel[1] : State.Sel[0];

        protected override void OnStage()
        {
            NextState.Sel[0] = Inputs.Sel0;
            NextState.Sel[1] = Inputs.Sel1;
        }
    }
}
