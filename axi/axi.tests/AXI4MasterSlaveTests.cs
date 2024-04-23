using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL;
using Quokka.RTL.Simulator;
using QuokkaIntegrationTests;
using axi.modules;
using System;

namespace axi.tests
{
    [TestClass]
    public class AXI4MasterSlaveTests : BaseRTLModuleTests
    {
        (RTLSimulator<AXI4MasterSlaveTestModule, AXI4MasterSlaveTestModuleInputs>, AXI4MasterSlaveTestModule) Setup(string vcdPath = null)
        {
            var sim = new RTLSimulator<AXI4MasterSlaveTestModule, AXI4MasterSlaveTestModuleInputs>(vcdPath);
            var topLevel = sim.TopLevel;

            return (sim, topLevel);
        }

        [TestMethod]
        public void AXI4MasterSlaveTestModuleTest()
        {
            var (sim, topLevel) = Setup(VCDOutputPath());
            var data = 0x81C0DE18;
            
            sim.ClockCycle(new AXI4MasterSlaveTestModuleInputs() { InData = data, MWE = true, WSTRB = new RTLBitArray(0xf)[3,0] });
            sim.ClockCycle(new AXI4MasterSlaveTestModuleInputs());
            sim.ClockCycle();
            sim.ClockCycle();
            sim.ClockCycle();
            sim.ClockCycle();
            sim.ClockCycle();
            sim.ClockCycle();
            sim.ClockCycle();
            sim.ClockCycle();
            sim.ClockCycle();
            /*
            sim.ClockCycles(() => new AXI4MasterSlaveTestModuleInputs(), () => !topLevel.OutACK);
            Assert.AreEqual(data, BitConverter.ToUInt32(topLevel.OutSlaveData));
            sim.ClockCycles(() => new AXI4MasterSlaveTestModuleInputs(), () => topLevel.OutACK);

            sim.ClockCycle(new AXI4MasterSlaveTestModuleInputs() { RE = true });

            sim.ClockCycles(() => new AXI4MasterSlaveTestModuleInputs(), () => !topLevel.OutACK);
            Assert.AreEqual(data, BitConverter.ToUInt32(topLevel.State.ReadData));
            sim.ClockCycles(() => new AXI4MasterSlaveTestModuleInputs(), () => topLevel.OutACK);
            */
        }
    }
}

