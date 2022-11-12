using Quokka.RTL;
using System;
using System.Linq;

namespace fir.modules
{
    public static class FIRTools
    {
        /// <summary>
        /// function returns total coefficient number for different decimation orders:
        /// 0 - g_order
        /// 1 - g_order * 2
        /// 2 - g_order * 4
        /// 3 - g_order * 8
        /// 4 - g_order * 16
        /// 5 - g_order * 32
        /// 6 - g_order * 64
        /// 7 - g_order * 128
        /// 8 - g_order * 256
        /// 9 - g_order * 512         
        /// </summary>
        /// <param name="g_order"></param>
        /// <returns></returns>
        public static int [] f_get_coef_num_array(int g_order)
        {
            return Enumerable.Range(0, 10).Select(idx => g_order * (int)Math.Pow(2, idx)).ToArray();
        }

        /// <summary>
        /// function returns coef mask for different decimation orders:
        /// 0 - "000000000"
        /// 1 - "000000001"
        /// 2 - "000000011"
        /// 3 - "000000111"
        /// 4 - "000001111"
        /// 5 - "000011111"
        /// 6 - "000111111"
        /// 7 - "001111111"
        /// 8 - "011111111"
        /// 9 - "111111111"        
        /// </summary>
        /// <param name="g_order"></param>
        /// <returns></returns>
        public static RTLBitArray[] f_get_coef_mask()
        {
            return Enumerable.Range(0, 10).Select(idx => new RTLBitArray("".PadLeft(9 - idx, '0').PadRight(9, '1'))).ToArray();
        }

        /// <summary>
        /// function returns data mask for different decimation orders:
        /// 0 - not used
        /// 1 - not used
        /// 2 - "0000000011"     (3)     + 3 = 6     = 2   + [2^2]
        /// 3 - "0000001011"     (11)    + 3 = 14    = 6   + [2^3]
        /// 4 - "0000011011"     (27)    + 3 = 30    = 14  + [2^4]
        /// 5 - "0000111011"     (59)    + 3 = 62    = 30  + [2^5]
        /// 6 - "0001111011"     (123)   + 3 = 126   = 62  + [2^6]
        /// 7 - "0011111011"     (251)   + 3 = 254   = 126 + [2^7]
        /// 8 - "0111111011"     (507)   + 3 = 510   = 254 + [2^8]
        /// 9 - "1111111011"     (1019)  + 3 = 1022  = 510 + [2^9]        
        /// </summary>
        /// <returns></returns>
        public static RTLBitArray[] f_get_data_mask()
        {
            var result = Enumerable.Range(0, 10).Select(_ => new RTLBitArray().Resized(10)).ToArray();
            var v_delay = 2;

            for (var a = 2; a < 10; a ++)
            {
                v_delay = v_delay + (int)Math.Pow(2, a);
                result[a] = new RTLBitArray(v_delay - 3)[9, 0];
            }

            return result;
        }

        public static int log2(int value)
        {
            if (value < 2)
                return 1;

            return (int)Math.Ceiling(Math.Log2(value));
        }
    }
}
