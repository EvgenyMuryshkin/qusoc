using Quokka.RTL;

namespace axi.modules
{
    public class AXIConfirmModuleInputs
    {
        public bool inValid;
        public bool inReady;
        public bool inRestart;
    }

    public enum AXIConfirmModuleFSM
    {
        Reset,
        Confirmed
    }

    public class AXIConfirmModuleState
    {
        public AXIConfirmModuleFSM fsm = AXIConfirmModuleFSM.Reset;
    }

    public class AXIConfirmModule : RTLSynchronousModule<AXIConfirmModuleInputs, AXIConfirmModuleState>
    {
        public bool outConfirmed => State.fsm == AXIConfirmModuleFSM.Confirmed;
        public bool outConfirming => State.fsm == AXIConfirmModuleFSM.Reset && NextState.fsm == AXIConfirmModuleFSM.Confirmed;
        public bool outReady => Inputs.inReady && State.fsm == AXIConfirmModuleFSM.Reset;

        protected override void OnStage()
        {
            if (Inputs.inRestart)
            {
                NextState.fsm = AXIConfirmModuleFSM.Reset;
            }
            else
            {
                switch (State.fsm)
                {
                    case AXIConfirmModuleFSM.Reset:
                        if (Inputs.inValid && Inputs.inReady)
                            NextState.fsm = AXIConfirmModuleFSM.Confirmed;
                        break;
                }
            }
        }
    }
}
