namespace Quokka.RTL.Local
{
    [RTLToolkitType]
    public class RTLPipelinePeek<TState> : IRTLPipelinePeek<TState>
    {
        public RTLPipelinePeek(TState state)
        {
            State = state;
        }

        public TState State { get; private set; }
    }
}
