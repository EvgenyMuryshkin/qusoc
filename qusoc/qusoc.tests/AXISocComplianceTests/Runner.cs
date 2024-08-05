using Microsoft.VisualStudio.TestTools.UnitTesting;
using QRV32.ComplianceTools;

namespace AXISoC.ComplianceTests
{
    [TestClass]
    public class Runner : ComplianceTestsBase
    {
        public Runner() : base(new AXISoCComplianceTestsBaseAdapter("runner", "rv32i")) { }

        [TestMethod]
        public void I_ShouldPass() => RunAndAssert("I-ShouldPass");

        [TestMethod]
        public void I_ShouldFail()
        {
            Assert.ThrowsException<AssertFailedException>(() => RunAndAssert("I-ShouldFail"));
        }
    }
}
