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
            var rnd = new Random();
            State.buff = Enumerable.Range(0, State.buff.Length).Select(i => (uint)rnd.Next()).ToArray();
        }

        //SoCBlockRAMModule mem = new SoCBlockRAMModule(1024);
        RTLBitArray Addr => new RTLBitArray(State.counter)[31, 22];
        public uint Counter => State.read;
/*
        public uint Counter => mem.ReadValue;
        protected override void OnSchedule(Func<SimpleCounterModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            mem.Schedule(() => new SoCBlockRAMModuleInputs()
            {
                Common = new SoCComponentModuleCommon()
                {
                    WE = true,
                    RE = true,
                    MemAccessMode = new RTLBitArray(2).Resized(2),
                    WriteValue = State.counter,
                    Address = new RTLBitArray(State.counter).Resized(10)
                },
                DeviceAddress = 0,
            });
        }
*/
        protected override void OnStage()
        {
            NextState.counter = State.counter + 1;
            if (State.counter == 0)
                NextState.buff[State.counter] = State.counter; 

            NextState.read = State.buff[Addr];
        }
    }
}
