using Quokka.RTL;
using System;

namespace rtl.modules
{
    public class IOTupleDirectInputComponentsOutputModule : RTLCombinationalModule<IOTupleModuleInputs>
    {
        public Tuple<
            bool,
            byte,
            RTLBitArray[],
            IOTupleModuleInputsObjectL1> 
            Output_iTuple => Inputs.iTuple;

        public (bool, RTLBitArray, IOTupleModuleInputsObjectL1, IOTupleModuleInputsObjectL21[])[]
            Output_iTupleArray => Inputs.iTupleArray;
    }
}
