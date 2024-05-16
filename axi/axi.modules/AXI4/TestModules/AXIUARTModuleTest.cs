using Quokka.RTL;
using System;

namespace axi.modules
{
    public class AXIUARTModuleTestInputs
    {
        public AXI4MasterModuleInput Master = new AXI4MasterModuleInput(axiSize.B4);
        public bool iRX;
    }

    public class AXIUARTModuleBaseTest : RTLCombinationalModule<AXIUARTModuleTestInputs>
    {
        internal AXI4UARTModule uart = new AXI4UARTModule(axiSize.B4, 0);
        internal AXI4MasterModule master = new AXI4MasterModule(axiSize.B4);

        public AXIUARTModuleBaseTest(int clocksPerBit)
        {
            uart = new AXI4UARTModule(axiSize.B4, clocksPerBit);
        }

        public bool oWACK => master.WACK;
        public bool oTX => uart.oTX;
        public byte oRXData => uart.oRXData;

        protected override void OnSchedule(Func<AXIUARTModuleTestInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            uart.Schedule(() => new()
            {
                M2S = master.M2S,
                iRX = Inputs.iRX
            });

            master.Schedule(() => new AXI4MasterModuleInputs()
            {
                Master = Inputs.Master,
                S2M = uart.oS2M
            });
        }
    }

    public class AXIUARTModuleTest : AXIUARTModuleBaseTest
    {
        public AXIUARTModuleTest() : base(0)
        {

        }
    }

    public class AXIUARTModuleClocksTest : AXIUARTModuleBaseTest
    {
        public AXIUARTModuleClocksTest() : base(10)
        {

        }
    }
}
