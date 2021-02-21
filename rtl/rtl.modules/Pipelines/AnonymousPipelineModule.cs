using Quokka.RTL;
using Quokka.RTL.Local;
using System;

namespace RTL.Modules
{
    public class AnonymousPipelineModuleInputs : PipelineTestInputs
    {

    }

    public class AnonymousPipelineModule : RTLSynchronousModule<AnonymousPipelineModuleInputs, PipelinesTestModuleEmptyState>
    {
        IRTLPipelineStage<PipelineTestInputs, PipelineResult> Pipeline;

        public bool outReady => Pipeline.State.ready;
        public ushort outResult => Pipeline.State.result;

        public AnonymousPipelineModule()
        {
            Pipeline = LocalPipelineConfig;
        }

        IRTLPipelineStage<PipelineTestInputs, PipelineResult> LocalPipelineConfig
            => PipelineBuilder
                .Source<PipelineTestInputs>()
                .Stage(i => new { 
                    IsS0Ready = i.inReady, 
                    sum01 = i.inData[0] + i.inData[1],
                    sum23 = i.inData[2] + i.inData[3],
                    sum45 = i.inData[4] + i.inData[5],
                    sum67 = i.inData[6] + i.inData[7],
                })
                .Stage(s0 => new { 
                    IsS1Ready = s0.IsS0Ready,
                    sum0123 = s0.sum01 + s0.sum23,
                    sum4567 = s0.sum45 + s0.sum67
                })
                .Stage(s1 => new PipelineResult() { 
                    ready = s1.IsS1Ready,
                    result = (ushort)(s1.sum0123 + s1.sum4567)
                });

        protected override void OnSchedule(Func<AnonymousPipelineModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            Pipeline.Schedule(() => Inputs);
        }

        protected override void OnStage()
        {
        }
    }
}
