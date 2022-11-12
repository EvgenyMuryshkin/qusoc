using Quokka.RTL;
using System.Linq;

namespace fir.modules
{
    public struct t_filo
    {
        public t_filo(int order)
        {
            filo_way = false;
            filo_counter_inc = new RTLBitArray(uint.MaxValue).Resized(9);
            filo_counter_dec = new RTLBitArray().Resized(9);
            filo_addr_inc = new RTLBitArray().Resized(9);
            filo_addr_dec = new RTLBitArray().Resized(9);
            filo_addr_p = new RTLBitArray().Resized(9);
            filo_addr_p1 = new RTLBitArray().Resized(9);

            fir_dreg = Enumerable.Range(0, order).Select(_ => new t_iq16()).ToArray();
        }

        public bool filo_way;
        public RTLBitArray filo_counter_inc;
        public RTLBitArray filo_counter_dec;
        public RTLBitArray filo_addr_inc;
        public RTLBitArray filo_addr_dec;
        public RTLBitArray filo_addr_p;
        public RTLBitArray filo_addr_p1;
        public t_iq16[] fir_dreg;
    }
}
