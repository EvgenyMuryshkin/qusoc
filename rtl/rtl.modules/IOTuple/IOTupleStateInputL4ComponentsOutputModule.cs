using Quokka.RTL;
using System;

namespace rtl.modules
{
    public class IOTupleStateInputL4ComponentsOutputModule : RTLSynchronousModule<IOTupleModuleInputs, IOTupleStateInputOutputModuleState>
    {
        public bool Output_iTuple_Item1 => State.Value.iTuple.Item1;
        public byte Output_iTuple_Item2 => State.Value.iTuple.Item2;
        public RTLBitArray Output_iTuple_Item30 => State.Value.iTuple.Item3[0];
        public RTLBitArray Output_iTuple_Item31 => State.Value.iTuple.Item3[1];
        public bool Output_iTuple_Item4_L1Flag => State.Value.iTuple.Item4.L1Flag;
        public bool[] Output_iTuple_Item4_L2_L2Values => State.Value.iTuple.Item4.L2.L2Values;
        public bool Output_iTuple_Item4_L2_L2Flag => State.Value.iTuple.Item4.L2.L2Flag;
        public bool Output_iTuple_Item4_L2Array0_L2Flag => State.Value.iTuple.Item4.L2Array[0].L2Flag;
        public RTLBitArray Output_iTuple_Item4_L2Array0_L2Values1 => State.Value.iTuple.Item4.L2Array[0].L2Values[1];
        public RTLBitArray Output_iTuple_Item4_L2Array0_L2Values0 => State.Value.iTuple.Item4.L2Array[0].L2Values[0];
        public IOTupleModuleInputsObjectL22 Output_iTuple_Item4_L2Array1 => State.Value.iTuple.Item4.L2Array[1];
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
