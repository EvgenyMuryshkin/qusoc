using System;
using System.Linq;
using Quokka.RTL;

namespace RTL.Modules
{
    public class Nested_SDP_RF_RAMModule_Inputs
    {
        public byte ReadAddress;
        public byte WriteAddress;
        public byte WriteData;
        public bool WE;
    }

    public class Nested_SDP_RF_RAMModule_State_Container
    {
        public byte ReadData;
        public byte[] Buff = new byte[256];
    }

    public class Nested_SDP_RF_RAMModule_State
    {
        public Nested_SDP_RF_RAMModule_State_Container Data = new Nested_SDP_RF_RAMModule_State_Container();
    }

    public class Nested_SDP_RF_RAMModule : RTLSynchronousModule<Nested_SDP_RF_RAMModule_Inputs, Nested_SDP_RF_RAMModule_State>
    {
        public Nested_SDP_RF_RAMModule()
        {
        }

        public byte Data => State.Data.ReadData;

        protected override void OnStage()
        {
            if (Inputs.WE)
                NextState.Data.Buff[Inputs.WriteAddress] = Inputs.WriteData; 

            NextState.Data.ReadData = State.Data.Buff[Inputs.ReadAddress];
        }
    }
}
