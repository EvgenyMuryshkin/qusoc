using Quokka.RTL;
using System;
using System.Text;

namespace axi.modules
{
    public class AXI4RegisterModuleB4 : AXI4RegisterModule
    {
        public AXI4RegisterModuleB4() : base(axiSize.B4)
        {

        }
    }

    public class AXI4MasterModuleB4 : AXI4MasterModule
    {
        public AXI4MasterModuleB4() : base(axiSize.B4)
        {

        }
    }

    public class AXI4MemoryModuleB4 : AXI4MemoryModule
    {
        public AXI4MemoryModuleB4() : base(axiSize.B4, 1024)
        {

        }
    }

    public class AXI4NonBufferedSlaveModuleB4 : AXI4NonBufferedSlaveModule
    {
        public AXI4NonBufferedSlaveModuleB4() : base(axiSize.B4)
        {

        }
    }

    public class AXI4Encoder7Module : AXI4EncoderModule
    {
        public AXI4Encoder7Module() : base(7) { }
    }

    public class AXI4Encoder2Module : AXI4EncoderModule
    {
        public AXI4Encoder2Module() : base(2) { }
    }

    public class AXI4Interconnect2x4Module : AXI4InterconnectModule
    {
        public AXI4Interconnect2x4Module() : base(axiSize.B4, 2, 4) { }
    }

    public class AXIRangeDetectorModuleB4 : AXIRangeDetectorModule
    {
        public AXIRangeDetectorModuleB4() : base(axiSize.B4) { }
    }

    public class AXI4PassThroughModuleInputs
    {
        public AXI4PassThroughModuleInputs()
        {
            iM2S = new AXI4_M2S(axiSize.B4);
            iS2M = new AXI4_S2M(axiSize.B4);
        }

        public AXI4_M2S iM2S;
        public AXI4_S2M iS2M;
    }

    public class AXI4PassThroughModule : RTLCombinationalModule<AXI4PassThroughModuleInputs>
    {
        public AXI4PassThroughModule()
        {
            m2s = new AXI4_M2S[1] { new AXI4_M2S(axiSize.B4) };
            s2m = new AXI4_S2M[1] { new AXI4_S2M(axiSize.B4) };
        }

        AXI4_M2S[] m2s;
        AXI4_S2M[] s2m; 

        public AXI4_M2S oM2S => m2s[0];
        public AXI4_S2M oS2M => s2m[0];

        protected override void OnSchedule(Func<AXI4PassThroughModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
        }

        protected override void OnDeltaCycle()
        {
            base.OnDeltaCycle();

            m2s[0] = Inputs.iM2S;
            s2m[0] = Inputs.iS2M;
        }
    }

    public class AXI4IncrementOnReadCounterModuleB4 : AXI4IncrementOnReadCounterModule
    {
        public AXI4IncrementOnReadCounterModuleB4() : base(axiSize.B4) { }
    }

    public class AXI4AutoDecrementRegisterModuleB4 : AXI4AutoDecrementRegisterModule
    {
        public AXI4AutoDecrementRegisterModuleB4() : base(axiSize.B4) { }
    }
}
