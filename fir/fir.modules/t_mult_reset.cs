using Quokka.RTL;

namespace fir.modules
{
    public struct t_mult_reset
    {
        public t_mult_reset(int order)
        {
            mult_reset = new RTLBitArray().Resized(order);
            mult_reset_dsp = new RTLBitArray().Resized(order);

            mult_reset_common = false;
            mult_reset_common_p = false;
            mult_reset_common_p1 = false;
            mult_reset_common_p2 = false;
            mult_reset_common_p3 = false;
        }

        public RTLBitArray mult_reset;
        public RTLBitArray mult_reset_dsp;

        public bool mult_reset_common;
        public bool mult_reset_common_p;
        public bool mult_reset_common_p1;
        public bool mult_reset_common_p2;
        public bool mult_reset_common_p3;
    }
}
