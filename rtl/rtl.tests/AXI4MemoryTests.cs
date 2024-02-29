using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL;
using Quokka.RTL.Simulator;
using QuokkaIntegrationTests;
using rtl.modules;
using System;
using System.Linq;

namespace RTL.Modules
{
    class AXI4MemoryModuleInputsBuilder : AXI4MemoryModuleInputs
    {
        public AXI4MemoryModuleInputsBuilder() : base(axiSize.B4)
        {

        }

        public AXI4MemoryModuleInputsBuilder WADDR(uint addr)
        {
            M2S.W.AW.AWADDR = addr;
            M2S.W.AW.AWVALID = true;
            return this;
        }

        public AXI4MemoryModuleInputsBuilder WDATA(byte[] data, byte wstrb = 0xF)
        {
            M2S.W.W.WDATA = data;
            M2S.W.W.WSTRB = new RTLBitArray(wstrb).Resized(4);
            M2S.W.W.WVALID = true;
            return this;
        }

        public AXI4MemoryModuleInputsBuilder BREADY()
        {
            M2S.W.B.BREADY = true;
            return this;
        }

        public AXI4MemoryModuleInputsBuilder RADDR(uint addr)
        {
            M2S.R.AR.ARADDR = addr;
            M2S.R.AR.ARVALID = true;
            return this;
        }

        public AXI4MemoryModuleInputsBuilder RREADY()
        {
            M2S.R.R.RREADY = true;
            return this;
        }
    }

    [TestClass]
    public class AXI4MemoryTests : BaseRTLModuleTests
    {
        (RTLSimulator<AXI4MemoryModuleB4, AXI4MemoryModuleInputs>, AXI4MemoryModuleB4) Setup(string vcdPath = null)
        {
            var sim = new RTLSimulator<AXI4MemoryModuleB4, AXI4MemoryModuleInputs>(vcdPath);
            var topLevel = sim.TopLevel;

            return (sim, topLevel);
        }

        RTLBitArray WSTRB_ALL => new RTLBitArray(RTLBitArrayInitType.MSB, true, true, true, true);

