using Quokka.RTL;
using System;
using System.Linq;

namespace axi.modules
{
    public static class AXI4Tools
    {
        public static int Bytes(axiSize size)
        {
            return 1 << (int)size;
        }

        public static int AddressLSB(axiSize size)
        {
            return AXITools.log2(Bytes(size));
        }

        public static int Bits(axiSize size) => Bytes(size) * 8;

        public static void EnsurePowerOf2(int value, string message)
        {
            var bitsCount = new RTLBitArray(value).LSB.Where(b => b).Count();

            if (value < 2 || bitsCount != 1)
                throw new Exception($"{message}: provided value {value} is not power of 2");
        }
    }
}
