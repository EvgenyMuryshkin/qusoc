using Quokka.RTL;
using System;

namespace axi.modules
{
    public class AXIUARTModuleTestModuleUARTInputs
    {
        public bool iRX = true;
        public bool iEN_RX = true;
        public bool iEN_TX = true;
    }

    public class AXIUARTModuleTestModuleInputs
    {
        public AXI4MasterModuleInput Master = new AXI4MasterModuleInput(axiSize.B4);
        public AXIUARTModuleTestModuleUARTInputs UART = new AXIUARTModuleTestModuleUARTInputs();
    }

    public class AXIUARTModuleBaseTestModule : RTLCombinationalModule<AXIUARTModuleTestModuleInputs>
    {
        internal AXI4UARTModule uartModule;
        internal AXI4MasterModule masterModule = new AXI4MasterModule(axiSize.B4);

        public AXIUARTModuleBaseTestModule(int depth, int clocksPerBit)
        {
            uartModule = new AXI4UARTModule(axiSize.B4, depth, clocksPerBit);
        }

        public bool oWACK => masterModule.WACK;
        public bool oRACK => masterModule.RACK;
        public byte[] oRData => masterModule.RDATA;
        public bool oTX => uartModule.oTX;
        public byte oRXData => uartModule.oRXData;
        public bool oRXValid => uartModule.oRXValid;
        public bool oTransmitting => uartModule.oTransmitting;
        public bool oCE => uartModule.oCE;
        public int oTXCounter => uartModule.oTXCounter;
        public int oRXCounter => uartModule.oRXCounter;

        protected override void OnSchedule(Func<AXIUARTModuleTestModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            uartModule.Schedule(() => new()
            {
                M2S = masterModule.M2S,
                iRX = Inputs.UART.iRX,
                iEN_RX = Inputs.UART.iEN_RX,
                iEN_TX = Inputs.UART.iEN_TX
            });

            masterModule.Schedule(() => new AXI4MasterModuleInputs()
            {
                Master = Inputs.Master,
                S2M = uartModule.oS2M
            });
        }
    }

    public class AXIUARTTestModule : AXIUARTModuleBaseTestModule
    {
        public AXIUARTTestModule() : base(16, 0)
        {

        }
    }

    public class AXIUARTModuleClocksTestModule : AXIUARTModuleBaseTestModule
    {
        public AXIUARTModuleClocksTestModule() : base(16, 10)
        {

        }
    }

    public class FIFOModule_8_8 : FIFOModule
    {
        public FIFOModule_8_8() : base(8, 8) { }
    }

    public class FIFOModule_8_256 : FIFOModule
    {
        public FIFOModule_8_256() : base(8, 256) { }
    }

    public class FIFOModule_8_2 : FIFOModule
    {
        public FIFOModule_8_2() : base(8, 2) { }

        public bool oIsWrapAround => State.isWrapAround;
        public RTLBitArray oWAddr => wAddr;
        public RTLBitArray oWAddrNext => wAddrNext;
        public RTLBitArray oRAddr => rAddr;
        public RTLBitArray oRAddrNext => rAddrNext;
    }

    public class GrayCodeEncodeModule_4 : GrayCodeEncodeModule
    {
        public GrayCodeEncodeModule_4() : base(4) {}
    }
}
