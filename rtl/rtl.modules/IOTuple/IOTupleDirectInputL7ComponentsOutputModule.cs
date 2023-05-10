using Quokka.RTL;
using System;

namespace rtl.modules
{
    public class IOTupleDirectInputL7ComponentsOutputModule : RTLCombinationalModule<IOTupleModuleInputs>
    {
        public bool Output_iTuple_Item1 => Inputs.iTuple.Item1;
        public byte Output_iTuple_Item2 => Inputs.iTuple.Item2;
        public RTLBitArray Output_iTuple_Item30 => Inputs.iTuple.Item3[0];
        public RTLBitArray Output_iTuple_Item31 => Inputs.iTuple.Item3[1];
        public bool Output_iTuple_Item4_L1Flag => Inputs.iTuple.Item4.L1Flag;
        public bool[] Output_iTuple_Item4_L2_L2Values => Inputs.iTuple.Item4.L2.L2Values;
        public bool Output_iTuple_Item4_L2_L2Flag => Inputs.iTuple.Item4.L2.L2Flag;
        public bool Output_iTuple_Item4_L2Array0_L2Flag => Inputs.iTuple.Item4.L2Array[0].L2Flag;
        public RTLBitArray Output_iTuple_Item4_L2Array0_L2Values1 => Inputs.iTuple.Item4.L2Array[0].L2Values[1];
        public RTLBitArray Output_iTuple_Item4_L2Array0_L2Values0 => Inputs.iTuple.Item4.L2Array[0].L2Values[0];
        public bool Output_iTuple_Item4_L2Array1_L2Flag => Inputs.iTuple.Item4.L2Array[1].L2Flag;
        public RTLBitArray[] Output_iTuple_Item4_L2Array1_L2Values => Inputs.iTuple.Item4.L2Array[1].L2Values;
        public byte Output_iTuple_Item4_L2Tuple_Item1 => Inputs.iTuple.Item4.L2Tuple.Item1;
        public bool Output_iTuple_Item4_L2Tuple_Item2_L2Flag => Inputs.iTuple.Item4.L2Tuple.Item2.L2Flag;
        public bool[] Output_iTuple_Item4_L2Tuple_Item2_L2Values => Inputs.iTuple.Item4.L2Tuple.Item2.L2Values;
        public bool Output_iTuple_Item4_L2Tuple_Item30_L2Flag => Inputs.iTuple.Item4.L2Tuple.Item3[0].L2Flag;
        public RTLBitArray[] Output_iTuple_Item4_L2Tuple_Item30_L2Values => Inputs.iTuple.Item4.L2Tuple.Item3[0].L2Values;
        public bool Output_iTuple_Item4_L2Tuple_Item31_L2Flag => Inputs.iTuple.Item4.L2Tuple.Item3[1].L2Flag;
        public RTLBitArray Output_iTuple_Item4_L2Tuple_Item31_L2Values0 => Inputs.iTuple.Item4.L2Tuple.Item3[1].L2Values[0];
        public RTLBitArray Output_iTuple_Item4_L2Tuple_Item31_L2Values1 => Inputs.iTuple.Item4.L2Tuple.Item3[1].L2Values[1];

        public bool Output_iTupleArray0_Item1
            => Inputs.iTupleArray[0].Item1;
        public RTLBitArray Output_iTupleArray0_Item2
            => Inputs.iTupleArray[0].Item2;
        public bool Output_iTupleArray0_Item3_L1Flag
            => Inputs.iTupleArray[0].Item3.L1Flag;
        public bool Output_iTupleArray0_Item3_L2_L2Flag
            => Inputs.iTupleArray[0].Item3.L2.L2Flag;
        public bool Output_iTupleArray0_Item3_L2_L2Values0
            => Inputs.iTupleArray[0].Item3.L2.L2Values[0];
        public bool Output_iTupleArray0_Item3_L2_L2Values1
            => Inputs.iTupleArray[0].Item3.L2.L2Values[1];

        public bool Output_iTupleArray0_Item3_L2Array0_L2Flag
            => Inputs.iTupleArray[0].Item3.L2Array[0].L2Flag;
        public RTLBitArray[] Output_iTupleArray0_Item3_L2Array0_L2Values
            => Inputs.iTupleArray[0].Item3.L2Array[0].L2Values;

