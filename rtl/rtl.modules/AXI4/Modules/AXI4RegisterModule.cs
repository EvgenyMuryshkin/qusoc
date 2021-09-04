using Quokka.RTL;
using RTL.Modules;
using System;

namespace rtl.modules
{
    public class AXI4RegisterModuleInputs
    {
        public AXI4RegisterModuleInputs() : this(axiSize.B4) { }

        public AXI4RegisterModuleInputs(axiSize size)
        {
            M2S = new AXI4_M2S(size);
            WDATA = new byte[AXI4Tools.Bytes(size)];
        }

        public AXI4_M2S M2S;
        public bool WE = false;
        public byte[] WDATA = null;
    }

    public class AXI4RegisterModuleState
    {
        public AXI4RegisterModuleState() : this(axiSize.B4) { }
        public AXI4RegisterModuleState(axiSize size) 
        {
            bytes = new byte[AXI4Tools.Bytes(size)];
        }

        public byte[] bytes;
    }

    public class AXI4RegisterModule : RTLSynchronousModule<AXI4RegisterModuleInputs, AXI4RegisterModuleState>
    {
        internal AXI4NonBufferedSlaveModule axiSlave;
        private readonly axiSize size;
        public AXI4RegisterModule(axiSize size)
        {
            this.size = size;
            axiSlave = new AXI4NonBufferedSlaveModule(size);
            InitInputs(new AXI4RegisterModuleInputs(size));
            InitState(new AXI4RegisterModuleState(size));
        }

        public byte[] OutData => State.bytes;
        public bool OutACK => Inputs.WE;

        public AXI4_S2M S2M => axiSlave.S2M;

        protected override void OnSchedule(Func<AXI4RegisterModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            axiSlave.Schedule(() => new AXI4NonBufferedSlaveModuleInputs()
            {
                M2S = Inputs.M2S,
                RACK = true,
                RVALID = true,
                RDATA = State.bytes,
                WACK = true
            });
        }
        protected override void OnStage()
        {
            if (Inputs.WE)
            {
                NextState.bytes = Inputs.WDATA;
            }
            else if (axiSlave.WVALID)
            {
                foreach (var w in range(AXI4Tools.Bytes(size)))
                {
                    if (axiSlave.WSTRB[w])
                        NextState.bytes[w] = axiSlave.WDATA[w];
                }
            } 
        }
    }
}
