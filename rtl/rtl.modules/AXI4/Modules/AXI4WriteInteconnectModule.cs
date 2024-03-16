using Quokka.RTL;
using RTL.Modules;
using System;
using System.Collections.Generic;
using System.Linq;

namespace rtl.modules.AXI4.Modules
{
    public class AXI4WriteInteconnectModule : InterconnectModule<AXI4_M2S_W, AXI4_S2M_W>
    {
        protected RangeDetectorArrayModule[] rangeDetectorArray;

        public AXI4WriteInteconnectModule(int mCount, List<RangeInfo> slaveRange)
            : base(mCount, () => new AXI4_M2S_W(axiSize.B4), slaveRange.Count, () => new AXI4_S2M_W(axiSize.B4))
        {
            rangeDetectorArray = range(mCount).Select(_ => new RangeDetectorArrayModule(slaveRange)).ToArray();
        }

        protected override void OnSchedule(Func<InterconnectModuleInputs<AXI4_M2S_W, AXI4_S2M_W>> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            for (var i = 0; i < leftCount; i++)
            {
                rangeDetectorArray[i].Schedule(() => new RangeDetectorArrayModuleInputs()
                {
                    iAddress = Inputs.iLeft[i].AW.AWADDR
                });
            }
        }

        RTLBitArray[] rangeDetectorIndexes => rangeDetectorArray.Select(r => r.oIndex).ToArray();
        RTLBitArray axiRightAddr => rangeDetectorIndexes[Encoder.MSBIndex];// rangeDetectorArray[Encoder.MSBIndex].oIndex;
        
        bool[] rangeDetectorActiveFlags => rangeDetectorArray.Select(r => r.oActive).ToArray();
        bool rangeDetectorActive => rangeDetectorActiveFlags[Encoder.MSBIndex];

        protected override RTLBitArray RightAddr()
        {
            return axiRightAddr;
            //return rangeDetectorArray[Encoder.MSBIndex].oIndex;
        }

        protected override bool TXEnd(AXI4_M2S_W source) => source.B.BREADY && muxRightData.B.BVALID;
        protected override bool TXStart(AXI4_M2S_W source) => source.AW.AWVALID && rangeDetectorActive;

        public AXI4_S2M_W[] S2M => muxRight;
    }
}
