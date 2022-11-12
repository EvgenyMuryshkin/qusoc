using fir.modules;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Linq;

namespace fir.tests
{
    [TestClass]
    public class FIRToolsTests
    { 
        [TestMethod]
        public void f_get_coef_num_array()
        {
            var data = FIRTools.f_get_coef_num_array(32);
            Assert.AreEqual(32, data[0]);
            Assert.AreEqual(32 * 512, data[9]);
        }

        [TestMethod]
        public void f_get_coef_mask()
        {
            var data = FIRTools.f_get_coef_mask();
            Assert.AreEqual("000000000", data[0].AsBinaryString());
            Assert.AreEqual("111111111", data[9].AsBinaryString());
        }

        [TestMethod]
        public void f_get_data_mask()
        {
            var data = FIRTools.f_get_data_mask();
            Assert.AreEqual("0000000011", data[2].AsBinaryString());
            Assert.AreEqual("1111111011", data[9].AsBinaryString());
        }

        [TestMethod]
        public void log2()
        {
            Assert.AreEqual(1, FIRTools.log2(2));
            Assert.AreEqual(6, FIRTools.log2(64));
            Assert.AreEqual(7, FIRTools.log2(65));
            Assert.AreEqual(7, FIRTools.log2(127));
            Assert.AreEqual(7, FIRTools.log2(128));
        }
    }
}
