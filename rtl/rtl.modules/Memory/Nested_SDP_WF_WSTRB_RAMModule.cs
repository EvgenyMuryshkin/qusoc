using System;
using System.Linq;
using Quokka.RTL;

namespace RTL.Modules
{
    public class Nested_SDP_WF_WSTRB_RAMModule_Inputs
    {
        public byte ReadAddress;
        public byte WriteAddress;
        public byte[] WriteData = new byte[4];
        public bool WE;
        public RTLBitArray WSTRB = new RTLBitArray().Resized(4);
    }

    public class Nested_SDP_WF_WSTRB_RAMModule_State_Container
    {
        public byte[] ReadData = new byte[4];
        public byte[][] Buff = Enumerable.Range(0, 32).Select(idx => new byte[4]).ToArray();
    }

    public class Nested_SDP_WF_WSTRB_RAMModule_State
    {
        public Nested_SDP_WF_WSTRB_RAMModule_State_Container Data = new Nested_SDP_WF_WSTRB_RAMModule_State_Container();
    }

    public class Nested_SDP_WF_WSTRB_RAMModule : RTLSynchronousModule<Nested_SDP_WF_WSTRB_RAMModule_Inputs, Nested_SDP_WF_WSTRB_RAMModule_State>
    {
        public Nested_SDP_WF_WSTRB_RAMModule()
        {
        }

        public byte[] Data => State.Data.ReadData;//public RTLBitArray Data => new RTLBitArray(State.ReadData);

        protected override void OnStage()
        {
            foreach (var w in range(4))
            {
                if (Inputs.WSTRB[w])
                    NextState.Data.Buff[Inputs.WriteAddress][w] = Inputs.WriteData[w];
            }

            NextState.Data.ReadData = NextState.Data.Buff[Inputs.ReadAddress];
        }
    }
}
