﻿using Quokka.RTL;
using System;

namespace rtl.modules
{
    public class IOTupleDirectInputL5ComponentsOutputModule : RTLCombinationalModule<IOTupleModuleInputs>
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
        public IOTupleModuleInputsObjectL21 Output_iTuple_Item4_L2Tuple_Item2 => Inputs.iTuple.Item4.L2Tuple.Item2;
        public IOTupleModuleInputsObjectL22[] Output_iTuple_Item4_L2Tuple_Item3 => Inputs.iTuple.Item4.L2Tuple.Item3;
        public bool Output_iTupleArray0_Item1
            => Inputs.iTupleArray[0].Item1;
        public RTLBitArray Output_iTupleArray0_Item2
            => Inputs.iTupleArray[0].Item2;
        public bool Output_iTupleArray0_Item3_L1Flag
            => Inputs.iTupleArray[0].Item3.L1Flag;
        public IOTupleModuleInputsObjectL21 Output_iTupleArray0_Item3_L2
            => Inputs.iTupleArray[0].Item3.L2;
        public IOTupleModuleInputsObjectL22[] Output_iTupleArray0_Item3_L2Array
            => Inputs.iTupleArray[0].Item3.L2Array;
        public Tuple<byte, IOTupleModuleInputsObjectL21, IOTupleModuleInputsObjectL22[]> Output_iTupleArray0_Item3_L2Tuple
            => Inputs.iTupleArray[0].Item3.L2Tuple;


        public IOTupleModuleInputsObjectL21[] Output_iTupleArray0_Item4
            => Inputs.iTupleArray[0].Item4;
        public bool Output_iTupleArray1_Item1
            => Inputs.iTupleArray[1].Item1;
        public RTLBitArray Output_iTupleArray1_Item2
            => Inputs.iTupleArray[1].Item2;
        public IOTupleModuleInputsObjectL1 Output_iTupleArray1_Item3
            => Inputs.iTupleArray[1].Item3;
        public IOTupleModuleInputsObjectL21[] Output_iTupleArray1_Item4
            => Inputs.iTupleArray[1].Item4;
    }
}
