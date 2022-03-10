using System;
using System.Linq;
using Quokka.RTL;

namespace RTL.Modules
{
    public class SP_WF_WSTRB_RAMModule_Inputs
    {
        public byte ReadAddress;
        public byte WriteAddress;
        public byte[] WriteData = new byte[4];
        public bool WE;
        public RTLBitArray WSTRB = new RTLBitArray().Resized(4);
    }

    public class SP_WF_WSTRB_RAMModule_State
    {
        public byte[] ReadData = new byte[4];
        public byte[][] Buff = Enumerable.Range(0, 256).Select(idx => new byte[4]).ToArray();
    }

    public class SP_WF_WSTRB_RAMModule : RTLSynchronousModule<SP_WF_WSTRB_RAMModule_Inputs, SP_WF_WSTRB_RAMModule_State>
    {
        public SP_WF_WSTRB_RAMModule()
        {
        }

        public byte[] Data => State.ReadData;//public RTLBitArray Data => new RTLBitArray(State.ReadData);
        //public byte[] Buff0 => State.Buff[0];//public RTLBitArray Data => new RTLBitArray(State.ReadData);

        protected override void OnStage()
        {
            if (Inputs.WE)
            {
                //NextState.Buff[Inputs.WriteAddress] = Inputs.WriteData;
                foreach (var w in range(4))
                {
                    if (Inputs.WSTRB[w])
                        NextState.Buff[Inputs.WriteAddress][w] = Inputs.WriteData[w];
                }
                //NextState.Buff[Inputs.WriteAddress] = Inputs.WriteData;
            }
            //NextState.ReadData = NextState.Buff[Inputs.ReadAddress];
            //NextState.ReadData = State.Buff[Inputs.ReadAddress];
        }
    }
}
