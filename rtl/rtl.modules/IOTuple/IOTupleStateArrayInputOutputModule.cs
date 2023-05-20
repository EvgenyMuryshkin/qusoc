using Quokka.RTL;
using System.Linq;

namespace rtl.modules
{
    public class IOTupleStateArrayInputOutputModuleState
    {
        public IOTupleStateArrayInputOutputModuleState() { }
        public IOTupleStateArrayInputOutputModuleState(int size)
        {
            Value = Enumerable.Range(0, size).Select(i => new IOTupleModuleInputs()).ToArray();
        }

        public IOTupleModuleInputs[] Value { get; set; }
    }

    public class IOTupleStateArrayInputOutputModule : RTLSynchronousModule<IOTupleModuleInputs, IOTupleStateArrayInputOutputModuleState>
    {
        public IOTupleModuleInputs Output => State.Value[1];

        public IOTupleStateArrayInputOutputModule()
        {
            InitState(new IOTupleStateArrayInputOutputModuleState(2));
        }

        protected override void OnStage()
        {
            NextState.Value[0] = Inputs;
            NextState.Value[1] = State.Value[0];
        }
    }
}
