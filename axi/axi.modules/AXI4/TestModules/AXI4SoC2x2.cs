﻿using Quokka.RTL;
using rtl.modules.AXI4.Modules;
using RTL.Modules;
using System;
using System.Collections.Generic;
using System.Linq;

namespace rtl.modules
{
    public class AXI4SoCRegisterOutput
    {
        public bool outACK;
        public byte[] outData;
        public bool outWritten;
    }

    public class AXI4SoCMasterOutput
    {
        public bool outRACK;
        public byte[] outRData;
        public bool outWACK;
    }
    
    public class AXI4SoC2x2Inputs
    {
        public AXI4SoC2x2Inputs() { }
        public AXI4SoC2x2Inputs(axiSize size, int mCount, int sCount)
        {
            MasterInputs = Enumerable.Range(0, mCount).Select(_ => new AXI4MasterModuleInput(size)).ToArray();
            RegInputs = Enumerable.Range(0, sCount).Select(_ => new AXI4RegisterModuleInput(size)).ToArray();
        }

        public AXI4MasterModuleInput[] MasterInputs;
        public AXI4RegisterModuleInput[] RegInputs;
    }

    public class AXI4SoC2x2 : RTLCombinationalModule<AXI4SoC2x2Inputs>
    {
        private readonly int mCount = 2;
        private readonly int sCount = 2;

        internal AXI4InteconnectModule interconnect;
        internal AXI4MasterModule[] masters;
        internal AXI4RegisterModule[] registers;

        public AXI4SoC2x2()
        {
            InitInputs(new AXI4SoC2x2Inputs(axiSize.B4, mCount, sCount));

            masters = range(mCount).Select(_ => new AXI4MasterModule(axiSize.B4)).ToArray();
            registers = range(sCount).Select(_ => new AXI4RegisterModule(axiSize.B4)).ToArray();

            interconnect = new AXI4InteconnectModule(
                axiSize.B4,
                2,
                new List<RangeInfo>
                {
                    new RangeInfo(0x00000000, 0x00000000),
                    new RangeInfo(0x00000004, 0x00000004)
                }
            );
        }

        // TODO: named tuple items.
        //public (bool outACK, byte[] outData, bool outWritten)[] outRegs => registers.Select(r => (r.outACK, r.outData, r.outWritten)).ToArray();
        public AXI4SoCRegisterOutput[] outRegs => registers
            .Select(r => new AXI4SoCRegisterOutput()
            {
                outACK = r.outACK,
                outData = r.outData,
                outWritten = r.outWritten
            }).ToArray();

        public AXI4SoCMasterOutput[] outMasters => masters
            .Select(m => new AXI4SoCMasterOutput()
            {
                outRData = m.RDATA,
                outRACK = m.RACK,
                outWACK = m.WACK
            })
            .ToArray();

        protected override void OnSchedule(Func<AXI4SoC2x2Inputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            foreach (var masterIndex in range(mCount))
            {
                masters[masterIndex].Schedule(() =>
                    new AXI4MasterModuleInputs()
                    {
                        Master = Inputs.MasterInputs[masterIndex],                        
                        S2M = interconnect.oS2M[masterIndex]
                    }
                );
            }

            foreach (var registerIndex in range(sCount))
            {
                registers[registerIndex].Schedule(() => 
                    new AXI4RegisterModuleInputs()
                    {
                        M2S = interconnect.oM2S[registerIndex],
                        Reg = Inputs.RegInputs[registerIndex]
                    }
                );
            }

            interconnect.Schedule(() =>
                new AXI4InteconnectModuleInputs()
                {
                    iM2S = masters.Select(m => m.M2S).ToArray(),
                    iS2M = registers.Select(r => r.S2M).ToArray()
                }
            );
        }
    }
}