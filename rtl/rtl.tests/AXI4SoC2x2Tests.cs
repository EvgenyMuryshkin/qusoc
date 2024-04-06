using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL.Simulator;
using QuokkaIntegrationTests;
using rtl.modules;

namespace RTL.Modules
{
    [TestClass]
    public class AXI4SoC2x2Tests : BaseRTLModuleTests
    {
        [TestMethod]
        public void AXI4SoC2x2Module()
        {
            var sim = new RTLSimulator<AXI4SoC2x2, AXI4SoC2x2Inputs>();
            sim.ClockCycle();
            var topLevel = sim.TopLevel;

            var setReg0 = new AXI4SoC2x2Inputs(axiSize.B4, 2, 2);
            setReg0.RegInputs[0].inWE = true;
            setReg0.RegInputs[0].inWDATA = new byte[] { 1, 2, 3, 4 };
            while (!topLevel.outRegs[0].outWritten)
            {
                sim.ClockCycle(setReg0);
            }
            
            var i = new AXI4SoC2x2Inputs(axiSize.B4, 2, 2);
            i.MasterInputs[0].RE = true;

            do
            {
                sim.ClockCycle(i);
            }
            while (!topLevel.outMasters[0].outRACK);

            sim.ClockCycle(new AXI4SoC2x2Inputs(axiSize.B4, 2, 2));

            var i1 = new AXI4SoC2x2Inputs(axiSize.B4, 2, 2);
            i1.MasterInputs[1].RE = true;
            do
            {
                sim.ClockCycle(i1);
            }
            while (!topLevel.outMasters[1].outRACK);
        }
    }
}

