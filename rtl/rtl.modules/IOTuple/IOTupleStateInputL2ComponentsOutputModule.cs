using Quokka.RTL;

namespace rtl.modules
{
    public class IOTupleStateInputL2ComponentsOutputModule : RTLSynchronousModule<IOTupleModuleInputs, IOTupleStateInputOutputModuleState>
    {
        public bool Output_iTuple_Item1 => State.Value.iTuple.Item1;
        public byte Output_iTuple_Item2 => State.Value.iTuple.Item2;
        public RTLBitArray[] Output_iTuple_Item3 => State.Value.iTuple.Item3;
        public IOTupleModuleInputsObjectL1 Output_iTuple_Item4 => State.Value.iTuple.Item4;

        public (bool, RTLBitArray, IOTupleModuleInputsObjectL1, IOTupleModuleInputsObjectL21[]) Output_iTupleArray0
            => State.Value.iTupleArray[0];
        public (bool, RTLBitArray, IOTupleModuleInputsObjectL1, IOTupleModuleInputsObjectL21[]) Output_iTupleArray1
            => State.Value.iTupleArray[1];

        protected override void OnStage()
        {
            NextState.Value = Inputs;
        }
    }
}
