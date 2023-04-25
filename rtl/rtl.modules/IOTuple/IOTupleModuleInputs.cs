using Quokka.RTL;
using System;

namespace rtl.modules
{
    public class IOTupleModuleInputsObjectL21
    {
        public bool L2Flag;
        public bool[] L2Values = new bool[2] { true, true };
    }

    public class IOTupleModuleInputsObjectL22
    {
        public bool L2Flag;
        public RTLBitArray[] L2Values = new RTLBitArray[2] { new RTLBitArray().Resized(3), new RTLBitArray().Resized(3) };
    }

    public class IOTupleModuleInputsObjectL1
    {
        public bool L1Flag;
        public IOTupleModuleInputsObjectL21 L2 = new IOTupleModuleInputsObjectL21();
        public IOTupleModuleInputsObjectL22[] L2Array = new[] { new IOTupleModuleInputsObjectL22(), new IOTupleModuleInputsObjectL22() };
        public Tuple<byte, IOTupleModuleInputsObjectL21, IOTupleModuleInputsObjectL22[]> L2Tuple = new Tuple<byte, IOTupleModuleInputsObjectL21, IOTupleModuleInputsObjectL22[]>(42, new IOTupleModuleInputsObjectL21(), new[] { new IOTupleModuleInputsObjectL22(), new IOTupleModuleInputsObjectL22() });
    }

    public class IOTupleModuleInputs
    {
        public Tuple<
            bool, 
            byte, 
            RTLBitArray[],
            IOTupleModuleInputsObjectL1
        > iTuple = new Tuple<bool, byte, RTLBitArray[], IOTupleModuleInputsObjectL1>(
            false, 
            byte.MinValue, 
            new[] { new RTLBitArray().Resized(4), new RTLBitArray().Resized(4) },
            new IOTupleModuleInputsObjectL1()
        );

        public (bool, RTLBitArray, IOTupleModuleInputsObjectL1, IOTupleModuleInputsObjectL21[])[] iTupleArray = new[]
        {
            (false, new RTLBitArray().Resized(4), new IOTupleModuleInputsObjectL1(), new IOTupleModuleInputsObjectL21[] { new IOTupleModuleInputsObjectL21(), new IOTupleModuleInputsObjectL21() } ),
            (false, new RTLBitArray().Resized(4), new IOTupleModuleInputsObjectL1(), new IOTupleModuleInputsObjectL21[] { new IOTupleModuleInputsObjectL21(), new IOTupleModuleInputsObjectL21() })
        };
    }
}
