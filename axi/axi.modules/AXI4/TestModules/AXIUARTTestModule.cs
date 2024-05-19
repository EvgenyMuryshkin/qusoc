using Quokka.RTL;
using System;

namespace axi.modules
{
    public class AXIUARTModuleTestModuleInputs
    {
        public AXI4MasterModuleInput Master = new AXI4MasterModuleInput(axiSize.B4);
        public bool iRX;
    }

    public class AXIUARTModuleBaseTestModule : RTLCombinationalModule<AXIUARTModuleTestModuleInputs>
    {
        internal AXI4UARTModule uart;
        internal AXI4MasterModule master = new AXI4MasterModule(axiSize.B4);

        public AXIUARTModuleBaseTestModule(int clocksPerBit)
        {
            uart = new AXI4UARTModule(axiSize.B4, clocksPerBit);
        }

        public bool oWACK => master.WACK;
        public bool oRACK => master.RACK;
        public bool oTX => uart.oTX;
        public byte oRXData => uart.oRXData;
        public bool oRXValid => uart.oRXValid;
        public bool oTransmitting => uart.oTransmitting;
        public bool oCE => uart.oCE;
        public int oTXCounter => uart.oTXCounter;
        public int oRXCounter => uart.oRXCounter;

        protected override void OnSchedule(Func<AXIUARTModuleTestModuleInputs> inputsFactory)
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

    public class AXIUARTTestModule : AXIUARTModuleBaseTestModule
    {
        public AXIUARTTestModule() : base(0)
        {

        }
    }

    public class AXIUARTModuleClocksTestModule : AXIUARTModuleBaseTestModule
    {
        public AXIUARTModuleClocksTestModule() : base(10)
        {

        }
    }
}
