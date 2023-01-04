using fir.modules;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL;
using Quokka.RTL.Simulator;
using QuokkaIntegrationTests;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using fir.extension;
using Quokka.TCL.Vivado;
using System.IO;

namespace fir.tests
{
    [TestClass]
    public class FIRModuleTests : BaseRTLModuleTests
    {
        (RTLSimulator<FIRModule4x16, FIRModuleInputs>, FIRModule4x16) Setup([CallerMemberName] string testName = "")
        {
            var sim = new RTLSimulator<FIRModule4x16, FIRModuleInputs>(VCDOutputPath(testName), withTestbench: true);
            var topLevel = sim.TopLevel;
            return (sim, topLevel);
        }

        protected int[] range(int length)
        {
            return Enumerable.Range(0, length).ToArray();
        }

        [TestMethod]
        public void ClosureTest()
        {
            List<Func<int>> closures = new List<Func<int>>();

            foreach (var i in range(4))
            {
                closures.Add(() => i);
            }

            var values = closures.Select(c => c()).ToArray();
        }

        [TestMethod]
        public void CoeffFill()
        {
            // keep DO = 0
            var (sim, topLevel) = Setup();
            
            sim.ClockCycle(new FIRModuleInputs());
           
            for (var i = 1; i <= topLevel.firParams.Order * 2; i++)
            {
                sim.ClockCycle(new FIRModuleInputs() { iCOEF_V = true, iCOEFF = ((RTLBitArray)(i * 4)).Resized(16) });
            }

            sim.ClockCycle(new FIRModuleInputs());
            Assert.IsTrue(topLevel.oCOEF_RDY);

            for (var i = 1; i < 10; i++)
            {
                sim.ClockCycle(new FIRModuleInputs()
                {
                    iIQ_V = true,
                    iIQ = new t_iq16()
                    {
                        i = new RTLBitArray(i * 4).Resized(16),
                        q = new RTLBitArray(i * 4 * 2).Resized(16)
                    }
                });
            }

            var tb = sim.TBAdapter(Env.VHDL.RTLConfig);
            tb.Run(
                new TestbenchAdapterConfig()
                {
                    synth_design_mode = synth_design_mode.out_of_context, // too many pins to fit into device
                    launch_simulation_mode = launch_simulation_mode.post_synthesis,
                    AssetsLocation = Path.Combine(@"C:\code\qusoc\fir\fir.modules\assets", tb.moduleType)
                }
            );
        }
    }
}
