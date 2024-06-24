using axi.modules;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL;
using Quokka.RTL.Simulator;
using QuokkaIntegrationTests;

namespace axi.tests
{
    [TestClass]
    public class AXIPWMModuleTests : BaseRTLModuleTests
    {
        [TestMethod]
        public void PWMModuleTest()
        {
            var sim = new RTLSimulator<PWMModule, PWMModuleInputs>(VCDOutputPath("PWMModule"));

            for (var i = 0; i < 120; i++)
            {
                sim.ClockCycle(new PWMModuleInputs() { iActive = true, iOnClock = 10, iDurationClocks = 15 });
            }
        }

        [TestMethod]
        public void AXI4PWMTestModule()
        {
            var sim = new RTLSimulator<AXI4PWMTestModule, AXI4PWMTestModuleInputs>(VCDOutputPath("AXI4PWMTestModule"));
            var topLevel = sim.TopLevel;
            sim.ClockCycle(new AXI4PWMTestModuleInputs());

            while (!topLevel.oWACK)
            {
                sim.ClockCycle(new AXI4PWMTestModuleInputs() { Master = { AWADDR = 0xFF, WDATA = new RTLBitArray(30), WE = true, BREADY = true } });
            }
            
            sim.ClockCycle(new AXI4PWMTestModuleInputs() { Master = { BREADY = true } });


            for (var i = 0; i < 8; i++)
            {
                while (!topLevel.oWACK)
                {
                    sim.ClockCycle(new AXI4PWMTestModuleInputs() { Master = { AWADDR = (i << 2), WDATA = new RTLBitArray(i + 1), WE = true, BREADY = true } });
                }

                sim.ClockCycle(new AXI4PWMTestModuleInputs() { Master = { BREADY = true } });
            }

            for (var i = 0; i < 120; i++)
            {
                sim.ClockCycle(new AXI4PWMTestModuleInputs());
            }
        }
    }
}

