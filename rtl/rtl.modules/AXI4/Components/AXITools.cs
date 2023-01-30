using System;

namespace rtl.modules
{
    public static class AXITools
    {
        public static int log2(int value)
        {
            if (value < 2)
                return 1;

            return (int)Math.Ceiling(Math.Log2(value));
        }
    }
}
