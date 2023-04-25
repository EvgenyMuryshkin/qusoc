using Quokka.RTL;
using System;

namespace rtl.modules
{
    public class IOTupleModuleState
    {
        //public Tuple<bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1> sTuple = new Tuple<bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1>(false, byte.MinValue, new RTLBitArray().Resized(4), new IOTupleModuleInputsObjectL1());
        //public (bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1) sahTuple = (false, byte.MinValue, new RTLBitArray().Resized(4), new IOTupleModuleInputsObjectL1());
        //public (bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1)[] buffTuple = new (bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1)[] 
        //{ 
        //    (false, byte.MinValue, new RTLBitArray().Resized(4), new IOTupleModuleInputsObjectL1()),
        //    (false, byte.MinValue, new RTLBitArray().Resized(4), new IOTupleModuleInputsObjectL1())
        //};
    }

    public class IOTupleModule : RTLSynchronousModule<IOTupleModuleInputs, IOTupleModuleState>
    {
        /*       
        public Tuple<bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1> oiTuple 
            => Inputs.iTuple;
        public Tuple<bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1> osTuple 
            => State.sTuple;
        public (bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1) ocTuple 
            => (Inputs.iTuple.Item1, Inputs.iTuple.Item2, State.sTuple.Item3, State.sTuple.Item4);

        Tuple<bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1> iiTuple 
            => Inputs.iTuple;
        Tuple<bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1> isTuple 
            => State.sTuple;
        (bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1) icTuple 
            => (Inputs.iTuple.Item1, Inputs.iTuple.Item2, State.sTuple.Item3, State.sTuple.Item4);

        public Tuple<bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1> oiiTuple 
            => iiTuple;
        public Tuple<bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1> oisTuple 
            => isTuple;
        public (bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1) oicTuple 
            => icTuple;

        public ((bool, bool), (byte, byte), RTLBitArray) oahTuple 
            => ((Inputs.iTuple.Item1, State.sTuple.Item1), (Inputs.iTuple.Item2, State.sTuple.Item2), State.sTuple.Item3);
        public (bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1) osahTuple
            => State.sahTuple;

        public Tuple<bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1> otTuple 
            => Inputs.iTuple.Item1 ? Inputs.iTuple : State.sTuple;

        public (bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1) oBuffTuple
            => State.buffTuple[1];

        public (bool, (bool, RTLBitArray, bool))[] oTupleArray => Inputs.iTupleArray;
        public bool oTupleArrayItem => Inputs.iTupleArray[1].Item1;
        public (bool, (bool, RTLBitArray, bool)) oTupleArrayElement => Inputs.iTupleArray[1];
        public bool oTupleArrayItem1 => Inputs.iTupleArray[1].Item1;
        public bool oTupleArraySubItem1 => Inputs.iTupleArray[1].Item2.Item1;
        public RTLBitArray oTupleArraySubItem2 => Inputs.iTupleArray[1].Item2.Item2;
        public RTLBitArray oTupleArraySubItemRange => Inputs.iTupleArray[1].Item2.Item2[4, 1];
        */
        protected override void OnStage()
        {
            //NextState.sTuple = Inputs.iTuple;
            //NextState.sahTuple = (Inputs.iTuple.Item1, Inputs.iTuple.Item2, Inputs.iTuple.Item3, Inputs.iTuple.Item4);
            //NextState.buffTuple[0] = (Inputs.iTuple.Item1, Inputs.iTuple.Item2, Inputs.iTuple.Item3, Inputs.iTuple.Item4);
            //NextState.buffTuple[1] = State.buffTuple[0];
        }
    }
}
