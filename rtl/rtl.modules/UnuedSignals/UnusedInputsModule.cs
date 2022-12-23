using Quokka.RTL;

namespace RTL.Modules
{
    public class UnusedInputsModuleInputs
    {
        public bool iDirectOutput;
        public bool iReturnBodyOutput;
        public bool iReturnLambdaOutput;
        public bool iStateValueL0;
        public bool iStateValueL1;
        public bool iStateValueL2;
        public bool iUnused;
    }

    public class UnusedInputsModuleState
    {
        public bool StateValueL0;
        public bool StateValueL1;
        public bool StateValueL2;
    }

    public class UnusedInputsModule : RTLSynchronousModule<UnusedInputsModuleInputs, UnusedInputsModuleState>
    {
        public bool oDirectOutput => Inputs.iDirectOutput;
        public bool oStateValueL0 => State.StateValueL0;
        public bool oStateValueL1 => State.StateValueL1;
        public bool oStateValueL2 => State.StateValueL2;
        public bool oReturnBodyOutput => ReturnBody(Inputs.iReturnBodyOutput);
        public bool iReturnLambdaOutput => ReturnLambda(Inputs.iReturnLambdaOutput);

        bool ReturnLambda(bool value) => value;
        bool ReturnBody(bool value)
        {
            return value;
        }

        void Unused(bool value)
        {

        }

        void L2(bool l2, bool unused)
        {
            NextState.StateValueL2 = l2;
            Unused(unused);
        }

        void L1(bool l1, bool l2, bool unused)
        {
            NextState.StateValueL1 = l1;
            L2(l2, unused);
        }

        protected override void OnStage()
        {
            NextState.StateValueL0 = Inputs.iStateValueL0;
            L1(Inputs.iStateValueL1, Inputs.iStateValueL2, Inputs.iUnused);
        }
    }
}
