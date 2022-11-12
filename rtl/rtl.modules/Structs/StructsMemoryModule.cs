using Quokka.RTL;
using System.Linq;

namespace RTL.Modules
{
    public class StructsMemoryModuleState
    {
        public StructsMemoryModuleState() { }
        public StructsMemoryModuleState(int order)
        {
            Buff = Enumerable.Range(0, order).Select(idx => new Data()).ToArray();
        }

        [MemoryTemplateType(rtlMemoryTemplateType.Logic)]
        public Data[] Buff;
        public Data Out = new Data();
    }

    public class StructsMemoryModule : RTLSynchronousModule<StructsCombinationalModuleInputs, StructsMemoryModuleState>
    {
        public StructsMemoryModule()
        {
            InitState(new StructsMemoryModuleState(4));
        }

        public Data Out => State.Out;
        //public Data Out0 => State.Buff[0];
        //public Data Out1 => State.Buff[1];
        //public Data Out2 => State.Buff[2];
        //public Data Out3 => State.Buff[3];

        protected override void OnStage()
        {
            NextState.Buff[0] = Inputs.In;//dbg
            foreach (var idx in range(0, 3))
            {
                NextState.Buff[idx + 1] = State.Buff[idx];
            }
            NextState.Out = State.Buff[3];
        }
    }
}
