using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL;
using Quokka.RTL.Simulator;
using QuokkaIntegrationTests;
using rtl.modules;
using System;
using System.Drawing;
using System.Linq;
using System.Reflection;

namespace RTL.Modules
{
    [TestClass]
    public class AXI4MasterSlaveMemoryTests : BaseRTLModuleTests
    {
        (RTLSimulator<AXI4MasterSlaveMemoryTestModule, AXI4MasterSlaveMemoryTestModuleInputs>, AXI4MasterSlaveMemoryTestModule) Setup(string vcdPath = null)
        {
            var sim = new RTLSimulator<AXI4MasterSlaveMemoryTestModule, AXI4MasterSlaveMemoryTestModuleInputs>(vcdPath);
            var topLevel = sim.TopLevel;

            return (sim, topLevel);
        }

        [TestMethod]
        public void AXI4MasterSlaveMemoryTestModuleTest()
        {
            var l = typeof(Color).Assembly;

            var (sim, topLevel) = Setup(VCDOutputPath());
            var data = 0x81C0DE18;

            sim.ClockCycles(
                null,
                () => new AXI4MasterSlaveMemoryTestModuleInputs() { InData = data, MWE = true, WSTRB = new RTLBitArray(0xf)[3, 0] },
                () => topLevel.WACK);
            Assert.AreEqual(data, BitConverter.ToUInt32(topLevel.mem.State.buff[0]));

            sim.ClockCycles(
                null,
                () => new AXI4MasterSlaveMemoryTestModuleInputs() { InData = data + 1, AXADDR = 1, MWE = true, WSTRB = new RTLBitArray(0xf)[3, 0] },
                () => topLevel.WACK);
            Assert.AreEqual(data + 1, BitConverter.ToUInt32(topLevel.mem.State.buff[1]));

            sim.ClockCycles(
                null,
                () => new AXI4MasterSlaveMemoryTestModuleInputs() { InData = data + 2, AXADDR = 2, MWE = true, WSTRB = new RTLBitArray(0xf)[3, 0] },
                () => topLevel.WACK);
            Assert.AreEqual(data + 2, BitConverter.ToUInt32(topLevel.mem.State.buff[2]));

            sim.ClockCycles(
                null,
                () => new AXI4MasterSlaveMemoryTestModuleInputs() { AXADDR = 0, MRE = true },
                () => topLevel.RACK);
            Assert.AreEqual(data, (uint)topLevel.ReadData);

            sim.ClockCycles(
                null,
                () => new AXI4MasterSlaveMemoryTestModuleInputs() { AXADDR = 1, MRE = true },
                () => topLevel.RACK);
            Assert.AreEqual(data + 1, (uint)topLevel.ReadData);

            sim.ClockCycles(
                null,
                () => new AXI4MasterSlaveMemoryTestModuleInputs() { AXADDR = 2, MRE = true },
                () => topLevel.RACK);
            Assert.AreEqual(data + 2, (uint)topLevel.ReadData);
        }
    }
}

