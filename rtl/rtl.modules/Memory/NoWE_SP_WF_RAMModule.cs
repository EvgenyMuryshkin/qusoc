using System;
using System.Linq;
using Quokka.RTL;

namespace RTL.Modules
{
    public class NoWE_SP_WF_RAMModule_Inputs
    {
        public byte Address;
        public byte WriteData;
    }

    public class NoWE_SP_WF_RAMModule_State
    {
        public byte ReadData;
        public byte[] Buff = new byte[256];
    }

    public class NoWE_SP_WF_RAMModule : RTLSynchronousModule<NoWE_SP_WF_RAMModule_Inputs, NoWE_SP_WF_RAMModule_State>
    {
        public NoWE_SP_WF_RAMModule()
        {
        }

        public byte Data => State.ReadData;

        protected override void OnStage()
        {
            NextState.Buff[Inputs.Address] = Inputs.WriteData; 
            NextState.ReadData = NextState.Buff[Inputs.Address];
        }
    }
}
