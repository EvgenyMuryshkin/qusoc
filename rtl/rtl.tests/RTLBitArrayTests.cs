using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL;
using Quokka.RTL.Tools;

namespace Experimental.Tests
{
    class TestClass
    {
        public TestClass(byte[] values)
        {

        }
    }

    [TestClass]
    public class CESTests
    {

        [TestMethod]
        public void CESCtor()
        {
            var result = new RTLBitArray(RTLBitArrayInitType.MSB, RTLDataType.Signed, "11000", 10);

            var c1 = new TestClass([1,2,3,4]);
            //var c2 = new TestClass(new[] { 1, 2, 3, 4 });
        }
    }
}
