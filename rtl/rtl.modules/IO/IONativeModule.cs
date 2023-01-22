using Quokka.RTL;
using System;
using System.Collections.Generic;
using System.Text;

namespace RTL.Modules
{
    public class IONativeModuleInputs
    {
        public byte iByteValue;
    }

    public class IONativeModuleState
    {
        public byte sByteValue;
    }

    public class IONativeModule : RTLSynchronousModule<IONativeModuleInputs, IONativeModuleState>
    {
        // inputs output
        public byte oiByteValue => Inputs.iByteValue;

        // state output
        public byte osByteValue => State.sByteValue;

        protected override void OnStage()
        {
            NextState.sByteValue = Inputs.iByteValue;
        }
    }
}
