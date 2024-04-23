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
    }
}
