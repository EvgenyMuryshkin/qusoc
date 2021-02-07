namespace Quokka.RTL.Local
{
    [RTLToolkitType]
    public class RTLPipelinePeek<TState> : IRTLPipelinePeek<TState>
    {
        private readonly IRTLPipelineStageManagedSignals _managedSignals;
        public RTLPipelinePeek(TState state, TState nextState, IRTLPipelineStageManagedSignals managedSignals)
        {
            State = state;
            NextState = nextState;
            _managedSignals = managedSignals;
        }

        public TState NextState { get; private set; }
        public TState State { get; private set; }

        // IRTLPipelineStageManagedSignals members
        public bool PrevStageWillStall => _managedSignals.PrevStageWillStall;
        public bool StageWillStall => _managedSignals.StageWillStall;
        public bool StageStalled => _managedSignals.StageStalled;
    }
}
