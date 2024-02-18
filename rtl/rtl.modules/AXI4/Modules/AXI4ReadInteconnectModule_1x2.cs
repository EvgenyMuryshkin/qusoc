using Quokka.RTL;
using RTL.Modules;
using System.Collections.Generic;
using System.Linq;

namespace rtl.modules.AXI4.Modules
{
    public class AXI4ReadInteconnectModule_1x2 : AXI4ReadInteconnectModule
    {
        public AXI4ReadInteconnectModule_1x2() : base(
            1, 
            new List<RangeInfo>()
            {
                new RangeInfo(0x00000000, 0x0FFFFFFF),
                new RangeInfo(0x10000000, 0x10000000)
            })
        {

        }
        public bool[] oTransactions => Transactions;
        public RTLBitArray[] oRangeDetectorIndex => rangeDetectorArray.Select(r => r.oIndex).ToArray();
        //public bool[] oRangeDetectorActive => rangeDetectorArray.Select(r => r.oActive).ToArray();
        public RTLBitArray oStateRightAddr => State.rightAddr;
        public bool oStateRightAddrValid => State.rightAddrValid;
        public RTLBitArray oNextRightAddr => rightAddr;

        public AXI4_M2S_R[] oLeft => muxLeft;
        public AXI4_S2M_R[] oRight => muxRight;
    }
}
