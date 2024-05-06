using Quokka.RTL;
using System;
using System.Collections.Generic;
using System.Linq;

namespace axi.modules
{
    public class AXI4ReadInteconnectModule : InterconnectModule<AXI4_M2S_R, AXI4_S2M_R>
    {
        internal RangeDetectorArrayModule[] rangeDetectorArray;

        public AXI4ReadInteconnectModule(int mCount, List<RangeInfo> slaveRange)
            : base(mCount, () => new AXI4_M2S_R(axiSize.B4), slaveRange.Count, () => new AXI4_S2M_R(axiSize.B4))
        {
            rangeDetectorArray = range(mCount).Select(_ => new RangeDetectorArrayModule(slaveRange)).ToArray();
        }

        protected override void OnSchedule(Func<InterconnectModuleInputs<AXI4_M2S_R, AXI4_S2M_R>> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            foreach (var i in range(leftCount))
            {
                rangeDetectorArray[i].Schedule(() => new RangeDetectorArrayModuleInputs()
                {
                    iAddress = Inputs.iLeft[i].AR.ARADDR
                });
            }
        }

        RTLBitArray[] rangeDetectorIndexes => rangeDetectorArray.Select(r => r.oIndex).ToArray();
        RTLBitArray axiRightAddr => rangeDetectorIndexes[Encoder.MSBIndex];// rangeDetectorArray[Encoder.MSBIndex].oIndex;

        internal bool[] rangeDetectorActiveFlags => rangeDetectorArray.Select(r => r.oActive).ToArray();
        internal bool rangeDetectorActive => rangeDetectorActiveFlags[Encoder.MSBIndex];

        protected override RTLBitArray RightAddr()
        {
            return axiRightAddr;
            //return rangeDetectorArray[Encoder.MSBIndex].oIndex;
        }

        protected override bool TXEnd(int sourceIndex, AXI4_M2S_R source) => source.R.RREADY && muxRightData.R.RVALID && State.leftAddr == sourceIndex;
        protected override bool TXStart(int sourceIndex, AXI4_M2S_R source) => source.AR.ARVALID && rangeDetectorActiveFlags[sourceIndex];// TODO: rangeDetectorActive[Encoder.MSBIndex];

        public AXI4_S2M_R[] S2M => muxRight;
        public AXI4_M2S_R[] M2S => muxLeft;
    }
}
