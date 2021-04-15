using System;
using System.Linq;
using Quokka.RTL;

namespace RTL.Modules
{
    public class SP_WF_RAMModule_Inputs
    {
        public byte Address;
        public byte WriteData;
        public bool WE;
    }

    public class SP_WF_RAMModule_State
    {
        public byte ReadData;
        public byte[] Buff = new byte[256];
    }

    public class SP_WF_RAMModule : RTLSynchronousModule<SP_WF_RAMModule_Inputs, SP_WF_RAMModule_State>
    {
        public SP_WF_RAMModule()
        {
        }

        public byte Data => State.ReadData;

        protected override void OnStage()
        {
            if (Inputs.WE)
                NextState.Buff[Inputs.Address] = Inputs.WriteData; 

            NextState.ReadData = NextState.Buff[Inputs.Address];
        }
    }
}
