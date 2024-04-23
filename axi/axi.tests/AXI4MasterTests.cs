using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL.Simulator;
using QuokkaIntegrationTests;
using axi.modules;
using System;

namespace axi.tests
{
    [TestClass]
    public class AXI4MasterTests : BaseRTLModuleTests
    {
        (RTLSimulator<AXI4MasterModuleB4, AXI4MasterModuleInputs>, AXI4MasterModuleB4) Setup
        {
            get
            {
                var sim = new RTLSimulator<AXI4MasterModuleB4, AXI4MasterModuleInputs>();
                var topLevel = sim.TopLevel;
                sim.ClockCycle();

                return (sim, topLevel);
            }
        }
        /*
        [TestMethod]
        public void WriteTest()
        {
            var (sim, topLevel) = Setup;
            var extData = 0x01020304;

            sim.ClockCycle(new AXI4MasterModuleInputs()
            {
                WE = true,
                WDATA = BitConverter.GetBytes(extData)
            });
            Assert.AreEqual(topLevel.State.fsm, axiMasterFSM.WWAIT);

            sim.ClockCycle();
            Assert.AreEqual(topLevel.State.fsm, axiMasterFSM.WWAIT);

            sim.ClockCycle(new AXI4MasterModuleInputs()
            {
                S2M = new AXI4_S2M()
                {
                    B =
                    {
                        BVALID = true
                    }
                }
            });
            Assert.AreEqual(topLevel.State.fsm, axiMasterFSM.WACK);
            Assert.IsTrue(topLevel.M2S.B.BREADY);
        }

        [TestMethod]
        public void ReadTest()
        {
            var (sim, topLevel) = Setup;
            var extData = 0x01020304;

            sim.ClockCycle(new AXI4MasterModuleInputs()
            {
                RE = true
            });
            Assert.AreEqual(topLevel.State.fsm, axiMasterFSM.RWAIT);

            sim.ClockCycle();
            Assert.AreEqual(topLevel.State.fsm, axiMasterFSM.RWAIT);

            sim.ClockCycle(new AXI4MasterModuleInputs()
            {
                S2M = new AXI4_S2M()
                {
                    R =
                    {
                        RDATA = BitConverter.GetBytes(extData),
                        RVALID = true
                    }
                }
            });
            Assert.AreEqual(topLevel.State.fsm, axiMasterFSM.RACK);
            Assert.IsTrue(topLevel.M2S.R.RREADY);
            Assert.AreEqual(extData, BitConverter.ToInt32(topLevel.RDATA));
        }
        */
    }
}

