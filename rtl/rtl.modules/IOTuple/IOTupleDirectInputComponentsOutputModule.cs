using Quokka.RTL;
using System;

namespace rtl.modules
{
    public class IOTupleDirectInputComponentsOutputModule : RTLCombinationalModule<IOTupleModuleInputs>
    {
        public Tuple<bool, byte, RTLBitArray[],IOTupleModuleInputsObjectL1> 
            Output_iTuple => Inputs.iTuple;

        public (bool, RTLBitArray, IOTupleModuleInputsObjectL1, IOTupleModuleInputsObjectL21[])[]
            Output_iTupleArray => Inputs.iTupleArray;
    }

    public class IOTupleDirectInputComponentsOutputChildModule : RTLCombinationalModule<IOTupleModuleInputs>
    {
        public Tuple<bool, byte, RTLBitArray[], IOTupleModuleInputsObjectL1>
            Output_iTuple => Inputs.iTuple;

        public (bool, RTLBitArray, IOTupleModuleInputsObjectL1, IOTupleModuleInputsObjectL21[])[]
            Output_iTupleArray => Inputs.iTupleArray;
    }

    public class IOTupleDirectInputComponentsOutputParentModule : RTLCombinationalModule<IOTupleModuleInputs>
    {
        IOTupleDirectInputComponentsOutputChildModule child = new IOTupleDirectInputComponentsOutputChildModule();

        protected override void OnSchedule(Func<IOTupleModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            child.Schedule(() => Inputs);
        }

        public Tuple<bool, byte, RTLBitArray[], IOTupleModuleInputsObjectL1>
            Output_iTuple => child.Output_iTuple;

        public (bool, RTLBitArray, IOTupleModuleInputsObjectL1, IOTupleModuleInputsObjectL21[])[]
            Output_iTupleArray => child.Output_iTupleArray;
    }
}
