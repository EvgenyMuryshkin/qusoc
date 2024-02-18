using Quokka.RTL;
using System;
using System.Linq;

namespace rtl.modules.AXI4.Modules
{
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
}
