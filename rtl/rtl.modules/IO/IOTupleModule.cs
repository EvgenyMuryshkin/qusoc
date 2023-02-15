using Quokka.RTL;
using System;

namespace RTL.Modules
{
    public class IOTupleModuleInputsObjectL2
    {
        public bool L2Flag;
        //public bool[] L2Values = new bool[2] { true, true };
    }

    public class IOTupleModuleInputsObjectL1
    {
        public bool L1Flag;
        public IOTupleModuleInputsObjectL2 L2 = new IOTupleModuleInputsObjectL2();
        public Tuple<byte, IOTupleModuleInputsObjectL2> L2Tuple = new Tuple<byte, IOTupleModuleInputsObjectL2>(42, new IOTupleModuleInputsObjectL2());
    }

    public class IOTupleModuleInputs
    {
        public Tuple<bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1> iTuple = new Tuple<bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1>(false, byte.MinValue, new RTLBitArray().Resized(4), new IOTupleModuleInputsObjectL1());
    }

    public class IOTupleModuleState
    {
        public Tuple<bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1> sTuple = new Tuple<bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1>(false, byte.MinValue, new RTLBitArray().Resized(4), new IOTupleModuleInputsObjectL1());
        public (bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1) sahTuple = (false, byte.MinValue, new RTLBitArray().Resized(4), new IOTupleModuleInputsObjectL1());
    }

    public class IOTupleModule : RTLSynchronousModule<IOTupleModuleInputs, IOTupleModuleState>
    {
        public Tuple<bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1> oiTuple 
            => Inputs.iTuple;
        /*public Tuple<bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1> osTuple 
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
        */
        protected override void OnStage()
        {
            //NextState.sTuple = Inputs.iTuple;
            //NextState.sahTuple = (Inputs.iTuple.Item1, Inputs.iTuple.Item2, Inputs.iTuple.Item3, Inputs.iTuple.Item4);
        }
    }
}
