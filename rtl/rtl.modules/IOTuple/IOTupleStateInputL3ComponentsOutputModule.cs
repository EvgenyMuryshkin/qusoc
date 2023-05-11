using Quokka.RTL;
using System;

namespace rtl.modules
{
    public class IOTupleStateInputL3ComponentsOutputModule : RTLSynchronousModule<IOTupleModuleInputs, IOTupleStateInputOutputModuleState>
    {
        public bool Output_iTuple_Item1 => State.Value.iTuple.Item1;
        public byte Output_iTuple_Item2 => State.Value.iTuple.Item2;
        public RTLBitArray[] Output_iTuple_Item3 => State.Value.iTuple.Item3;
        public bool Output_iTuple_Item4_L1Flag => State.Value.iTuple.Item4.L1Flag;
        public IOTupleModuleInputsObjectL21 Output_iTuple_Item4_L2 => State.Value.iTuple.Item4.L2;
        public IOTupleModuleInputsObjectL22[] Output_iTuple_Item4_L2Array => State.Value.iTuple.Item4.L2Array;
        public Tuple<byte, IOTupleModuleInputsObjectL21, IOTupleModuleInputsObjectL22[]> Output_iTuple_Item4_L2Tuple => State.Value.iTuple.Item4.L2Tuple;

        public bool Output_iTupleArray0_Item1
            => State.Value.iTupleArray[0].Item1;
        public RTLBitArray Output_iTupleArray0_Item2
            => State.Value.iTupleArray[0].Item2;
        public IOTupleModuleInputsObjectL1 Output_iTupleArray0_Item3
            => State.Value.iTupleArray[0].Item3;
        public IOTupleModuleInputsObjectL21[] Output_iTupleArray0_Item4
            => State.Value.iTupleArray[0].Item4;
        public bool Output_iTupleArray1_Item1
            => State.Value.iTupleArray[1].Item1;
        public RTLBitArray Output_iTupleArray1_Item2
            => State.Value.iTupleArray[1].Item2;
        public IOTupleModuleInputsObjectL1 Output_iTupleArray1_Item3
            => State.Value.iTupleArray[1].Item3;
        public IOTupleModuleInputsObjectL21[] Output_iTupleArray1_Item4
            => State.Value.iTupleArray[1].Item4;

        protected override void OnStage()
        {
            NextState.Value = Inputs;
        }
    }
}
