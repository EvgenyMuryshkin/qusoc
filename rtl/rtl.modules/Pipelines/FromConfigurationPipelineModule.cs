using Quokka.RTL;
using Quokka.RTL.Local;
using System;

namespace RTL.Modules
{
    public class FromConfigurationPipelineModule : RTLSynchronousModule<PipelineTestInputs, PipelinesTestModuleEmptyState>
    {
        IRTLPipelineStage<PipelineTestInputs, PipelineResult> Pipeline;

        public bool outReady => Pipeline.State.ready;
        public ushort outResult => Pipeline.State.result;

        public FromConfigurationPipelineModule()
        {
            Pipeline = PipelineConfigurations.LocalPipelineConfig;
        }

        protected override void OnSchedule(Func<PipelineTestInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            Pipeline.Schedule(() => Inputs);
        }

        protected override void OnStage()
        {
        }
    }
}
