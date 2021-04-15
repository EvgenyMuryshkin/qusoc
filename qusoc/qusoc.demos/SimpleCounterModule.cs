using System;
using System.Linq;
using Quokka.RTL;

namespace QuSoC.Demos
{
    public class SimpleCounterModuleInputs
    {

    }

    public class SimpleCounterModuleState
    {
        public uint counter;
        public uint read;
        public uint[] buff = new uint[512];
    }

    public class SimpleCounterModule : RTLSynchronousModule<SimpleCounterModuleInputs, SimpleCounterModuleState>
    {
        public SimpleCounterModule()
        {
            var rnd = new Random(42);
            var state = new SimpleCounterModuleState();
            state.buff = Enumerable.Range(0, state.buff.Length).Select(i => (uint)rnd.Next()).ToArray();
            InitState(state);
        }

        RTLBitArray Addr => new RTLBitArray(State.counter)[31, 22];
        public uint Counter => State.read;

        protected override void OnStage()
        {
            NextState.counter = State.counter + 1;
            if (State.counter == 0)
                NextState.buff[State.counter] = State.counter; 

            NextState.read = State.buff[Addr];
        }
    }
}
