using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace QuSoC.Tests
{
    struct FloatComponents
    {
        public bool Sign;
        public byte Exp;
        public ulong Mantissa;
    }

    public class SoftFP
    {
        static int mantissaBits = 23;
        static int roundingBits = 27;
        static uint mantissaMask => 0x7FFFFF;
        static ulong overflowFlag => (ulong)(0x01000000UL << roundingBits);
        static ulong baseFlag => (ulong)(0x800000UL << roundingBits);
        static ulong underflowFlags => overflowFlag | baseFlag;
        static ulong roundingBit => (ulong)(1UL << roundingBits);
        static ulong roundingGBit => (ulong)(1UL << (roundingBits - 1));
        static ulong roundingMask => roundingBit - 1;
        static ulong roundingMaskInverted => roundingMask ^ ulong.MaxValue;

        static bool Round(ref ulong mantissa)
        {
            var grs = mantissa & roundingMask;
            if (grs < roundingGBit)
                return false;

            if (grs == roundingGBit && (mantissa & roundingBit) == 0)
                return false;

            mantissa += roundingGBit;
            mantissa &= roundingMaskInverted;

            return true;
        }

        static void ShiftRight(ref ulong mantissa, ref byte exp)
        {
            mantissa = mantissa >> 1;
            exp++;
        }

        static void Neg(ref ulong value)
        {
            value = value ^ ulong.MaxValue;
            value += 1;
        }

        static FloatComponents Deconstruct(float f)
        {
            var u = BitConverter.SingleToUInt32Bits(f);

            bool sign = (u >> 31) == 1;
            byte exp = (byte)(u >> mantissaBits);
            ulong mantissa = u & mantissaMask;
            if (exp != 0)
                mantissa = mantissa | 0x800000;
            mantissa = mantissa << roundingBits;

            return new FloatComponents() { Sign = sign, Exp = exp, Mantissa = mantissa };
        }

        static FloatComponents DeconstructMultiply(float f)
        {
            var u = BitConverter.SingleToUInt32Bits(f);

            bool sign = (u >> 31) == 1;
            byte exp = (byte)(u >> mantissaBits);
            ulong mantissa = u & mantissaMask;
            if (exp != 0)
                mantissa = mantissa | 0x800000;

            return new FloatComponents() { Sign = sign, Exp = exp, Mantissa = mantissa };
        }

        static uint Construct(FloatComponents r)
        {
            uint resValue = (uint)((r.Mantissa >> roundingBits)) & mantissaMask;

            resValue |= ((uint)r.Exp << mantissaBits);

            if (r.Sign)
                resValue |= 0x80000000;

            return resValue;
        }

        public static float Multiply(float aValue, float bValue)
        {
            var a = DeconstructMultiply(aValue);
            var b = DeconstructMultiply(bValue);

            int exp = (a.Exp + b.Exp) - (127 * 2);
            var r = new FloatComponents() { Sign = a.Sign ^ b.Sign, Exp = (byte)(exp + 127) };

            r.Mantissa = a.Mantissa * b.Mantissa;
            r.Mantissa = r.Mantissa << 4;

            do
            {
                if ((r.Mantissa & overflowFlag) != 0)
                    ShiftRight(ref r.Mantissa, ref r.Exp);

                if (r.Exp == 255)
                {
                    if (r.Sign)
                        return float.NegativeInfinity;

                    return float.PositiveInfinity;
                }

                if (!Round(ref r.Mantissa))
                    break;
            }
            while (true);

            if (r.Exp == 0 && ((r.Mantissa & baseFlag) != 0))
                r.Exp++;

            uint resValue = Construct(r);
            var resFloat = BitConverter.UInt32BitsToSingle(resValue);

            return resFloat;
        }

        public static float Add(float aValue, float bValue)
        {
            var a = Deconstruct(aValue);
            var b = Deconstruct(bValue);

            if (a.Exp == b.Exp && a.Mantissa == b.Mantissa && a.Sign != b.Sign)
                return 0;

            while (b.Exp != a.Exp)
            {
                if (b.Exp < a.Exp)
                {
                    ShiftRight(ref b.Mantissa, ref b.Exp);
                }
                else
                {
                    ShiftRight(ref a.Mantissa, ref a.Exp);
                }
            }

            var r = new FloatComponents() { Sign = a.Sign, Exp = a.Exp };
            var sameSign = a.Sign == b.Sign;

            if (!sameSign)
            {
                r.Sign = a.Sign
                    ? a.Mantissa > b.Mantissa
                    : a.Mantissa < b.Mantissa;

                if (a.Sign)
                {
                    Neg(ref a.Mantissa);
                }
                else
                {
                    Neg(ref b.Mantissa);
                }
            }

            r.Mantissa = a.Mantissa + b.Mantissa;

            if (!sameSign && r.Sign)
            {
                Neg(ref r.Mantissa);
            }

            while (r.Exp != 0 && (r.Mantissa & underflowFlags) == 0)
            {
                if (r.Mantissa == 0)
                {
                    r.Exp = 0;
                    break;
                }

                r.Mantissa = r.Mantissa << 1;
                r.Exp--;
            }

            do
            {
                if ((r.Mantissa & overflowFlag) != 0)
                    ShiftRight(ref r.Mantissa, ref r.Exp);

                if (r.Exp == 255)
                {
                    if (r.Sign)
                        return float.NegativeInfinity;

                    return float.PositiveInfinity;
                }

                if (!Round(ref r.Mantissa))
                    break;
            }
            while (true);

            if (r.Exp == 0 && ((r.Mantissa & baseFlag) != 0) && sameSign)
                r.Exp++;

            uint resValue = Construct(r);
            var resFloat = BitConverter.UInt32BitsToSingle(resValue);

            return resFloat;
        }
    }

    [TestClass]
    public class SoftFPTests
    {
        bool bulkMode = false;
        int totalBulk = 0;
        int failedBulk = 0;

        void genericFloatOp(
            float a,
            float b,
            float expected,
            Func<float, float, float> actualFactory)
        {
            if (bulkMode)
            {
                totalBulk++;

                var actual = actualFactory(a, b);
                var resultUnsigned = BitConverter.SingleToUInt32Bits(actual);
                var fpuUnsigned = BitConverter.SingleToUInt32Bits(expected);

                if (resultUnsigned != fpuUnsigned)
                {
                    failedBulk++;

                    var delta = Math.Max(resultUnsigned, fpuUnsigned) - Math.Min(resultUnsigned, fpuUnsigned);
                    if (delta > 1)
                    {
                        Assert.AreEqual(expected, actual);
                    }
                }
            }
            else
            {
                var actual = actualFactory(a, b);

                if (expected != actual)
                    Assert.AreEqual(expected, actual);
            }
        }

        [TestMethod]
        public void SoftFP_Multiply()
        {
            bulkMode = false;
            totalBulk = 0;
            failedBulk = 0;

            Action<float, float> floatOp = (a, b) =>
            {
                genericFloatOp(a, b, a * b, SoftFP.Multiply);
                genericFloatOp(a, -b, a * -b, SoftFP.Multiply);
                genericFloatOp(-a, b, -a * b, SoftFP.Multiply);
                genericFloatOp(-a, -b, -a * -b, SoftFP.Multiply);
                genericFloatOp(1e10f * a, b, 1e10f * a * b, SoftFP.Multiply);
            };

            floatOp(1f, 1f);
            floatOp(0.5f, 0.5f);

            var rnd = new Random();
            for (var i = 0; i < 10000000; i++)
            {
                var f1 = (float)rnd.NextDouble();
                var f2 = (float)rnd.NextDouble();
                floatOp(f1, f2);
            }
        }

        [TestMethod]
        public void SoftFP_Add()
        {
            bulkMode = false;
            totalBulk = 0;
            failedBulk = 0;

            Action<float, float> floatOp = (a, b) =>
            {
                genericFloatOp(a, b, a + b, SoftFP.Add);
                //genericFloatOp(a, -b, a - b, SoftFP.Add);
                //genericFloatOp(-a, b, -a + b, SoftFP.Add);
                //genericFloatOp(-a, -b, -a - b, SoftFP.Add);
                //genericFloatOp(1e10f + a, b, 1e10f + a + b, SoftFP.Add);
                //genericFloatOp(1e10f * a, b, 1e10f * a + b, SoftFP.Add);
                //genericFloatOp(a, -1e10f + b, a + -1e10f + b, SoftFP.Add);
                //genericFloatOp(a, -1e10f * b, a + -1e10f * b, SoftFP.Add);
            };

            floatOp(float.MaxValue, float.MaxValue);
            floatOp(float.MinValue, float.MinValue);
            floatOp(float.MinValue, float.MaxValue);
            floatOp(float.Epsilon, float.Epsilon);
            floatOp(5.877472e-39f, 5.877472e-39f);
            floatOp(1.1754942e-38f, 1e-45f);
            floatOp(1.1754941e-38f, -1.1754942e-38f);
            floatOp(1.1754944e-38f, -float.Epsilon);

            floatOp(0.556257248f, 0.500910938f);
            floatOp(0.444681585f, 0.299055785f);
            floatOp(0.5499884f, 0.212284908f);
            floatOp(0.931204557f, 0.104905911f);
            floatOp(0.0076710307f, 0.952018857f);
            floatOp(0.123259649f, 0.876740336f);
            floatOp(0.0007939787f, 0.379645854f);
            floatOp(0.362758845f, 0.000253781764f);

            floatOp(-0.00204727077f, 0.59962666f);
            floatOp(0.00204727077f, -0.59962666f);
            floatOp(-0.59962666f, 0.00204727077f);
            floatOp(0.59962666f, -0.00204727077f);

            floatOp(-0.4337583f, 0.0008127541f);

            floatOp(1, -1f);

            floatOp(1000f, 0.5f);
            floatOp(1000f, -0.5f);
            floatOp(1024f, -1f);
            floatOp(12.75f, -12.5f);
            floatOp(12.5f, 77.25f);
            floatOp(-12.5f, -77.25f);

            floatOp(12.5f, -77.25f);
            floatOp(77.25f, -12.5f);
            floatOp(-12.5f, 77.25f);
            floatOp(-77.25f, 12.5f);

            floatOp(-0.184847608f, 0.9391488f); // need rounding
            floatOp(-0.0205731746f, 0.041971f); // does not need rounding

            bulkMode = true;
            var rnd = new Random();

            for (var i = 0; i < 10000000; i++)
            {
                var f1 = (float)rnd.NextDouble();
                var f2 = (float)rnd.NextDouble();
                floatOp(f1, f2);
            }
            Assert.AreEqual(0, failedBulk);

            for (var i = 0; i < 10000000; i++)
            {
                var f1 = -(float)rnd.NextDouble();
                var f2 = -(float)rnd.NextDouble();
                floatOp(f1, f2);
            }
            Assert.AreEqual(0, failedBulk);

            for (var i = 0; i < 10000000; i++)
            {
                var f1 = -(float)rnd.NextDouble();
                var f2 = (float)rnd.NextDouble();
                floatOp(f1, f2);
            }
            Assert.AreEqual(0, failedBulk);

            for (var i = 0; i < 10000000; i++)
            {
                var f1 = (float)rnd.NextDouble();
                var f2 = -(float)rnd.NextDouble();
                floatOp(f1, f2);
            }
            Assert.AreEqual(0, failedBulk);

            for (var i = 0; i < 10000000; i++)
            {
                var f1 = -(float)(rnd.NextDouble() * 1e+25);
                var f2 = (float)rnd.NextDouble();
                floatOp(f1, f2);
            }
            Assert.AreEqual(0, failedBulk);

        }
    }
}
