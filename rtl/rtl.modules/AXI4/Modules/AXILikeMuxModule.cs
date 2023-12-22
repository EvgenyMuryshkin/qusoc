using Quokka.RTL;
using RTL.Modules;
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

    public class AXILikeMuxModuleManual :  RTLCombinationalModule<AXILikeMuxModuleInputs>
    {
        readonly int mastersCount = 8;
        readonly int slavesCount = 4;

        //AXI4EncoderModule mEncoder;
        //AXI4EncoderModule sEncoder;

        public AXILikeMuxModuleManual()
        {
            InitInputs(new AXILikeMuxModuleInputs(mastersCount, slavesCount));

            //mEncoder = new AXI4EncoderModule(8);
            //sEncoder = new AXI4EncoderModule(2);
            mInMData = range(mastersCount).Select(i => new MData()).ToArray();
            mOutMData = range(slavesCount).Select(i => new MData()).ToArray();

            mInSData = range(slavesCount).Select(i => new SData()).ToArray();
            mOutSData = range(mastersCount).Select(i => new SData()).ToArray();
        }

        MData[] mInMData = new MData[0];
        MData[] mOutMData = new MData[0];

        SData[] mInSData = new SData[0];
        SData[] mOutSData = new SData[0];

        MData mEmptyMData = new MData() { };
        SData mEmptySData = new SData();

        protected override void OnSchedule(Func<AXILikeMuxModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            /*
            mEncoder.Schedule(() => new AXI4EncoderModuleInputs()
            {
                iValues = Inputs.MArr.Select(a => a.SData.IsActive).ToArray()//dbg
            });
            */
            
            for (var i = 0; i < mastersCount; i++)
            {
                mInMData[i] = Inputs.MArr[i];
            }

            for (var i = 0; i < slavesCount; i++)
            {
                mInSData[i] = Inputs.SArr[i];
            }

            for (var j = 0; j < slavesCount; j++)
            {
                if (Inputs.MAddrValid && Inputs.SAddrValid && Inputs.SAddr == j)
                {
                    mOutMData[j] = mInMData[Inputs.MAddr];
                }
                else
                {
                    mOutMData[j] = mEmptyMData;
                }
            }

            for (var j = 0; j < mastersCount; j++)
            {
                if (Inputs.MAddrValid && Inputs.SAddrValid && Inputs.MAddr == j)
                {
                    mOutSData[j] = mInSData[Inputs.SAddr];
                }
                else
                {
                    mOutSData[j] = mEmptySData;
                }
            }
        }
        
        public MData[] OutMData => mOutMData;
        public SData[] OutSData => mOutSData;
    }

    public class AXI4FullDuplexMuxModule : FullDuplexMuxModule<AXI4_M2S, AXI4_S2M>
    { 
        public AXI4FullDuplexMuxModule() 
            : base(8, () => new AXI4_M2S(axiSize.B4), 4, () => new AXI4_S2M(axiSize.B4))
        {
        }
    }

    public class AXILikeInteconnectModule : InterconnectModule<MData, SData>
    {
        public AXILikeInteconnectModule()
            : base(8, () => new MData(), 4, () => new SData())
        {

        }

        protected override bool TXStart(MData source)
        {
            return source.IsActive;
        }
        protected override bool TXEnd(MData source) => source.Payload.DataFlag;
        protected override RTLBitArray RightAddr() => muxLeftData.Payload.Data[1, 0];
        public bool[] oTransactions => Transactions;
        public bool[] oWaitForRestarts => WaitForRestarts;
        public MData oMuxLeftData => muxLeftData;
        public RTLBitArray oRightAddr => RightAddr();
        public MData[] oLeft => muxLeft;
        public SData[] oRight => muxRight;
    }
}
