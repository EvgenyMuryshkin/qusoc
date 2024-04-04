using Quokka.RTL;
using RTL.Modules;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;

namespace rtl.modules.AXI4.Modules
{
    public class RangeDetectorArrayModuleInputs
    {
        public uint iAddress;
    }

    public class RangeDetectorArrayModule : RTLCombinationalModule<RangeDetectorArrayModuleInputs>
    {
        readonly int rangeDetectorsCount;
        RangeDetectorModule[] rangeDetectors;
        AXI4EncoderModule encoder;
        bool[] rangeActive;

        public RangeDetectorArrayModule(List<RangeInfo> ranges)
        {
            rangeDetectorsCount = ranges.Count;
            rangeDetectors = ranges.Select(r => new RangeDetectorModule(r.rangeFrom, r.rangeTo)).ToArray();
            rangeActive = new bool[ranges.Count];
            encoder = new AXI4EncoderModule(rangeDetectorsCount);
        }

        public bool oActive => encoder.HasActive;
        public RTLBitArray oIndex => encoder.MSBIndex;

        protected override void OnSchedule(Func<RangeDetectorArrayModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            encoder.Schedule(() => new AXI4EncoderModuleInputs()
            {
                // TODO: support rangeDetectors.Select(r => r.IsActive).ToArray()
                iValues = rangeActive
            });
        }

        protected override void OnDeltaCycle()
        {
            base.OnDeltaCycle();

            // TODO: support idx < rangeDetectors.Length
            foreach (var idx in range(rangeDetectorsCount))
            {
                rangeDetectors[idx].Schedule(() => new RangeDetectorModuleInputs()
                {
                    Value = Inputs.iAddress
                });
            }

            foreach (var idx in range(rangeDetectorsCount))
            {
                rangeActive[idx] = rangeDetectors[idx].IsActive;
            }
        }
    }

    public class RangeDetectorArrayModule4 : RangeDetectorArrayModule
    {
        public RangeDetectorArrayModule4() : base(
            new List<RangeInfo>()
            {
                new RangeInfo(0x00000000, 0x0FFFFFFF),
                new RangeInfo(0x10000000, 0x1FFFFFFF),
                new RangeInfo(0x20000000, 0x6FFFFFFF),
                new RangeInfo(0x70000000, 0x70000000),
                new RangeInfo(0x70000001, 0x70000001),
                new RangeInfo(0x70000002, 0x7000000F),
                new RangeInfo(0x70000010, 0xFFFFFFFE),
            })
        {

        }
    }
}
