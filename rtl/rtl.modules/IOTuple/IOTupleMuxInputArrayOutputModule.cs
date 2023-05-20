using Quokka.RTL;

namespace rtl.modules
{
    public class IOTupleMuxInputArrayOutputModuleInputs
    {
        public bool Selector { get; set; }
        public IOTupleModuleInputs[] Sel = new IOTupleModuleInputs[] 
        {
            new IOTupleModuleInputs(),
            new IOTupleModuleInputs()
        };
    }

    public class IOTupleMuxInputArrayOutputModuleState
    {

    }

    public class IOTupleMuxInputArrayOutputModule : RTLSynchronousModule<IOTupleMuxInputArrayOutputModuleInputs, IOTupleMuxInputArrayOutputModuleState>
    {
        public IOTupleModuleInputs Output => Inputs.Selector ? Inputs.Sel[1] : Inputs.Sel[0];

        protected override void OnStage()
        {
        }
    }
}
