using Quokka.Public.Tools;
using Quokka.RTL;
using System;
using System.Collections.Generic;
using System.Text;

namespace RTL.Modules
{
    public class VGAAlienArtModuleInputs
    {

    }

    public class VGAAlienArtModuleState
    {
        public int denominator = 3;
        public int offset = 0;
    }

    public struct VGAAlienArtPipelinePayload
    {
        public bool Visible;
        public bool VSync;
        public bool HSync;
    }

    public class VGAAlienArtModule : RTLSynchronousModule<VGAAlienArtModuleInputs, VGAAlienArtModuleState>
    {
        VGAController vgaController;
        TimerModule patternTimer;
        TimerModule offsetTimer;

        IRTLPipelineStage<IntDividerPipelineInputs<VGAAlienArtPipelinePayload>, IntDividerPipelineResult<VGAAlienArtPipelinePayload>> Pipeline 
            = IntDividerPipelineTools.DivPipeline<VGAAlienArtPipelinePayload>();

        public VGAAlienArtModule(TimerModule.Factory timerFactory)
        {
            InitVGA(VGAControllerMode.SVGA_800_600_60);

            // 40MHz module clock
            patternTimer = timerFactory(200000000); // change pattern every 5 seconds
            offsetTimer = timerFactory(2500000); // offset patter 16 times per second
        }

        public void InitVGA(VGAControllerMode mode = VGAControllerMode.SVGA_800_600_60)
        {
            vgaController = new VGAController(mode);
        }

        public bool R => false;
        public bool G => Pipeline.State.Payload.Visible & Pipeline.State.remainder == 0;
        public bool B => false;

        public bool OutVisible => Pipeline.State.Payload.Visible;
        public bool VSync => Pipeline.State.Payload.VSync;
        public bool HSync => Pipeline.State.Payload.HSync;

        protected override void OnSchedule(Func<VGAAlienArtModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            vgaController.Schedule(() => new VGAControllerInputs());
            patternTimer.Schedule(() => new TimerInputs() { Restart = false });
            offsetTimer.Schedule(() => new TimerInputs() { Restart = false });

            Pipeline.Schedule(() => new IntDividerPipelineInputs<VGAAlienArtPipelinePayload>()
            {
                Payload = new VGAAlienArtPipelinePayload()
                {
                    Visible = vgaController.OutVisible,
                    HSync = vgaController.HSync,
                    VSync = vgaController.VSync
                },
                inNumerator = ((State.offset + vgaController.OutVPixel) ^ vgaController.OutHPixel).Resized(32),
                inDenominator = State.denominator
            });
        }

        protected override void OnStage()
        {
            if (patternTimer.OutActive)
                NextState.denominator = State.denominator == 15 ? 3 : State.denominator + 1;

            if (offsetTimer.OutActive)
                NextState.offset = State.offset + 1;
        }
    }
}
