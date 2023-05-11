using Quokka.RTL;
using System;

namespace rtl.modules
{
    public class IOTupleStateInternalL1ComponentsOutputModule : RTLSynchronousModule<IOTupleModuleInputs, IOTupleStateInputOutputModuleState>
    {
        IOTupleModuleInputs InternalValue => State.Value;

        public Tuple<bool, byte, RTLBitArray[], IOTupleModuleInputsObjectL1>
            Output_iTuple => InternalValue.iTuple;

        public (bool, RTLBitArray, IOTupleModuleInputsObjectL1, IOTupleModuleInputsObjectL21[])[]
            Output_iTupleArray => InternalValue.iTupleArray;

        protected override void OnStage()
        {
            NextState.Value = Inputs;
        }
    }
}
