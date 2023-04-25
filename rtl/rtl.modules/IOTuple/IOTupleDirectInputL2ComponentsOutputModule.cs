using Quokka.RTL;

namespace rtl.modules
{
    public class IOTupleDirectInputL2ComponentsOutputModule : RTLCombinationalModule<IOTupleModuleInputs>
    {
        public bool Output_iTuple_Item1 => Inputs.iTuple.Item1;
        public byte Output_iTuple_Item2 => Inputs.iTuple.Item2;
        public RTLBitArray[] Output_iTuple_Item3 => Inputs.iTuple.Item3;
        public IOTupleModuleInputsObjectL1 Output_iTuple_Item4 => Inputs.iTuple.Item4;

        public (bool, RTLBitArray, IOTupleModuleInputsObjectL1, IOTupleModuleInputsObjectL21[]) Output_iTupleArray0
            => Inputs.iTupleArray[0];
        public (bool, RTLBitArray, IOTupleModuleInputsObjectL1, IOTupleModuleInputsObjectL21[]) Output_iTupleArray1
            => Inputs.iTupleArray[1];
    }
}
