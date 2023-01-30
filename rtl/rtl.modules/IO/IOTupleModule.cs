using Quokka.RTL;
using System;

namespace RTL.Modules
{
    public class IOTupleModuleInputsObjectL2
    {
        public bool L2Flag;
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
        //public Tuple<bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1> sTuple = new Tuple<bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1>(false, byte.MinValue, new RTLBitArray().Resized(4), new IOTupleModuleInputsObjectL1());
    }

    public class IOTupleModule : RTLSynchronousModule<IOTupleModuleInputs, IOTupleModuleState>
    {
        //public Tuple<bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1> oiTuple => Inputs.iTuple;
        //public Tuple<bool, byte, RTLBitArray, IOTupleModuleInputsObjectL1> osTuple => State.sTuple;


        protected override void OnStage()
        {
            //NextState.sTuple = Inputs.iTuple;
        }
    }
}