        public bool Output_iTupleArray0_Item3_L2Array1_L2Flag
            => Inputs.iTupleArray[0].Item3.L2Array[1].L2Flag;
        public RTLBitArray Output_iTupleArray0_Item3_L2Array1_L2Values0
            => Inputs.iTupleArray[0].Item3.L2Array[1].L2Values[0];
        public RTLBitArray Output_iTupleArray0_Item3_L2Array1_L2Values1
            => Inputs.iTupleArray[0].Item3.L2Array[1].L2Values[1];

        public byte Output_iTupleArray0_Item3_L2Tuple_Item1
            => Inputs.iTupleArray[0].Item3.L2Tuple.Item1;
        public bool Output_iTupleArray0_Item3_L2Tuple_Item2_L2Flag
            => Inputs.iTupleArray[0].Item3.L2Tuple.Item2.L2Flag;
        public bool[] Output_iTupleArray0_Item3_L2Tuple_Item2_L2Values
            => Inputs.iTupleArray[0].Item3.L2Tuple.Item2.L2Values;

        public IOTupleModuleInputsObjectL22 Output_iTupleArray0_Item3_L2Tuple_Item30
            => Inputs.iTupleArray[0].Item3.L2Tuple.Item3[0];
        public bool Output_iTupleArray0_Item3_L2Tuple_Item31_L2Flag
            => Inputs.iTupleArray[0].Item3.L2Tuple.Item3[1].L2Flag;
        public RTLBitArray[] Output_iTupleArray0_Item3_L2Tuple_Item31_L2Values
            => Inputs.iTupleArray[0].Item3.L2Tuple.Item3[1].L2Values;


        public bool Output_iTupleArray0_Item40_L2Flag
            => Inputs.iTupleArray[0].Item4[0].L2Flag;
        public bool Output_iTupleArray0_Item40_L2Values0
            => Inputs.iTupleArray[0].Item4[0].L2Values[0];
        public bool Output_iTupleArray0_Item40_L2Values1
            => Inputs.iTupleArray[0].Item4[0].L2Values[1];

        public bool Output_iTupleArray0_Item41_L2Flag
            => Inputs.iTupleArray[0].Item4[1].L2Flag;
        public bool[] Output_iTupleArray0_Item41_L2Values
            => Inputs.iTupleArray[0].Item4[1].L2Values;

        public bool Output_iTupleArray1_Item1
            => Inputs.iTupleArray[1].Item1;
        public RTLBitArray Output_iTupleArray1_Item2
            => Inputs.iTupleArray[1].Item2;
        public bool Output_iTupleArray1_Item3_L1Flag
            => Inputs.iTupleArray[1].Item3.L1Flag;
        public bool Output_iTupleArray1_Item3_L2_L2Flag
            => Inputs.iTupleArray[1].Item3.L2.L2Flag;
        public bool[] Output_iTupleArray1_Item3_L2_L2Values
            => Inputs.iTupleArray[1].Item3.L2.L2Values;

        public IOTupleModuleInputsObjectL22 Output_iTupleArray1_Item3_L2Array0
            => Inputs.iTupleArray[1].Item3.L2Array[0];
        public bool Output_iTupleArray1_Item3_L2Array1_L2Flag
            => Inputs.iTupleArray[1].Item3.L2Array[1].L2Flag;
        public RTLBitArray[] Output_iTupleArray1_Item3_L2Array1_L2Values
            => Inputs.iTupleArray[1].Item3.L2Array[1].L2Values;

        public byte Output_iTupleArray1_Item3_L2Tuple_Item1
            => Inputs.iTupleArray[1].Item3.L2Tuple.Item1;
        public IOTupleModuleInputsObjectL21 Output_iTupleArray1_Item3_L2Tuple_Item2
            => Inputs.iTupleArray[1].Item3.L2Tuple.Item2;
        public IOTupleModuleInputsObjectL22[] Output_iTupleArray1_Item3_L2Tuple_Item3
            => Inputs.iTupleArray[1].Item3.L2Tuple.Item3;

        public bool Output_iTupleArray1_Item40_L2Flag
            => Inputs.iTupleArray[1].Item4[0].L2Flag;
        public bool[] Output_iTupleArray1_Item40_L2Values
            => Inputs.iTupleArray[1].Item4[0].L2Values;

        public bool Output_iTupleArray1_Item41_L2Flag
            => Inputs.iTupleArray[1].Item4[1].L2Flag;
        public bool Output_iTupleArray1_Item41_L2Values0
            => Inputs.iTupleArray[1].Item4[1].L2Values[0];
        public bool Output_iTupleArray1_Item41_L2Values1
            => Inputs.iTupleArray[1].Item4[1].L2Values[1];
    }
}
