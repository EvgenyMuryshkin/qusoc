using Quokka.RTL;
using System;
using System.Collections.Generic;
using System.Text;

namespace RTL.Modules
{
    public class VGAModuleInputs
    {

    }

    public class VGAModuleState
    {

    }

    public class VGAModule : RTLSynchronousModule<VGAModuleInputs, VGAModuleState>
    {
        VGASyncModule hSync;
        VGASyncModule vSync;

        public VGAModule()
        {
            //hSync = new VGASyncModule(640, 16, 96, 48);
            //vSync = new VGASyncModule(480, 10, 2, 33);
            hSync = new VGASyncModule(800, 40, 128, 88);
            vSync = new VGASyncModule(600, 1, 4, 23);
        }

        bool internalIsVisible => vSync.OutVisible && hSync.OutVisible;


        public bool VSync => !vSync.OutSP;
        public bool HSync => !hSync.OutSP;
        public bool IsVisible => internalIsVisible;

        bool first100 => hSync.OutCounter < 100;
        bool last100 => hSync.OutCounter > 700;

        public bool R => internalIsVisible;// & first100;
        public bool G => internalIsVisible;// & !first100 & !last100;
        public bool B => internalIsVisible;// & last100;

        protected override void OnSchedule(Func<VGAModuleInputs> inputsFactory)
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
