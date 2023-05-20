using Quokka.RTL;

namespace rtl.modules
{
    public class IOTupleMuxInputOutputModuleInputs
    {
        public bool Selector { get; set; }
        public IOTupleModuleInputs Sel0 = new IOTupleModuleInputs();
        public IOTupleModuleInputs Sel1 = new IOTupleModuleInputs();
    }

    public class IOTupleMuxInputOutputModuleState
    {

    }

    public class IOTupleMuxInputOutputModule : RTLSynchronousModule<IOTupleMuxInputOutputModuleInputs, IOTupleMuxInputOutputModuleState>
    {
        public IOTupleModuleInputs Output => Inputs.Selector ? Inputs.Sel1 : Inputs.Sel0;

        protected override void OnStage()
        {
        }
    }
}
