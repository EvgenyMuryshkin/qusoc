using Quokka.RTL;
using System.Linq;

namespace fir.modules
{
    public struct t_coeff
    {
        public t_coeff(int order)
        {
            coef_wr_cnt_cell = new RTLBitArray().Resized(8);
            coef_wr_cnt_ram = new RTLBitArray().Resized(FIRTools.log2(order));
            coef_ram_wr = new RTLBitArray().Resized(order);
            coef_ram_wr_addr = Enumerable.Range(0, order).Select(_ => new RTLBitArray().Resized(9)).ToArray();
            coef_ram_wr_data = Enumerable.Range(0, order).Select(_ => new RTLBitArray().Resized(16)).ToArray();
            coef_ram_cnt = new RTLBitArray().Resized(16);
        }

        public RTLBitArray coef_wr_cnt_cell;
        public RTLBitArray coef_wr_cnt_ram;
        public RTLBitArray coef_ram_wr;// this has reversed range (0 to g_order-1)
        public RTLBitArray[] coef_ram_wr_addr;
        public RTLBitArray[] coef_ram_wr_data;
        public RTLBitArray coef_ram_cnt;
    }
}
