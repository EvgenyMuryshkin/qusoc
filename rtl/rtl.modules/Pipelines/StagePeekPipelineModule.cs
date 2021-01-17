using Quokka.RTL;
using Quokka.RTL.Local;
using System;

namespace RTL.Modules
{
    public class StagePeekPipelineModule : RTLSynchronousModule<PipelineTestInputs, PipelinesTestModuleEmptyState>
    {
        IRTLPipelineStage<PipelineTestInputs, TypedPipelineModuleStage2> Pipeline;

        public bool outReady => Pipeline.State.ready;
        public ushort outResult => Pipeline.State.result;

        IRTLPipelinePeek<TypedPipelineModuleStage1> stage1Peek => Pipeline.Peek<TypedPipelineModuleStage1>();
        public bool stage1Ready => stage1Peek.State.ready;
        public ushort stage1Sum0 => stage1Peek.State.sums[0];
        public ushort stage1Sum1 => Pipeline.Peek<TypedPipelineModuleStage1>().State.sums[1];

        public StagePeekPipelineModule()
        {
            Pipeline = PipelineConfigurations.TypedPipelineConfig;
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
