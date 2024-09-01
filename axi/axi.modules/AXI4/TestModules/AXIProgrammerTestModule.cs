using Quokka.RTL;
using System;

namespace axi.modules
{
    public class AXIProgrammerTestModuleInputs {}
    public class AXIProgrammerTestModule : RTLCombinationalModule<AXIProgrammerTestModuleInputs>
    {
        internal AXI4Programmer programmer;
        internal AXI4MemoryModule memoryModule;

        public AXIProgrammerTestModule()
        {
            programmer = new AXI4Programmer();
            memoryModule = new AXI4MemoryModule(axiSize.B4, 256);
        }

        protected override void OnSchedule(Func<AXIProgrammerTestModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            programmer.Schedule(() => new() { iRX = true, S2M = memoryModule.S2M });
            memoryModule.Schedule(() => new() { M2S = programmer.M2S });
        }
    }
}
