namespace Quokka.RTL.Local
{
    [RTLToolkitType]
    public class RTLPipelinePeek<TState> : IRTLPipelinePeek<TState>
    {
        public RTLPipelinePeek(TState state, TState nextState)
        {
            State = state;
            NextState = nextState;
        }

        public TState NextState { get; private set; }
        public TState State { get; private set; }
    }
}
