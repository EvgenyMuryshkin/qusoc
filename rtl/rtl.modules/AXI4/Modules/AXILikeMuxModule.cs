using Quokka.RTL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace rtl.modules.AXI4.Modules
{
    public class Payload
    {
        public bool DataFlag = false;
        public RTLBitArray Data = new RTLBitArray(byte.MinValue);
    }

    public class MData
    {
        public bool IsActive = false;
        public Payload Payload = new Payload();
        public RTLBitArray Addr = new RTLBitArray().Resized(2);

    }

    public class SData
    {
        public bool IsActive = false;
        public Payload Payload = new Payload();
    }

    public class AXILikeMuxModuleInputs
    {
        public AXILikeMuxModuleInputs()
        {

        }

        public AXILikeMuxModuleInputs(int m, int s)
        {
            MAddr = new RTLBitArray().Resized(AXITools.log2(m));
            MArr = Enumerable.Range(0, m).Select(i => new MData()).ToArray();

            SAddr = new RTLBitArray().Resized(AXITools.log2(s));
            SArr = Enumerable.Range(0, s).Select(i => new SData()).ToArray();
        }

        public MData[] MArr;
        public SData[] SArr;

        public bool MAddrValid;
        public RTLBitArray MAddr;

        public bool SAddrValid;
        public RTLBitArray SAddr;
    }

    public class AXILikeMuxModule : RTLCombinationalModule<AXILikeMuxModuleInputs>
    {
        readonly int mastersCount = 8;
        readonly int slavesCount = 4;

        FullDuplexMuxModule<MData, SData> fullDuplexMux;

        public AXILikeMuxModule()
        {
            InitInputs(new AXILikeMuxModuleInputs(mastersCount, slavesCount));

            fullDuplexMux = new FullDuplexMuxModule<MData, SData>(mastersCount, () => new MData(), slavesCount, () => new SData());
        }

        protected override void OnSchedule(Func<AXILikeMuxModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            fullDuplexMux.Schedule(() => new FullDuplexMuxModuleInputs<MData, SData>()
            {
                iLeft = Inputs.MArr,
                iLeftAddr = Inputs.MAddr,
                iLeftAddrValid = Inputs.MAddrValid,
                iRight = Inputs.SArr,
                iRightAddr = Inputs.SAddr,
                iRightAddrValid = Inputs.SAddrValid
            });
        }

        public MData[] OutMData => fullDuplexMux.oLeft;
        public SData[] OutSData => fullDuplexMux.oRight;
    }
}
