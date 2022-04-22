using System;
using System.Linq;
using Quokka.RTL;

namespace RTL.Modules
{
    public class SDP_RF_WSTRB_RAMModule_Inputs
    {
        public byte ReadAddress;
        public byte WriteAddress;
        public byte[] WriteData = new byte[4];
        public bool WE;
        public RTLBitArray WSTRB = new RTLBitArray().Resized(4);
    }

    public class SDP_RF_WSTRB_RAMModule_State
    {
        public byte[] ReadData = new byte[4];
        public byte[][] Buff = Enumerable.Range(0, 32).Select(idx => new byte[4]).ToArray();
    }

    public class SDP_RF_WSTRB_RAMModule : RTLSynchronousModule<SDP_RF_WSTRB_RAMModule_Inputs, SDP_RF_WSTRB_RAMModule_State>
    {
        public SDP_RF_WSTRB_RAMModule()
        {
        }

        public byte[] Data => State.ReadData;

        protected override void OnStage()
        {
            foreach (var w in range(4))
            {
                if (Inputs.WSTRB[w])
                    NextState.Buff[Inputs.WriteAddress][w] = Inputs.WriteData[w];
            }

            NextState.ReadData = State.Buff[Inputs.ReadAddress];
        }
    }
}
