using Quokka.RTL;
using RTL.Modules;
using System;

namespace rtl.modules
{
    public class AXI4MasterSlaveTestModuleInputs
    {
        public uint InData;
        public bool WE;
        public bool RE;
        public bool SWE;
    }

    public class AXI4MasterSlaveTestModuleState
    {
        public byte[] ReadData = new byte[4];
    }

    public class AXI4MasterSlaveTestModule : RTLSynchronousModule<AXI4MasterSlaveTestModuleInputs, AXI4MasterSlaveTestModuleState>
    {
        internal AXI4RegisterModule s = new AXI4RegisterModule(axiSize.B4);
        internal AXI4MasterModule m = new AXI4MasterModule(axiSize.B4);

        public AXI4MasterSlaveTestModule()
        {

        }

        public byte[] OutSlaveData => s.OutData;
        public bool OutACK => m.OutACK;
        public byte[] OutMasterData => m.RDATA;

        public RTLBitArray OutMasterWord => new RTLBitArray(m.RDATA);
        public RTLBitArray OutSlaveWord => new RTLBitArray(s.OutData);

        protected override void OnSchedule(Func<AXI4MasterSlaveTestModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            s.Schedule(() => new AXI4RegisterModuleInputs(axiSize.B4)
            {
                M2S = m.M2S,
                WE = Inputs.SWE,
                WDATA = new RTLBitArray(Inputs.InData),
            });

            m.Schedule(() => new AXI4MasterModuleInputs(axiSize.B4)
            {
                S2M = s.S2M,
                WE = Inputs.WE,
                RE = Inputs.RE,
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
