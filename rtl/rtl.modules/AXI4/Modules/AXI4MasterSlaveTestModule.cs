using Quokka.RTL;
using RTL.Modules;
using System;

namespace rtl.modules
{
    public class AXI4MasterSlaveTestModuleInputs
    {
        public RTLBitArray InData = new RTLBitArray().Resized(32);
        public bool MWE;
        public RTLBitArray WSTRB = new RTLBitArray().Resized(4);
        public bool MRE;
        public bool SWE;
    }

    public class AXI4MasterSlaveTestModuleState
    {
        public byte[] ReadData = new byte[4];
    }

    public class AXI4MasterSlaveTestModule : RTLSynchronousModule<AXI4MasterSlaveTestModuleInputs, AXI4MasterSlaveTestModuleState>
    {
        internal AXI4RegisterModule reg = new AXI4RegisterModule(axiSize.B4);
        internal AXI4MasterModule master = new AXI4MasterModule(axiSize.B4);

        public AXI4MasterSlaveTestModule()
        {

        }

        public RTLBitArray ReadData => new RTLBitArray(State.ReadData);
        public RTLBitArray RegisterData => new RTLBitArray(reg.outData);

        public bool RVALID => reg.S2M.R.R.RVALID;
        public bool BVALID => reg.S2M.W.B.BVALID;

        public bool RACK => master.RACK;
        public bool WACK => master.WACK;

        protected override void OnSchedule(Func<AXI4MasterSlaveTestModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            reg.Schedule(() => new AXI4RegisterModuleInputs(axiSize.B4)
            {
                M2S = master.M2S,
                inWE = Inputs.SWE,
                inWDATA = Inputs.InData,
            });

            master.Schedule(() => new AXI4MasterModuleInputs(axiSize.B4)
            {
                S2M = reg.S2M,
                WE = Inputs.MWE,
                RE = Inputs.MRE,
                ARADDR = 0,
                AWADDR = 0,
                WDATA = Inputs.InData,
                WSTRB = Inputs.WSTRB
            });
        }

        protected override void OnStage()
        {
            if (reg.S2M.R.R.RVALID)
            {
                NextState.ReadData = reg.S2M.R.R.RDATA;
            }
        }
    }
}
