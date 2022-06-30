using Quokka.RTL;
using RTL.Modules;
using System;

namespace rtl.modules
{
    public class AXI4MasterSlaveMemoryTestModuleInputs
    {
        public uint AXADDR;
        public RTLBitArray InData = new RTLBitArray().Resized(32);
        public bool MWE;
        public RTLBitArray WSTRB = new RTLBitArray().Resized(4);
        public bool MRE;
    }

    public class AXI4MasterSlaveMemoryTestModuleState
    {
        public bool RACK;
        public byte[] ReadData = new byte[4];
    }

    public class AXI4MasterSlaveMemoryTestModule : RTLSynchronousModule<AXI4MasterSlaveMemoryTestModuleInputs, AXI4MasterSlaveMemoryTestModuleState>
    {
        internal AXI4MemoryModule mem = new AXI4MemoryModule(axiSize.B4, 1024);
        internal AXI4MasterModule master = new AXI4MasterModule(axiSize.B4);

        public AXI4MasterSlaveMemoryTestModule()
        {

        }

        public RTLBitArray ReadData => new RTLBitArray(State.ReadData);

        public bool RVALID => mem.S2M.R.RVALID;
        public bool BVALID => mem.S2M.B.BVALID;

        public bool RACK => State.RACK;
        public bool WACK => master.WACK;


        protected override void OnSchedule(Func<AXI4MasterSlaveMemoryTestModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            mem.Schedule(() => new AXI4MemoryModuleInputs(axiSize.B4)
            {
                M2S = master.M2S
            });

            master.Schedule(() => new AXI4MasterModuleInputs(axiSize.B4)
            {
                S2M = mem.S2M,
                WE = Inputs.MWE,
                RE = Inputs.MRE,
                ARADDR = Inputs.AXADDR,
                AWADDR = Inputs.AXADDR,
                WDATA = Inputs.InData,
                WSTRB = Inputs.WSTRB
            });
        }

        protected override void OnStage()
        {
            NextState.RACK = master.RACK;

            if (mem.S2M.R.RVALID)
            {
                NextState.ReadData = mem.S2M.R.RDATA;
            }
        }
    }
}
