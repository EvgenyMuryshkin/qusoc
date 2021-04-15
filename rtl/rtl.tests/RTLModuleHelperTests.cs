using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL;
using Quokka.RTL.Tools;
using System;
using System.Collections.Generic;
using System.Text;

namespace Experimental.Tests
{
    enum EmptyEnum
    {

    }

    enum OneStateZero
    {
        Stage1
    }

    enum OneStateOne
    {
        Stage1 = 1
    }
    enum OneStateTwo
    {
        Stage1 = 2
    }
    enum OneStateThree
    {
        Stage1 = 3
    }
    enum OneStateFour
    {
        Stage1 = 4
    }
    enum BitMask
    {
        None,
        Bit1 = 1,
        Bit2 = 2,
        Bit3 = 4,
        Bit4 = 8,
        Bit5 = 16,
        Bit6 = 32,
        Bit8 = 128
    }

    [TestClass]
    public class RTLModuleHelperTests
    {
        [TestMethod]
        public void EnumSizeTest()
        {
            Assert.AreEqual(1, RTLSignalTools.SizeOf(typeof(EmptyEnum)).Size);
            Assert.AreEqual(1, RTLSignalTools.SizeOf(typeof(OneStateZero)).Size);
            Assert.AreEqual(1, RTLSignalTools.SizeOf(typeof(OneStateOne)).Size);
            Assert.AreEqual(2, RTLSignalTools.SizeOf(typeof(OneStateTwo)).Size);
            Assert.AreEqual(2, RTLSignalTools.SizeOf(typeof(OneStateThree)).Size);
            Assert.AreEqual(3, RTLSignalTools.SizeOf(typeof(OneStateFour)).Size);
            Assert.AreEqual(8, RTLSignalTools.SizeOf(typeof(BitMask)).Size);
        }
    }
}