        [TestMethod]
        // TODO: sim fix - update outputs after commit
        public void ReadTest()
        {
            var (sim, topLevel) = Setup();
            topLevel.State.buff[0] = new byte[] { 1, 2, 3, 4 };
            topLevel.State.buff[1023] = new byte[] { 0xFF, 0x81, 0x76, 0xCC };

            sim.ClockCycles(
                null,
                () => new AXI4MemoryModuleInputs(axiSize.B4)
                {
                    M2S =
                    {
                        R =
                        {
                            AR =
                            {
                                ARADDR = 0,
                                ARVALID = true
                            }
                        }
                    }
                },
                () => topLevel.S2M.R.R.RVALID
            );

            Assert.AreEqual(BitConverter.ToInt32(topLevel.State.buff[0]), BitConverter.ToInt32(topLevel.S2M.R.R.RDATA));

            sim.ClockCycle(new AXI4MemoryModuleInputs(axiSize.B4)
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
            Assert.IsFalse(topLevel.S2M.R.R.RVALID);

            sim.ClockCycles(
                null,
                () => new AXI4MemoryModuleInputs(axiSize.B4)
                {
                    M2S =
                    {
                        R =
                        {
                            AR =
                            {
                                ARADDR = 1023,
                                ARVALID = true
                            }
                        }
                    }
                },
                () => topLevel.S2M.R.R.RVALID
            );

            sim.ClockCycle();
            sim.ClockCycle();

            Assert.AreEqual(BitConverter.ToInt32(topLevel.State.buff[1023]), BitConverter.ToInt32(topLevel.S2M.R.R.RDATA));
            sim.ClockCycle(new AXI4MemoryModuleInputs(axiSize.B4)
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
            Assert.IsFalse(topLevel.S2M.R.R.RVALID);
        }

        [TestMethod]
        public void WriteTest_SequentialTX()
        {
            var (sim, topLevel) = Setup();

            foreach (byte addr in Enumerable.Range(0, 10))
            {
                var data = new byte[] { addr, 1, 1, 1 };

                sim.ClockCycles(null, () => new AXI4MemoryModuleInputs(axiSize.B4), () => topLevel.S2M.W.AW.AWREADY);

                sim.ClockCycles(
                    null,
                    () => new AXI4MemoryModuleInputs(axiSize.B4)
                    {
                        M2S =
                        {
                            W =
                            {
                                AW =
                                {
                                    AWADDR = addr,
                                    AWVALID = true
                                }
                            }

                        }
                    },
                    () => !topLevel.S2M.W.AW.AWREADY
                );

                sim.ClockCycle(new AXI4MemoryModuleInputs(axiSize.B4));
                sim.ClockCycle(new AXI4MemoryModuleInputs(axiSize.B4));

                sim.ClockCycles(null, () => new AXI4MemoryModuleInputs(axiSize.B4), () => topLevel.S2M.W.W.WREADY);

                sim.ClockCycles(
                    null,
                    () => new AXI4MemoryModuleInputs(axiSize.B4)
                    {
                        M2S =
                        {
                            W =
                            {
                                W =
                                {
                                    WDATA = data,
                                    WSTRB = new RTLBitArray(RTLBitArrayInitType.MSB, true, true, true, true),
                                    WVALID = true
                                }
                            }

                        }
                    },
                    () => !topLevel.S2M.W.W.WREADY
                );

                sim.ClockCycle(new AXI4MemoryModuleInputs(axiSize.B4));
                sim.ClockCycle(new AXI4MemoryModuleInputs(axiSize.B4));

                Assert.IsTrue(topLevel.S2M.W.B.BVALID);

                sim.ClockCycles(
                    null,
                    () => new AXI4MemoryModuleInputs(axiSize.B4)
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
                    },
                    () => !topLevel.S2M.W.B.BVALID
                );

                sim.ClockCycle(new AXI4MemoryModuleInputs(axiSize.B4));
                sim.ClockCycle(new AXI4MemoryModuleInputs(axiSize.B4));

                Assert.AreEqual((0x01010100 | addr), BitConverter.ToInt32(topLevel.State.buff[addr]));
            }
        }


        [TestMethod]
        public void WriteTest_SameTX()
        {
            var (sim, topLevel) = Setup();
            sim.ClockCycles(
                null,
                () => new AXI4MemoryModuleInputs(axiSize.B4)
                {
                    M2S =
                    {
                        W =
                        {
                            AW =
                            {
                                AWADDR = 0,
                                AWVALID = true
                            },
                            W =
                            {
                                WDATA = new byte [] { 1, 1, 1, 1 },
                                WSTRB = new RTLBitArray(RTLBitArrayInitType.MSB, true, true, true, true),
                                WVALID = true
                            }
                        }
                    }
                }, 
                () => topLevel.S2M.W.B.BVALID
            );
            Assert.AreEqual(0x01010101, BitConverter.ToInt32(topLevel.State.buff[0]));

            sim.ClockCycles(
                null,
                () => new AXI4MemoryModuleInputs(axiSize.B4)
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
                }, 
                () => !topLevel.S2M.W.B.BVALID
            );

            sim.ClockCycle();

            sim.ClockCycles(
                null,
                () => new AXI4MemoryModuleInputs(axiSize.B4)
                {
                    M2S =
                    {
                        W =
                        {
                            AW =
                            {
                                AWADDR = 10,
                                AWVALID = true
                            },
                            W =
                            {
                                WDATA = new byte [] { 0xFF, 0xFF, 0xFF, 0xFF },
                                WSTRB = new RTLBitArray(RTLBitArrayInitType.MSB, false, true, false, true),
                                WVALID = true
                            }
                        }

                    }
                }, 
                () => topLevel.S2M.W.B.BVALID
            );
            Assert.AreEqual(0x00FF00FF, BitConverter.ToInt32(topLevel.State.buff[10]));
        }

        [TestMethod]
        public void WriteReadTest()
        {
            var (sim, topLevel) = Setup(VCDOutputPath());

            sim.ClockCycle(
                new AXI4MemoryModuleInputsBuilder()
                    .WADDR(0x10)
                    .WDATA(new byte[] { 1, 2, 3, 4 })
            );

            sim.ClockCycle(
                new AXI4MemoryModuleInputsBuilder() 
                    .BREADY()
                    .RADDR(0x10)
            );

            sim.ClockCycle(
                new AXI4MemoryModuleInputsBuilder()
                    .WADDR(0x11)
                    .RREADY()
            );

            sim.ClockCycle(
                new AXI4MemoryModuleInputsBuilder()
                    .WDATA(new byte[] { 10, 20, 30, 40 })
            );

            sim.ClockCycle(
                new AXI4MemoryModuleInputsBuilder()
                    .BREADY()
                    .RADDR(0x11)
            );

            sim.ClockCycle(
                new AXI4MemoryModuleInputsBuilder()
                    .BREADY()
            );

            sim.ClockCycle();
        }
    }
}
