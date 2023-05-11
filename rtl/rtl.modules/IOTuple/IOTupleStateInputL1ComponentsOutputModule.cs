using Quokka.RTL;
using System;

namespace rtl.modules
{
    public class IOTupleStateInputL1ComponentsOutputModule : RTLSynchronousModule<IOTupleModuleInputs, IOTupleStateInputOutputModuleState>
    {
        public Tuple<bool, byte, RTLBitArray[], IOTupleModuleInputsObjectL1>
            Output_iTuple => State.Value.iTuple;

        public (bool, RTLBitArray, IOTupleModuleInputsObjectL1, IOTupleModuleInputsObjectL21[])[]
            Output_iTupleArray => State.Value.iTupleArray;

        protected override void OnStage()
        {
            NextState.Value = Inputs;
        }
    }
}
