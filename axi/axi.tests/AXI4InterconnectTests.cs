using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL.Simulator;
using QuokkaIntegrationTests;
using axi.modules;
using System.Collections.Generic;
using System.Linq;

namespace axi.tests
{
    class AXI4ReadInteconnectModuleTest : AXI4ReadInteconnectModule
    {
        public AXI4ReadInteconnectModuleTest() : base(4, new List<RangeInfo> { new RangeInfo(0, 0) })
        {

        }
    }

    [TestClass]
    public class AXI4InterconnectTests : BaseRTLModuleTests
    {
        [TestMethod]
        public void AXI4ReadInteconnectModule()
        {
            var sim = new RTLSimulator<AXI4ReadInteconnectModuleTest, InterconnectModuleInputs<AXI4_M2S_R, AXI4_S2M_R>>();
            var tl = sim.TopLevel;
            tl.Schedule(() => new InterconnectModuleInputs<AXI4_M2S_R, AXI4_S2M_R>()
            {
                iLeft = new []
                {
                    new AXI4_M2S_R(axiSize.B4) { AR = { ARUSER = 0, ARVALID = true }, R = { RREADY = true } },
                    new AXI4_M2S_R(axiSize.B4) { AR = { ARUSER = 1, ARVALID = true }, R = { RREADY = true } },
                    new AXI4_M2S_R(axiSize.B4) { AR = { ARUSER = 2, ARVALID = true }, R = { RREADY = true } },
                    new AXI4_M2S_R(axiSize.B4) { AR = { ARUSER = 3, ARVALID = true }, R = { RREADY = true } },
                },
                iRight = new[]
                {
                    new AXI4_S2M_R(axiSize.B4) { AR = { ARREADY = true }, R = { RVALID = true } }
                }
            });
            sim.DeltaCycles();

            sim.ClockCycle();
            sim.ClockCycle();
            sim.ClockCycle();
            sim.ClockCycle();
            sim.ClockCycle();
        }


        [TestMethod]
        public void AXILikeInteconnectModule()
        {
            var sim = new RTLSimulator<AXILikeInteconnectModule, InterconnectModuleInputs<MData,SData>>();
        }
    }
}

