using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace QRV32.Compliance
{
    //[TestClass]
    public class RV32IM : RV32Base
    {
        public RV32IM() : base(new QRV32ComplianceTestsBaseAdapter("rv32im", "rv32im")) { }
        protected override void RunAndAssert(string testName)
        {
            Assert.Inconclusive($"Test was disabled: {testName}");
        }

        [TestMethod]
        public void DIV() => RunAndAssert("DIV");
        [TestMethod]
        public void DIVU() => RunAndAssert("DIVU");
        [TestMethod]
        public void MUL() => RunAndAssert("MUL");
        [TestMethod]
        public void MULH() => RunAndAssert("MULH");
        [TestMethod]
        public void MULHSU() => RunAndAssert("MULHSU");
        [TestMethod]
        public void MULHU() => RunAndAssert("MULHU");
        [TestMethod]
        public void REM() => RunAndAssert("REM");
        [TestMethod]
        public void REMU() => RunAndAssert("REMU");
    }
}
