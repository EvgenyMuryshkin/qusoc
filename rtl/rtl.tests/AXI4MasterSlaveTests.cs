using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL.Simulator;
using rtl.modules;
using System;

namespace RTL.Modules
{
    [TestClass]
    public class AXI4MasterSlaveTests : BaseRTLModuleTests
    {
        (RTLSimulator<AXI4MasterSlaveTestModule, AXI4MasterSlaveTestModuleInputs>, AXI4MasterSlaveTestModule) Setup
        {
            get
            {
                var sim = new RTLSimulator<AXI4MasterSlaveTestModule, AXI4MasterSlaveTestModuleInputs>();
                var topLevel = sim.TopLevel;
                sim.ClockCycle();

                return (sim, topLevel);
            }
        }

        [TestMethod]
        public void AXI4MasterSlaveTestModuleTest()
        {
            var (sim, topLevel) = Setup;
            sim.TraceToVCD(VCDOutputPath());
            var data = 0x81C0DE18;
            sim.ClockCycle(new AXI4MasterSlaveTestModuleInputs() { InData = data, WE = true });

            sim.ClockCycles(() => new AXI4MasterSlaveTestModuleInputs(), () => !topLevel.OutACK);
            Assert.AreEqual(data, BitConverter.ToUInt32(topLevel.OutSlaveData));
            sim.ClockCycles(() => new AXI4MasterSlaveTestModuleInputs(), () => topLevel.OutACK);

            sim.ClockCycle(new AXI4MasterSlaveTestModuleInputs() { RE = true });

            sim.ClockCycles(() => new AXI4MasterSlaveTestModuleInputs(), () => !topLevel.OutACK);
            Assert.AreEqual(data, BitConverter.ToUInt32(topLevel.State.ReadData));
            sim.ClockCycles(() => new AXI4MasterSlaveTestModuleInputs(), () => topLevel.OutACK);
        }
    }
}

