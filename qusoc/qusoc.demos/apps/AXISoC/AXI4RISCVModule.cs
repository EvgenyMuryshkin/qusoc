using QRV32.CPU;
using Quokka.RTL;
using rtl.modules;
using RTL.Modules;
using System;

namespace AXISoC
{
    public class AXI4RISCVModuleInputs
    {
        public AXI4RISCVModuleInputs()
        {
            S2M = new AXI4_S2M(axiSize.B4);
        }

        public AXI4_S2M S2M;
    }

    public class AXI4RISCVModule : RTLCombinationalModule<AXI4RISCVModuleInputs>
    {
        internal RISCVModule CPU;
        internal AXI4MasterModule Master = new AXI4MasterModule(axiSize.B4);
        public AXI4RISCVModule() : this(CPURegsType.RAM)
        {

        }

        public AXI4RISCVModule(CPURegsType regsType)
        {
            CPU = new RISCVModule(regsType);
        }

        RTLBitArray memAccessWSTRB
        {
            get
            {
                var mask = new RTLBitArray(RTLBitArrayInitType.MSB, "1111");

                if (CPU.MemAccessMode == 0)
                    mask = new RTLBitArray(RTLBitArrayInitType.MSB, "0001");
                else if (CPU.MemAccessMode == 1)
                    mask = new RTLBitArray(RTLBitArrayInitType.MSB, "0011");

                return mask;
            }
        }
        RTLBitArray addressBits => new RTLBitArray(CPU.MemAddress)[1, 0];
        RTLBitArray internalByte => addressBits << 3;

        RTLBitArray wstrb => (memAccessWSTRB << addressBits)[3, 0];
        RTLBitArray internalWriteData => (CPU.MemWriteData << internalByte).Resized(32);

        public AXI4_M2S M2S => Master.M2S;

        protected override void OnSchedule(Func<AXI4RISCVModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            CPU.Schedule(
                () => new RISCVModuleInputs()
                { 
                    BaseAddress = 0,
                    MemReady = Master.RACK || Master.WACK,
                    MemReadData = new RTLBitArray(Master.RDATA)
                }
            );

            Master.Schedule(
                () => new AXI4MasterModuleInputs()
                { 
                    S2M = Inputs.S2M,
                    Master = new AXI4MasterModuleInput()
                    { 
                        WE = CPU.MemWrite,
                        AWADDR = CPU.MemAddress,
                        WDATA = internalWriteData,
                        WSTRB = wstrb,
                        //BREADY = CPU.BREADY,
                        RE = CPU.MemRead,
                        //RREADY = CPU.RREADY,
                        ARADDR = CPU.MemAddress,
                    }
                }
            );

        }
    }
}
