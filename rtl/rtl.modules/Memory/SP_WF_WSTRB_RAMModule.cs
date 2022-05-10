using System;
using System.Linq;
using Quokka.RTL;

namespace RTL.Modules
{
    public class SP_WF_WSTRB_RAMModule_Inputs
    {
        public byte Address;
        public byte[] WriteData = new byte[4];
        public bool WE;
        public RTLBitArray WSTRB = new RTLBitArray().Resized(4);
    }

    public class SP_WF_WSTRB_RAMModule_State
    {
        public byte[] ReadData = new byte[4];
        public byte[][] Buff = Enumerable.Range(0, 32).Select(idx => new byte[4]).ToArray();
    }

    public class SP_WF_WSTRB_RAMModule : RTLSynchronousModule<SP_WF_WSTRB_RAMModule_Inputs, SP_WF_WSTRB_RAMModule_State>
    {
        public SP_WF_WSTRB_RAMModule()
        {
        }

        public uint Data => new RTLBitArray(State.ReadData);

        protected override void OnStage()
        {
            foreach (var w in range(4))
            {
                if (Inputs.WSTRB[w])
                    NextState.Buff[Inputs.Address][w] = Inputs.WriteData[w];

                NextState.ReadData[w] = NextState.Buff[Inputs.Address][w];
            }
        }
    }
}
