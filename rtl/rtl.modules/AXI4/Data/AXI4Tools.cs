namespace RTL.Modules
{
    public static class AXI4Tools
    {
        public static int Bytes(axiSize size)
        {
            return 1 << (int)size;
        }

        public static int Bits(axiSize size) => Bytes(size) * 8;
    }
}
