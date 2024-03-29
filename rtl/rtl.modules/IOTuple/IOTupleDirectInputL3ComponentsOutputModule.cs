﻿using Quokka.RTL;
using System;

namespace rtl.modules
{
    public class IOTupleDirectInputL3ComponentsOutputModule : RTLCombinationalModule<IOTupleModuleInputs>
    {
        public bool Output_iTuple_Item1 => Inputs.iTuple.Item1;
        public byte Output_iTuple_Item2 => Inputs.iTuple.Item2;
        public RTLBitArray[] Output_iTuple_Item3 => Inputs.iTuple.Item3;
        public bool Output_iTuple_Item4_L1Flag => Inputs.iTuple.Item4.L1Flag;
        public IOTupleModuleInputsObjectL21 Output_iTuple_Item4_L2 => Inputs.iTuple.Item4.L2;
        public IOTupleModuleInputsObjectL22[] Output_iTuple_Item4_L2Array => Inputs.iTuple.Item4.L2Array;
        public Tuple<byte, IOTupleModuleInputsObjectL21, IOTupleModuleInputsObjectL22[]> Output_iTuple_Item4_L2Tuple => Inputs.iTuple.Item4.L2Tuple;
        
        public bool Output_iTupleArray0_Item1
            => Inputs.iTupleArray[0].Item1;
        public RTLBitArray Output_iTupleArray0_Item2
            => Inputs.iTupleArray[0].Item2;
        public IOTupleModuleInputsObjectL1 Output_iTupleArray0_Item3
            => Inputs.iTupleArray[0].Item3;
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
