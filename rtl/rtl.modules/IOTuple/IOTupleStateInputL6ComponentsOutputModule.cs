﻿using Quokka.RTL;
using System;

namespace rtl.modules
{
    public class IOTupleStateInputL6ComponentsOutputModule : RTLSynchronousModule<IOTupleModuleInputs, IOTupleStateInputOutputModuleState>
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
        public bool Output_iTuple_Item4_L2Array1_L2Flag => State.Value.iTuple.Item4.L2Array[1].L2Flag;
        public RTLBitArray[] Output_iTuple_Item4_L2Array1_L2Values => State.Value.iTuple.Item4.L2Array[1].L2Values;
        public byte Output_iTuple_Item4_L2Tuple_Item1 => State.Value.iTuple.Item4.L2Tuple.Item1;
        public bool Output_iTuple_Item4_L2Tuple_Item2_L2Flag => State.Value.iTuple.Item4.L2Tuple.Item2.L2Flag;
        public bool[] Output_iTuple_Item4_L2Tuple_Item2_L2Values => State.Value.iTuple.Item4.L2Tuple.Item2.L2Values;
        public IOTupleModuleInputsObjectL22 Output_iTuple_Item4_L2Tuple_Item30 => State.Value.iTuple.Item4.L2Tuple.Item3[0];
        public bool Output_iTuple_Item4_L2Tuple_Item31_L2Flag => State.Value.iTuple.Item4.L2Tuple.Item3[1].L2Flag;
        public RTLBitArray[] Output_iTuple_Item4_L2Tuple_Item31_L2Values => State.Value.iTuple.Item4.L2Tuple.Item3[1].L2Values;

        public bool Output_iTupleArray0_Item1
            => State.Value.iTupleArray[0].Item1;
        public RTLBitArray Output_iTupleArray0_Item2
            => State.Value.iTupleArray[0].Item2;
        public bool Output_iTupleArray0_Item3_L1Flag
            => State.Value.iTupleArray[0].Item3.L1Flag;
        public bool Output_iTupleArray0_Item3_L2_L2Flag
            => State.Value.iTupleArray[0].Item3.L2.L2Flag;
        public bool[] Output_iTupleArray0_Item3_L2_L2Values
            => State.Value.iTupleArray[0].Item3.L2.L2Values;

        public IOTupleModuleInputsObjectL22 Output_iTupleArray0_Item3_L2Array0
            => State.Value.iTupleArray[0].Item3.L2Array[0];

        public bool Output_iTupleArray0_Item3_L2Array1_L2Flag
            => State.Value.iTupleArray[0].Item3.L2Array[1].L2Flag;
        public RTLBitArray[] Output_iTupleArray0_Item3_L2Array1_L2Values
            => State.Value.iTupleArray[0].Item3.L2Array[1].L2Values;

        public byte Output_iTupleArray0_Item3_L2Tuple_Item1
            => State.Value.iTupleArray[0].Item3.L2Tuple.Item1;
        public IOTupleModuleInputsObjectL21 Output_iTupleArray0_Item3_L2Tuple_Item2
            => State.Value.iTupleArray[0].Item3.L2Tuple.Item2;
        public IOTupleModuleInputsObjectL22[] Output_iTupleArray0_Item3_L2Tuple_Item3
            => State.Value.iTupleArray[0].Item3.L2Tuple.Item3;


        public bool Output_iTupleArray0_Item40_L2Flag
            => State.Value.iTupleArray[0].Item4[0].L2Flag;
        public bool[] Output_iTupleArray0_Item40_L2Values
            => State.Value.iTupleArray[0].Item4[0].L2Values;

        public IOTupleModuleInputsObjectL21 Output_iTupleArray0_Item41
            => State.Value.iTupleArray[0].Item4[1];

        public bool Output_iTupleArray1_Item1
            => State.Value.iTupleArray[1].Item1;
        public RTLBitArray Output_iTupleArray1_Item2
            => State.Value.iTupleArray[1].Item2;
        public bool Output_iTupleArray1_Item3_L1Flag
            => State.Value.iTupleArray[1].Item3.L1Flag;
        public IOTupleModuleInputsObjectL21 Output_iTupleArray1_Item3_L2
            => State.Value.iTupleArray[1].Item3.L2;
        public IOTupleModuleInputsObjectL22[] Output_iTupleArray1_Item3_L2Array
            => State.Value.iTupleArray[1].Item3.L2Array;
        public Tuple<byte, IOTupleModuleInputsObjectL21, IOTupleModuleInputsObjectL22[]> Output_iTupleArray1_Item3_L2Tuple
            => State.Value.iTupleArray[1].Item3.L2Tuple;

        public IOTupleModuleInputsObjectL21 Output_iTupleArray1_Item40
            => State.Value.iTupleArray[1].Item4[0];
        public bool Output_iTupleArray1_Item41_L2Flag
            => State.Value.iTupleArray[1].Item4[1].L2Flag;
        public bool[] Output_iTupleArray1_Item41_L2Values
            => State.Value.iTupleArray[1].Item4[1].L2Values;

        protected override void OnStage()
        {
            NextState.Value = Inputs;
        }
    }
}