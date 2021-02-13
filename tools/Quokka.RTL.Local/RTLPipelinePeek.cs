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

        public IRTLPipelineStageControlSignals Control => _managedSignals.Control;
        public IRTLPipelineStageRequestSignals Request => _managedSignals.Request;
        public IRTLPipelineStagePreviewSignals Preview => _managedSignals.Preview;
    }
}
