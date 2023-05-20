using Quokka.RTL;

namespace rtl.modules
{
    public class IOTupleStateArrayLoopInputOutputModule : RTLSynchronousModule<IOTupleModuleInputs, IOTupleStateArrayInputOutputModuleState>
    {
        public IOTupleModuleInputs Output => State.Value[3];

        public IOTupleStateArrayLoopInputOutputModule()
        {
            InitState(new IOTupleStateArrayInputOutputModuleState(4));
        }

        protected override void OnStage()
        {
            NextState.Value[0] = Inputs;
            for (var idx = 0; idx < 3; idx++)
            {
                NextState.Value[idx + 1] = State.Value[idx];
            }
        }
    }
}
