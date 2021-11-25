using Quokka.RTL;
using RTL.Modules;
using System;

namespace rtl.modules
{
    public class AXI4MasterSlaveMemoryTestModuleInputs
    {
        public uint AXADDR;
        public uint InData;
        public bool WE;
        public bool RE;
        public bool SWE;
    }

    public class AXI4MasterSlaveMemoryTestModuleState
    {
        public byte[] ReadData = new byte[4];
    }

    public class AXI4MasterSlaveMemoryTestModule : RTLSynchronousModule<AXI4MasterSlaveMemoryTestModuleInputs, AXI4MasterSlaveMemoryTestModuleState>
    {
        internal AXI4MemoryModule s = new AXI4MemoryModule(axiSize.B4, 1024);
        internal AXI4MasterModule m = new AXI4MasterModule(axiSize.B4);

        public AXI4MasterSlaveMemoryTestModule()
        {

        }

        public bool OutACK => m.OutACK;
        public byte[] OutMasterData => m.RDATA;

        public RTLBitArray OutMasterWord => new RTLBitArray(m.RDATA);

        protected override void OnSchedule(Func<AXI4MasterSlaveMemoryTestModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            s.Schedule(() => new AXI4MemoryModuleInputs(axiSize.B4)
            {
                M2S = m.M2S,
                //WE = Inputs.SWE,
                //WDATA = new RTLBitArray(Inputs.InData),
            });

            m.Schedule(() => new AXI4MasterModuleInputs(axiSize.B4)
            {
                S2M = s.S2M,
                WE = Inputs.WE,
                RE = Inputs.RE,
                AXADDR = Inputs.AXADDR,
                WDATA = new RTLBitArray(Inputs.InData),
                WSTRB = new RTLBitArray(byte.MaxValue)[3,0]
            });
        }

        protected override void OnStage()
        {
            if (s.S2M.R.RVALID)
            {
                NextState.ReadData = s.S2M.R.RDATA;
            }
        }
    }
}
