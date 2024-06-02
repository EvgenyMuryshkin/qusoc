using System;
using System.Collections.Generic;
using System.Text;

namespace QRV32.CPU
{
    public partial class RISCVModule
    {
        void ResetStage()
        {
            if (!Inputs.ExtReset)
            {
                SetIFStage();
                NextState.PC = Inputs.BaseAddress;
            }
        }
    }
}
