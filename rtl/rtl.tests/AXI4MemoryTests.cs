using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL;
using Quokka.RTL.Simulator;
using rtl.modules;
using System;

namespace RTL.Modules
{
    [TestClass]
    public class AXI4MemoryTests : BaseRTLModuleTests
    {
        (RTLSimulator<AXI4MemoryModuleB4, AXI4MemoryModuleInputs>, AXI4MemoryModuleB4) Setup
        {
            get
            {
                var sim = new RTLSimulator<AXI4MemoryModuleB4, AXI4MemoryModuleInputs>();
                var topLevel = sim.TopLevel;
                sim.ClockCycle();

                return (sim, topLevel);
            }
        }

        [TestMethod]
        public void ReadTest()
        {
            var  (sim, topLevel) = Setup;
            topLevel.State.buff[0] = new byte[] { 1, 2, 3, 4 };
            topLevel.State.buff[1023] = new byte[] { 0xFF, 0x81, 0x76, 0xCC };

            sim.ClockCycles(() => new AXI4MemoryModuleInputs(axiSize.B4)
            {
                M2S =
                {
                    AR =
                    {
                        ARADDR = 0,
                        ARVALID = true
                    }
                }
            }, () => !topLevel.S2M.R.RVALID);
            Assert.AreEqual(BitConverter.ToInt32(topLevel.State.buff[0]), BitConverter.ToInt32(topLevel.S2M.R.RDATA));
            sim.ClockCycle(new AXI4MemoryModuleInputs(axiSize.B4)
            {
                M2S =
                {
                    R =
                    {
                        RREADY = true
                    }
                }
            });
            Assert.IsFalse(topLevel.S2M.R.RVALID);

            sim.ClockCycles(() => new AXI4MemoryModuleInputs(axiSize.B4)
            {
                M2S =
                {
                    AR =
                    {
                        ARADDR = 1023,
                        ARVALID = true
                    }
                }
            }, () => !topLevel.S2M.R.RVALID);
            Assert.AreEqual(BitConverter.ToInt32(topLevel.State.buff[1023]), BitConverter.ToInt32(topLevel.S2M.R.RDATA));
            sim.ClockCycle(new AXI4MemoryModuleInputs(axiSize.B4)
            {
                M2S =
                {
                    R =
                    {
                        RREADY = true
                    }
                }
            });
            Assert.IsFalse(topLevel.S2M.R.RVALID);
        }

        [TestMethod]
        public void WriteTest()
        {
            var (sim, topLevel) = Setup;
            sim.ClockCycles(() => new AXI4MemoryModuleInputs(axiSize.B4)
            {
                M2S =
                {
                    AW =
                    {
                        AWADDR = 0,
                        AWVALID = true
                    },
                    W =
                    {
                        WDATA = new byte [] { 1, 1, 1, 1 },
                        WSTRB = new RTLBitArray(true, true, true, true),
                        WVALID = true
                    }
                }
            }, () => !topLevel.S2M.B.BVALID);
            Assert.AreEqual(0x01010101, BitConverter.ToInt32(topLevel.State.buff[0]));

            sim.ClockCycles(() => new AXI4MemoryModuleInputs(axiSize.B4)
            {
                M2S =
                {
                    B =
                    {
                        BREADY = true
                    }
                }
            }, () => topLevel.S2M.B.BVALID);

            sim.ClockCycles(() => new AXI4MemoryModuleInputs(axiSize.B4)
            {
                M2S =
                {
                    AW =
                    {
                        AWADDR = 10,
                        AWVALID = true
                    },
                    W =
                    {
                        WDATA = new byte [] { 0xFF, 0xFF, 0xFF, 0xFF },
                        WSTRB = new RTLBitArray(false, true, false, true),
                        WVALID = true
                    }
                }
            }, () => !topLevel.S2M.B.BVALID);
            Assert.AreEqual(0x00FF00FF, BitConverter.ToInt32(topLevel.State.buff[10]));

        }
    }
}

