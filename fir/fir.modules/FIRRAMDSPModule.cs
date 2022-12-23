using Quokka.RTL;
using System;

namespace fir.modules
{
    public class FIRRAMDSPModuleInputs
    {
        // ram
        public bool iRAM_WR;
        public byte iRAM_WR_ADDR;
        public ushort iRAM_WR_DATA;

        public bool iRAM_RD;
        public byte iRAM_RD_ADDR;

        // dsp
        public bool iDSP_CE;
        public RTLBitArray iDSP_A = new RTLBitArray().Resized(30);
        public RTLBitArray iDSP_D = new RTLBitArray().Resized(25);
        public RTLBitArray iDSP_PCIN = new RTLBitArray().Resized(48);
        public RTLBitArray iDSP_OPMODE = new RTLBitArray().Resized(3);
    }

    public class FIRRAMDSPModuleState
    {
        public bool UnusedSignal { get; set; }
    }

    public class FIRRAMDSPModule : RTLSynchronousModule<FIRRAMDSPModuleInputs, FIRRAMDSPModuleState>
    {
        public FIRRAMDSPModule()
        {
            u_ram = new FIRDecimatorRAM(2, 256);
            u_dsp = new FIRDSPWrapperModule();
        }
        
        FIRDecimatorRAM u_ram;
        FIRDSPWrapperModule u_dsp;

        public RTLBitArray oDSP_PCOUT => u_dsp.PCOUT;
        public RTLBitArray oDSP_P => u_dsp.P;

        protected override void OnSchedule(Func<FIRRAMDSPModuleInputs> inputsFactory)
        {
            u_ram.Schedule(() => new FIRDecimatorRAMInputs()
            {
                CE = true,
                WR = Inputs.iRAM_WR,
                WR_ADDR = Inputs.iRAM_WR_ADDR,
                DIN = Inputs.iRAM_WR_DATA,
                RD = Inputs.iRAM_RD,
                RD_ADDR = Inputs.iRAM_RD_ADDR
            });

            u_dsp.Schedule(() => new FIRDSPWrapperModuleInputs()
            {
                CE = Inputs.iDSP_CE,
                RST = false,
                A = Inputs.iDSP_A,
                B = u_ram.DOUT.Resized(18),
                D = Inputs.iDSP_D,
                PCIN = Inputs.iDSP_PCIN,
                OPMODE = Inputs.iDSP_OPMODE
            });
        }

        protected override void OnStage()
        {
        }
    }
}
