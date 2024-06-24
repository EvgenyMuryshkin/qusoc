using Quokka.RTL;
using System.Diagnostics.Metrics;
using System;

namespace axi.modules
{
    public class AXI4PWMTestModuleInputs
    {
        public AXI4MasterModuleInput Master = new AXI4MasterModuleInput(axiSize.B4);
    }

    public class AXI4PWMTestModule : RTLCombinationalModule<AXI4PWMTestModuleInputs>
    {
        AXI4PWMModule pwm;
        AXI4MasterModule master = new AXI4MasterModule(axiSize.B4);

        public AXI4PWMTestModule()
        {
            pwm = new AXI4PWMModule(axiSize.B4, 8, 20);
        }

        public bool[] oPWM => pwm.oPWM;
        public bool oWACK => master.WACK;

        protected override void OnSchedule(Func<AXI4PWMTestModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            pwm.Schedule(() => new()
            {
                M2S = master.M2S
            });

            master.Schedule(() => new AXI4MasterModuleInputs()
            {
                Master = Inputs.Master,
                S2M = pwm.oS2M
            });
        }
    }

    public class AXI4PWMModule_8_20 : AXI4PWMModule
    {
        public AXI4PWMModule_8_20() : base(axiSize.B4, 8, 20) { }
    }
}
