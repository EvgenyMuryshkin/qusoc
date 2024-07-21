using Quokka.RTL;
using System;

namespace axi.modules
{
    public class AXI4WS2812SimulationModuleInputs
    {
        public AXI4MasterModuleInput Master = new AXI4MasterModuleInput(axiSize.B4);
    }

    public class AXI4WS2812SimulationModule : RTLCombinationalModule<AXI4WS2812SimulationModuleInputs>
    {
        internal AXI4WS2812Module ws;
        internal AXI4MasterModule master = new AXI4MasterModule(axiSize.B4);

        public AXI4WS2812SimulationModule()
        {
            ws = new AXI4WS2812Module(axiSize.B4, 50000000);
        }

        public bool oWACK => master.WACK;
        public bool oRACK => master.RACK;
        public byte[] oRData => master.RDATA;
        public bool oTX => ws.oTX;
        public bool oTXBit => ws.oTXBit;

        protected override void OnSchedule(Func<AXI4WS2812SimulationModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            ws.Schedule(() => new()
            {
                M2S = master.M2S
            });

            master.Schedule(() => new AXI4MasterModuleInputs()
            {
                Master = Inputs.Master,
                S2M = ws.oS2M
            });
        }
    }
}
