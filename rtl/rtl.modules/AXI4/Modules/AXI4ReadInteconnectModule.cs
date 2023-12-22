using Quokka.RTL;
using RTL.Modules;
using System;
using System.Collections.Generic;

namespace rtl.modules.AXI4.Modules
{
    public class AXI4ReadInteconnectModule : InterconnectModule<AXI4_M2S_R, AXI4_S2M_R>
    {
        RangeDetectorArrayModule rangeDetectorArray;

        public AXI4ReadInteconnectModule(int mCount, List<RangeInfo> slaveRange)
            : base(mCount, () => new AXI4_M2S_R(axiSize.B4), slaveRange.Count, () => new AXI4_S2M_R(axiSize.B4))
        {
            rangeDetectorArray = new RangeDetectorArrayModule(slaveRange);
        }

        protected override void OnSchedule(Func<InterconnectModuleInputs<AXI4_M2S_R, AXI4_S2M_R>> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            rangeDetectorArray.Schedule(() => new RangeDetectorArrayModuleInputs()
            { 
                iAddress = muxLeftData.AR.ARADDR
            });
        }

        protected override RTLBitArray RightAddr()
        {
            return rangeDetectorArray.oIndex;
        }

        protected override bool TXEnd(AXI4_M2S_R source) => source.R.RREADY && muxRightData.R.RVALID;
        protected override bool TXStart(AXI4_M2S_R source) => source.AR.ARVALID;
    }

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
    }
}
