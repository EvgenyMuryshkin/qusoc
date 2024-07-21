using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL.Simulator;
using QuokkaIntegrationTests;
using axi.modules;
using Quokka.RTL;

namespace axi.tests
{
    [TestClass]
    public class AXI4WS2812ModuleTests : BaseRTLModuleTests
    {
        [TestMethod]
        public void AXI4WS2812Module_B4_50()
        {
            var sim = new RTLSimulator<AXI4WS2812SimulationModule, AXI4WS2812SimulationModuleInputs>(VCDOutputPath("AXI4WS2812Module"));

            var topLevel = sim.TopLevel;
            sim.ClockCycle(new AXI4WS2812SimulationModuleInputs());

            while (!topLevel.oWACK)
            {
                sim.ClockCycle(new AXI4WS2812SimulationModuleInputs() { Master = { AWADDR = 0x0, WDATA = new RTLBitArray(0x010203), WE = true, BREADY = true } });
            }

            Assert.AreEqual(ws2812State.txDispatch, topLevel.ws.State.state);

            sim.ClockCycle(new AXI4WS2812SimulationModuleInputs() { Master = { BREADY = true } });

            while(topLevel.ws.State.state != ws2812State.Idle)
            {
                sim.ClockCycle(new AXI4WS2812SimulationModuleInputs());
            }
        }
    }
}

