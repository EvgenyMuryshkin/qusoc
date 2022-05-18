using Quokka.RTL;
using RTL.Modules;
using System;
using System.Linq;

namespace rtl.modules
{
    public class AXI4MemoryModuleInputs
    {
        public AXI4MemoryModuleInputs() : this(axiSize.B4) { }

        public AXI4MemoryModuleInputs(axiSize size)
        {
            M2S = new AXI4_M2S(size);
            //WDATA = new byte[AXI4Tools.Bytes(size)];
        }

        public AXI4_M2S M2S;
        /*
        public bool WE = false;
        public byte[] WDATA = null;
        */
    }

    public class AXI4MemoryModuleState
    {
        public AXI4MemoryModuleState() : this(axiSize.B4, 0) { }
        public AXI4MemoryModuleState(axiSize size, int depth) 
        {
            buff = Enumerable.Range(0, depth).Select(i => new byte[AXI4Tools.Bytes(size)]).ToArray();
            read = new byte[AXI4Tools.Bytes(size)];
        }

        public byte[][] buff;
        public byte[] read;
        public bool rValid;
    }

    public class AXI4MemoryModule : RTLSynchronousModule<AXI4MemoryModuleInputs, AXI4MemoryModuleState>
    {
        internal AXI4NonBufferedSlaveModule axiSlave;
        private readonly axiSize size;
        public AXI4MemoryModule(axiSize size, int depth)
        {
            this.size = size;
            axiSlave = new AXI4NonBufferedSlaveModule(size);
            InitInputs(new AXI4MemoryModuleInputs(size));
            InitState(new AXI4MemoryModuleState(size, depth));
        }
        /*
        public byte[] OutData => State.bytes;
        public bool OutACK => Inputs.WE;
        */
        public AXI4_S2M S2M => axiSlave.S2M;

        protected override void OnSchedule(Func<AXI4MemoryModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            axiSlave.Schedule(() => new AXI4NonBufferedSlaveModuleInputs()
            {
                M2S = Inputs.M2S,
                RACK = State.rValid,
                RDATA = State.read,
                WACK = true
            });
        }
        protected override void OnStage()
        {
            if (axiSlave.WVALID)
            {
                foreach (var w in range(AXI4Tools.Bytes(size)))
                {
                    if (axiSlave.WSTRB[w])
                        NextState.buff[axiSlave.AWADDR][w] = axiSlave.WDATA[w];
                }
            }

            NextState.rValid = axiSlave.RVALID;
            NextState.read = NextState.buff[axiSlave.ARADDR];
        }
    }
}
