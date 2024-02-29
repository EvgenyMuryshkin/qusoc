using Quokka.RTL;
using System;
using System.Linq;

namespace RTL.Modules
{

    public class IOSingleBitMemoryCompositionModuleChildInputs
    {
        public bool iValue { get; set; }
    }

    public class IOSingleBitMemoryCompositionChildModule : RTLCombinationalModule<IOSingleBitMemoryCompositionModuleChildInputs>
    {
        public bool oValue => Inputs.iValue;
    }

    public class IOSingleBitMemoryCompositionModuleInputs
    {
        public IOSingleBitMemoryCompositionModuleInputs() { }
        public IOSingleBitMemoryCompositionModuleInputs(int size)
        {
            iValues = new bool[size];
        }
    
        public bool[] iValues;
    }

    public class IOSingleBitMemoryCompositionModule : RTLCombinationalModule<IOSingleBitMemoryCompositionModuleInputs>
    {
        readonly int size; // TODO: support const int size = 2;
        IOSingleBitMemoryCompositionChildModule[] children;

        public IOSingleBitMemoryCompositionModule(int size)
        {
            this.size = size;
            InitInputs(new IOSingleBitMemoryCompositionModuleInputs(size));

            children = Enumerable.Range(0, size).Select(i => new IOSingleBitMemoryCompositionChildModule()).ToArray();
        }

        protected override void OnSchedule(Func<IOSingleBitMemoryCompositionModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            for (var i = 0; i < size; i++)
            {
                children[i].Schedule(() => new IOSingleBitMemoryCompositionModuleChildInputs() { iValue = Inputs.iValues[i] });
            }
        }

        public bool[] oValues => children.Select(x => x.oValue).ToArray();
    }

    public class IOSingleBitMemoryCompositionModule_1 : IOSingleBitMemoryCompositionModule
    {
        public IOSingleBitMemoryCompositionModule_1() : base(1) { }
    }

    public class IOSingleBitMemoryCompositionModule_2 : IOSingleBitMemoryCompositionModule
    {
        public IOSingleBitMemoryCompositionModule_2() : base(2) { }
    }

}

