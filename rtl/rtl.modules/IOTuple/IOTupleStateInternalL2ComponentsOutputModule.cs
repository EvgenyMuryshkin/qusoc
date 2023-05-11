using Quokka.RTL;

namespace rtl.modules
{
    public class IOTupleStateInternalL2ComponentsOutputModule : RTLSynchronousModule<IOTupleModuleInputs, IOTupleStateInputOutputModuleState>
    {
        IOTupleModuleInputs InternalValue => State.Value;

        public bool Output_iTuple_Item1 => InternalValue.iTuple.Item1;
        public byte Output_iTuple_Item2 => InternalValue.iTuple.Item2;
        public RTLBitArray[] Output_iTuple_Item3 => InternalValue.iTuple.Item3;
        public IOTupleModuleInputsObjectL1 Output_iTuple_Item4 => InternalValue.iTuple.Item4;

        public (bool, RTLBitArray, IOTupleModuleInputsObjectL1, IOTupleModuleInputsObjectL21[]) Output_iTupleArray0
            => InternalValue.iTupleArray[0];
        public (bool, RTLBitArray, IOTupleModuleInputsObjectL1, IOTupleModuleInputsObjectL21[]) Output_iTupleArray1
            => InternalValue.iTupleArray[1];

        protected override void OnStage()
        {
            NextState.Value = Inputs;
        }
    }
}
