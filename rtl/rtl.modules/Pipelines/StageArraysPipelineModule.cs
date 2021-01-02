using Quokka.RTL;
using Quokka.RTL.Local;
using System;

namespace RTL.Modules
{
    public class StageArraysPipelineModule : RTLSynchronousModule<PipelineTestInputs, PipelinesTestModuleEmptyState>
    {
        IRTLPipelineStage<PipelineTestInputs, PipelineResult> Pipeline;

        public bool outReady => Pipeline.State.ready;
        public ushort outResult => Pipeline.State.result;

        public StageArraysPipelineModule()
        {
            Pipeline = LocalPipelineConfig;
        }

        IRTLPipelineStage<PipelineTestInputs, PipelineResult> LocalPipelineConfig
            => PipelineBuilder
                .Source<PipelineTestInputs>()
                .Stage(i => new {
                    IsS0Ready = i.inReady,
                    sums = new ushort[]
                    {
                        (ushort)(i.inData[0] + i.inData[1]),
                        (ushort)(i.inData[2] + i.inData[3]),
                        (ushort)(i.inData[4] + i.inData[5]),
                        (ushort)(i.inData[6] + i.inData[7]),
                        42
                    }
                })
                .Stage(s0 => new {
                    IsS1Ready = s0.IsS0Ready,
                    s0Sums = s0.sums,
                    sums = new[]
                    {
                        (ushort)(s0.sums[0] + s0.sums[1]),
                        (ushort)(s0.sums[2] + s0.sums[3])
                    }
                })
                .Stage(s1 => new PipelineResult() {
                    ready = s1.IsS1Ready,
                    result = (ushort)(s1.sums[0] + s1.sums[0] + s1.s0Sums[4])
                });

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
