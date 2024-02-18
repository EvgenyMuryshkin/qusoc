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
        public bool[] iValues = new bool[2];
    }

    public class IOSingleBitMemoryCompositionModule : RTLCombinationalModule<IOSingleBitMemoryCompositionModuleInputs>
    {
        readonly int size = 1; // TODO: support const int size = 2;
        IOSingleBitMemoryCompositionChildModule[] children;

        public IOSingleBitMemoryCompositionModule()
        {
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
}

