using Quokka.RTL;
using Quokka.RTL.Tools;
using System;

namespace RTL.Modules
{
    public class VGAControllerInputs
    {
    }

    public class VGAControllerState
    {

    }

    public enum VGAControllerMode
    {
        Test,
        SVGA_800_600_60
    }

    public class VGAController : RTLSynchronousModule<VGAControllerInputs, VGAControllerState>
    {
        internal readonly uint addrBits;

        VGASyncModule hSync;
        VGASyncModule vSync;

        bool internalVisible => vSync.OutVisible && hSync.OutVisible;
        public bool VSync => !vSync.OutSP;
        public bool HSync => !hSync.OutSP;
        public bool OutVisible => vSync.OutVisible && hSync.OutVisible;
        public RTLBitArray OutVPixel => vSync.OutCounter;
        public RTLBitArray OutHPixel => hSync.OutCounter;
        public RTLBitArray OutPixelAddress => (internalVisible ? vSync.OutCounter * 800 + hSync.OutCounter : new RTLBitArray(0)).Unsigned().Resized(addrBits);

        public VGAController(VGAControllerMode mode)
        {
            switch (mode)
            {
                case VGAControllerMode.SVGA_800_600_60:
                    hSync = new VGASyncModule(800, 40, 128, 88);
                    vSync = new VGASyncModule(600, 1, 4, 23);
                    addrBits = RTLCalculators.CalcBitsForValue(800 * 600);
                    break;
                case VGAControllerMode.Test:
                    hSync = new VGASyncModule(80, 40, 128, 88);
                    vSync = new VGASyncModule(60, 1, 4, 23);
                    addrBits = RTLCalculators.CalcBitsForValue(80 * 60);
                    break;
            }
        }

        protected override void OnSchedule(Func<VGAControllerInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            hSync.Schedule(() => new VGASyncModuleInputs() { Enabled = true });
            vSync.Schedule(() => new VGASyncModuleInputs() { Enabled = hSync.OutMax });
        }

        protected override void OnStage()
        {
        }
    }
}
