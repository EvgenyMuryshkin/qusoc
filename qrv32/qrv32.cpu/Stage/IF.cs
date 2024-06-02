using System;
using System.Collections.Generic;
using System.Text;

namespace QRV32.CPU
{
    public partial class RISCVModule
    {
        void InstructionFetchStage()
        {
            if (Inputs.MemReady)
            {
                NextState.State = CPUState.ID;
                NextState.Instruction = Inputs.MemReadData;
            }
        }

        void SetIFStage()
        {
            NextState.State = CPUState.IF;

            if (Inputs.ExtReset)
            {
                NextState.State = CPUState.Reset;
            }
        }
    }
}
