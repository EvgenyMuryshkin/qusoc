using Microsoft.VisualStudio.TestTools.UnitTesting;
using QRV32.ComplianceTools;

namespace QRV32.Compliance
{
    //[TestClass]
    public class RV32Zifencei : ComplianceTestsBase
    {
        public RV32Zifencei() : base(new QRV32ComplianceTestsBaseAdapter("rv32Zifencei", "rv32i")) { }
        protected override void RunAndAssert(string testName)
        {
            Assert.Inconclusive($"Test was disabled: {testName}");
        }

        [TestMethod]
        public void I_FENCE_I_01() => RunAndAssert("I-FENCE.I-01");
    }
}
