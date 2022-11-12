using Quokka.RTL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace rtl.modules
{
    public class GenerateInverterInputs
    {
        public bool inValue;
    }

    public class GenerateInverterModule : RTLCombinationalModule<GenerateInverterInputs>
    {
        public bool outValue => !Inputs.inValue;
    }

    public class GenerateNestedModuleInputs
    {
        public GenerateNestedModuleInputs() { }
        public GenerateNestedModuleInputs(int size)
        {
            iData = new RTLBitArray().Resized(size);
        }

        public RTLBitArray iData;
        public bool iBit;
    }

    public class GenerateNestedModule : RTLCombinationalModule<GenerateNestedModuleInputs>
    {
        GenerateInverterModule inverter = new GenerateInverterModule();
        public GenerateNestedModule() { }
        public GenerateNestedModule(int size)
        {
            InitInputs(new GenerateNestedModuleInputs(size));
        }

        public RTLBitArray oData => Inputs.iData << 1 | Inputs.iBit;
        public bool oBit => inverter.outValue;

        protected override void OnSchedule(Func<GenerateNestedModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            inverter.Schedule(() => new GenerateInverterInputs() { inValue = Inputs.iBit });
        }
    }

    public class GenerateModuleInputs
    {
        public GenerateModuleInputs() { }
        public GenerateModuleInputs(int size) 
        {
            iBits = new RTLBitArray().Resized(size);
        }

        public bool iSeed;
        public RTLBitArray iBits;
    }

    public class GenerateModule : RTLCombinationalModule<GenerateModuleInputs>
    {
        private readonly int size;
        GenerateNestedModule[] nested;
        public GenerateModule() { }
        public GenerateModule(int size)
        {
            this.size = size;
            nested = Enumerable.Range(0, size).Select(idx => new GenerateNestedModule(idx + 1)).ToArray();
            InitInputs(new GenerateModuleInputs(size));
        }

        public RTLBitArray[] oData => nested.Select(m => m.oData).ToArray();

        protected override void OnSchedule(Func<GenerateModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            nested[0].Schedule(() => new GenerateNestedModuleInputs(1)
            {
                iBit = Inputs.iBits[0],
                iData = 0
            });

            for (var idx = 1; idx < 3; idx++)
            {
                nested[idx].Schedule(() => new GenerateNestedModuleInputs(idx + 1)
                {
                    iBit = Inputs.iBits[idx],
                    iData = nested[idx - 1].oData
                });
            }

            foreach (var idx in range(3, size - 3))
            {
                nested[idx].Schedule(() => new GenerateNestedModuleInputs(idx + 1)
                {
                    iBit = Inputs.iBits[idx],
                    iData = nested[idx - 1].oData
                });
            }
        }
    }

    public class GenerateModule4 : GenerateModule
    {
        public GenerateModule4() : base(5) { }
    }
}
