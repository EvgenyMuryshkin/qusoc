using Quokka.RTL;
using System.Linq;

namespace fir.modules
{
    public struct t_main
    {
        public t_main(int order)
        {
            main_c_cnt =  new RTLBitArray().Resized(9);
            main_c_cnt_masked = new RTLBitArray().Resized(9);
            main_c_rd_addr_cmn = new RTLBitArray().Resized(9);
            main_c_rd_addr = Enumerable.Range(0, order).Select(_ => new RTLBitArray().Resized(9)).ToArray();

            main_d_cnt = new RTLBitArray().Resized(10);
            main_d_cnt_masked = new RTLBitArray().Resized(10);

            main_d_cnt_rst = false;
            main_d_addr = Enumerable.Range(0, order).Select(_ => new RTLBitArray().Resized(10)).ToArray();
        }

        public RTLBitArray main_c_cnt;
        public RTLBitArray main_c_cnt_masked;
        public RTLBitArray main_c_rd_addr_cmn;
        public RTLBitArray[] main_c_rd_addr;

        public RTLBitArray main_d_cnt;
        public RTLBitArray main_d_cnt_masked;

        public bool main_d_cnt_rst;
        public RTLBitArray[] main_d_addr;
    }
}
