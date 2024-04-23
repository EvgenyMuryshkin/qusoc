using System.Collections.Generic;

namespace axi.modules
{
    public class AXI4InteconnectModule_2x2 : AXI4InteconnectModule
    {
        public AXI4InteconnectModule_2x2() 
            : base(axiSize.B4, 2, new List<RangeInfo>()
            {
                new RangeInfo(0x00000000, 0x0FFFFFFF),
                new RangeInfo(0x10000000, 0x10000000)
            })
        {

        }
    }
}
