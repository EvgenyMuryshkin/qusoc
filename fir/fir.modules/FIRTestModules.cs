using System;
using System.Collections.Generic;
using System.Text;

namespace fir.modules
{
    public class FIRStageDSPModule16 : FIRStageDSPModule
    {
        public FIRStageDSPModule16() : base(new FIRParams(4, 16, 16, 4, 2, 8))
        {

        }
    }

    public class FIRStageModule16 : FIRStageModule
    {
        public FIRStageModule16() : base(new FIRParams(4, 16, 16, 4, 2, 8))
        {

        }
    }
    public class FIRModule4x16 : FIRModule
    {
        public FIRModule4x16() : base(new FIRParams(4, 16, 24, 4, 2, 8))
        {

        }
    }
}
