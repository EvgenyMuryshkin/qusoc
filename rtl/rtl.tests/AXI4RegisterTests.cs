using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL;
using Quokka.RTL.Simulator;
using rtl.modules;
using System;

namespace RTL.Modules
{
    [TestClass]
    public class AXI4RegisterTests : BaseRTLModuleTests
    {
        (RTLSimulator<AXI4RegisterModuleB4, AXI4RegisterModuleInputs>, AXI4RegisterModuleB4) Setup
        {
            get
            {
                var sim = new RTLSimulator<AXI4RegisterModuleB4, AXI4RegisterModuleInputs>();
                var topLevel = sim.TopLevel;
                sim.ClockCycle();

                return (sim, topLevel);
            }
        }

        [TestMethod]
        public void SetupTest()
        {
            var (sim, topLevel) = Setup;
            Assert.AreEqual(topLevel.State.readFSM, axiSlaveReadFSM.Idle);
            Assert.AreEqual(topLevel.State.writeFSM, axiSlaveWriteFSM.Idle);
        }

        [TestMethod]
        public void ExternalWriteTest()
        {
            var (sim, topLevel) = Setup;

            var extData = 0x01020304;
            topLevel.Schedule(() => new AXI4RegisterModuleInputs(axiSize.B4) { WE = true, WDATA = BitConverter.GetBytes(extData) });
            topLevel.DeltaCycle(0);
            Assert.IsTrue(topLevel.OutACK);
            sim.ClockCycle();
            Assert.AreEqual(topLevel.State.readFSM, axiSlaveReadFSM.Idle);
            Assert.AreEqual(topLevel.State.writeFSM, axiSlaveWriteFSM.Idle);
            Assert.AreEqual(extData, BitConverter.ToInt32(topLevel.OutData));
        }

        [TestMethod]
        public void AXIWriteTest()
        {
            var (sim, topLevel) = Setup;

            var axiData = 0x01020304;
            sim.ClockCycle(new AXI4RegisterModuleInputs(axiSize.B4) 
            { 
                M2S = {
                    W = {
                        WDATA = BitConverter.GetBytes(axiData),
                        WSTRB = new RTLBitArray(true, true, true, true),
                        WVALID = true
                    },
                    AW = {
                        AWVALID = true
                    }
                }
            });
            Assert.AreEqual(topLevel.State.readFSM, axiSlaveReadFSM.Idle);
            Assert.AreEqual(topLevel.State.writeFSM, axiSlaveWriteFSM.OK);

            // make sure that it waits for master ack
            sim.ClockCycle();
            Assert.AreEqual(topLevel.State.readFSM, axiSlaveReadFSM.Idle);
            Assert.AreEqual(topLevel.State.writeFSM, axiSlaveWriteFSM.OK);

            sim.ClockCycle(new AXI4RegisterModuleInputs(axiSize.B4)
            {
                M2S = {
                    B =
                    {
                        BREADY = true
                    }
                }
            });
            Assert.AreEqual(axiData, BitConverter.ToInt32(topLevel.OutData));
            Assert.AreEqual(topLevel.State.readFSM, axiSlaveReadFSM.Idle);
            Assert.AreEqual(topLevel.State.writeFSM, axiSlaveWriteFSM.Idle);
        }

        [TestMethod]
        public void AXIReadTest()
        {
            var (sim, topLevel) = Setup;

            var extData = 0x01020304;
            sim.ClockCycle(new AXI4RegisterModuleInputs(axiSize.B4) { WE = true, WDATA = BitConverter.GetBytes(extData) });
            Assert.AreEqual(extData, BitConverter.ToInt32(topLevel.OutData));
            Assert.IsFalse(topLevel.S2M.R.RVALID);

            sim.ClockCycle(new AXI4RegisterModuleInputs(axiSize.B4)
            {
                M2S =
                {
                    AR =
                    {
                        ARVALID = true
                    }
                }
            });
            Assert.AreEqual(topLevel.State.readFSM, axiSlaveReadFSM.OK);
            Assert.IsTrue(topLevel.S2M.R.RVALID);
            Assert.AreEqual(extData, BitConverter.ToInt32(topLevel.S2M.R.RDATA));

            // make sure that slave waits for master ack
            sim.ClockCycle();

            Assert.AreEqual(topLevel.State.readFSM, axiSlaveReadFSM.OK);
            Assert.IsTrue(topLevel.S2M.R.RVALID);
            Assert.AreEqual(extData, BitConverter.ToInt32(topLevel.S2M.R.RDATA));

            // ack
            sim.ClockCycle(new AXI4RegisterModuleInputs(axiSize.B4)
            {
                M2S =
                {
                    R = 
                    {
                        RREADY = true
                    }
                }
            });
            Assert.AreEqual(topLevel.State.readFSM, axiSlaveReadFSM.Idle);
            Assert.IsFalse(topLevel.S2M.R.RVALID);
        }
    }
}

