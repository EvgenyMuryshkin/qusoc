using fir.modules;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL;
using Quokka.RTL.Simulator;
using QuokkaIntegrationTests;

namespace fir.tests
{
    [TestClass]
    public class FIRTests : BaseRTLModuleTests
    {
        FIRParams _params = new FIRParams(4, 16, 16, 4, 2, 8);
        RTLBitArray Value(int value, int? size = null) => new RTLBitArray(value).Resized(size ?? _params.IQSizeIn);

        [TestMethod]
        public void FIRStageDSPModuleTest()
        {
            var sim = new RTLInstanceSimulator<FIRStageDSPModule16, FIRStageDSPInputs>(new FIRStageDSPModule16(), VCDOutputPath());
            var topLevel = sim.TopLevel;
            sim.ClockCycle(new FIRStageDSPInputs(_params) { iIQ = Value(1) }); // feed data
            sim.ClockCycle(new FIRStageDSPInputs(_params)); // to iq2.q
            sim.ClockCycle(new FIRStageDSPInputs(_params) { iFILO = Value(10), iCoeff = Value(10) }); // add, satge coeff
            sim.ClockCycle(new FIRStageDSPInputs(_params)); // mul
            sim.ClockCycle(new FIRStageDSPInputs(_params) { iAccum = Value(42, _params.AccumSize), iInternalFeedbackSelector = true }); // accum

            // assert
            Assert.AreEqual(152, (int)topLevel.oAccum);
        }
    }
}
