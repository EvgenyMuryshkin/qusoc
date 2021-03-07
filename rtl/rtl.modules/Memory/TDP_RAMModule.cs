using System;
using System.Linq;
using Quokka.RTL;

namespace RTL.Modules
{
    public class TDP_RAMModule_Inputs
    {
        public byte Addr_A;
        public byte WriteData_A;
        public bool WE_A;
        public byte Addr_B;
        public byte WriteData_B;
        public bool WE_B;
    }

    public class TDP_RAMModule_State
    {
        public bool SameAddressWrite;
        public byte DataA;
        public byte DataB;
        public byte[] Buff = new byte[256];
    }

    public class TDP_RAMModule : RTLSynchronousModule<TDP_RAMModule_Inputs, TDP_RAMModule_State>
    {
        public TDP_RAMModule()
        {
        }

        public byte OutDataA => State.DataA;
        public byte OutDataB => State.DataB;
        public bool OutCorrupted => State.SameAddressWrite;

        protected override void OnStage()
        {
            NextState.SameAddressWrite = State.SameAddressWrite || (Inputs.WE_A && Inputs.WE_B && Inputs.Addr_A == Inputs.Addr_B);

            if (Inputs.WE_A)
                NextState.Buff[Inputs.Addr_A] = Inputs.WriteData_A; 

            NextState.DataA = NextState.Buff[Inputs.Addr_A];

            if (Inputs.WE_B)
                NextState.Buff[Inputs.Addr_B] = Inputs.WriteData_B;

            NextState.DataB = NextState.Buff[Inputs.Addr_B];
        }
    }
}
