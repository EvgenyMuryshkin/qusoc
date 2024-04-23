using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL;
using Quokka.RTL.Simulator;
using QuokkaIntegrationTests;
using axi.modules;
using System;

namespace axi.tests
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
            Assert.AreEqual(topLevel.axiSlave.State.readFSM, axiSlaveReadFSM.Idle);
            Assert.AreEqual(topLevel.axiSlave.State.writeAWFSM, axiSlaveWriteFSM.Idle);
            Assert.AreEqual(topLevel.axiSlave.State.writeWFSM, axiSlaveWriteFSM.Idle);
        }

        [TestMethod]
        public void ExternalWriteTest()
        {
            var (sim, topLevel) = Setup;

            var extData = 0x01020304;
            topLevel.Schedule(() => new AXI4RegisterModuleInputs(axiSize.B4) { Reg = { inWE = true, inWDATA = BitConverter.GetBytes(extData) } });
            topLevel.DeltaCycle(0);
            Assert.IsTrue(topLevel.outACK);
            sim.ClockCycle();
            Assert.AreEqual(topLevel.axiSlave.State.readFSM, axiSlaveReadFSM.Idle);
            Assert.AreEqual(topLevel.axiSlave.State.writeAWFSM, axiSlaveWriteFSM.Idle);
            Assert.AreEqual(topLevel.axiSlave.State.writeWFSM, axiSlaveWriteFSM.Idle);
            Assert.AreEqual(extData, BitConverter.ToInt32(topLevel.outData));
        }

        [TestMethod]
        public void AXIWriteTest()
        {
            var (sim, topLevel) = Setup;

            var axiData = 0x01020304;
            sim.ClockCycle(new AXI4RegisterModuleInputs(axiSize.B4) 
            { 
                M2S = 
                {
                    W =
                    {
                        W = 
                        {
                            WDATA = BitConverter.GetBytes(axiData),
                            WSTRB = new RTLBitArray(0xF)[3,0],
                            WVALID = true
                        },
                        AW = {
                            AWVALID = true
                        }
                    }
                }
            });
            Assert.AreEqual(topLevel.axiSlave.State.readFSM, axiSlaveReadFSM.Idle);
            Assert.AreEqual(topLevel.axiSlave.State.writeAWFSM, axiSlaveWriteFSM.Ack);
            Assert.AreEqual(topLevel.axiSlave.State.writeWFSM, axiSlaveWriteFSM.Ack);

            // make sure that it waits for master ack
            sim.ClockCycle();
            Assert.AreEqual(topLevel.axiSlave.State.readFSM, axiSlaveReadFSM.Idle);
            Assert.AreEqual(topLevel.axiSlave.State.writeAWFSM, axiSlaveWriteFSM.Ack);
            Assert.AreEqual(topLevel.axiSlave.State.writeWFSM, axiSlaveWriteFSM.Ack);

            sim.ClockCycle(new AXI4RegisterModuleInputs(axiSize.B4)
            {
                M2S = 
                {
                    W =
                    {
                        B =
                        {
                            BREADY = true
                        }
                    }
                }
            });
            Assert.AreEqual(axiData, BitConverter.ToInt32(topLevel.outData));
            Assert.AreEqual(topLevel.axiSlave.State.readFSM, axiSlaveReadFSM.Idle);
            Assert.AreEqual(topLevel.axiSlave.State.writeAWFSM, axiSlaveWriteFSM.Idle);
            Assert.AreEqual(topLevel.axiSlave.State.writeWFSM, axiSlaveWriteFSM.Idle);
        }

        [TestMethod]
        public void AXIReadTest()
        {
            var (sim, topLevel) = Setup;

            var extData = 0x01020304;
            sim.ClockCycle(new AXI4RegisterModuleInputs(axiSize.B4) { Reg = { inWE = true, inWDATA = BitConverter.GetBytes(extData) } });
            Assert.AreEqual(extData, BitConverter.ToInt32(topLevel.outData));
            Assert.IsFalse(topLevel.S2M.R.R.RVALID);

            sim.ClockCycle(new AXI4RegisterModuleInputs(axiSize.B4)
            {
                M2S =
                {
                    R =
                    {
                        AR =
                        {
                            ARVALID = true
                        }
                    }
                }
            });
            Assert.AreEqual(topLevel.axiSlave.State.readFSM, axiSlaveReadFSM.Ack);
            Assert.IsTrue(topLevel.S2M.R.R.RVALID);
            Assert.AreEqual(extData, BitConverter.ToInt32(topLevel.S2M.R.R.RDATA));

            // make sure that slave waits for master ack
            sim.ClockCycle();

            Assert.AreEqual(topLevel.axiSlave.State.readFSM, axiSlaveReadFSM.Ack);
            Assert.IsTrue(topLevel.S2M.R.R.RVALID);
            Assert.AreEqual(extData, BitConverter.ToInt32(topLevel.S2M.R.R.RDATA));

            // ack
            sim.ClockCycle(new AXI4RegisterModuleInputs(axiSize.B4)
            {
                M2S =
                {
                    R =
                    {
                        R =
                        {
                            RREADY = true
                        }
                    }
                }
            });
            Assert.AreEqual(topLevel.axiSlave.State.readFSM, axiSlaveReadFSM.Idle);
            Assert.IsFalse(topLevel.S2M.R.R.RVALID);
        }
    }
}

