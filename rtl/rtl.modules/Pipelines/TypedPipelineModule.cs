using Quokka.RTL;
using Quokka.RTL.Local;
using System;

namespace RTL.Modules
{
    public abstract class TypedPipelineModuleStage
    {
        public bool ready;
    }

    public class TypedPipelineModuleStage0 : TypedPipelineModuleStage
    {
        public ushort[] sums;
    }

    public class TypedPipelineModuleStage1 : TypedPipelineModuleStage
    {
        public ushort[] s0Sums;
        public ushort[] sums;
    }

    public class TypedPipelineModuleStage2 : TypedPipelineModuleStage
    {
        public ushort result;
    }

    public static class TypedPipelineModuleLogic
    {
        public static TypedPipelineModuleStage2 Stage2Logic(TypedPipelineModuleStage1 stage1)
        {
            return new TypedPipelineModuleStage2()
            {
                ready = stage1.ready,
                result = (ushort)(stage1.sums[0] + stage1.sums[0] + stage1.s0Sums[4])
            };
        }
    }

    public class TypedPipelineModule : RTLSynchronousModule<PipelineTestInputs, PipelinesTestModuleEmptyState>
    {
        IRTLPipelineStage<PipelineTestInputs, TypedPipelineModuleStage2> Pipeline;

        public bool outReady => Pipeline.State.ready;
        public ushort outResult => Pipeline.State.result;

        public TypedPipelineModule()
        {
            Pipeline = LocalPipelineConfig;
        }

        public TypedPipelineModuleStage0 Stage0Logic(PipelineTestInputs inputs)
        {
            var sum0 = (ushort)(inputs.inData[0] + inputs.inData[1]);
            return new TypedPipelineModuleStage0
            {
                ready = inputs.inReady,
                sums = new ushort[]
                {
                    sum0,
                    (ushort)(inputs.inData[2] + inputs.inData[3]),
                    (ushort)(inputs.inData[4] + inputs.inData[5]),
                    (ushort)(inputs.inData[6] + inputs.inData[7]),
                    42
                }
            };
        }

        public TypedPipelineModuleStage1 Stage1Logic(TypedPipelineModuleStage0 stage0)
        {
            return new TypedPipelineModuleStage1
            {
                ready = stage0.ready,
                s0Sums = stage0.sums,
                sums = new[]
                {
                    (ushort)(stage0.sums[0] + stage0.sums[1]),
                    (ushort)(stage0.sums[2] + stage0.sums[3])
                }
            };
        }

        IRTLPipelineStage<PipelineTestInputs, TypedPipelineModuleStage2> LocalPipelineConfig
            => PipelineBuilder
                .Source<PipelineTestInputs>()
                .Stage(i => Stage0Logic(i))
                .Stage(s0 => Stage1Logic(s0))
                .Stage(s1 => TypedPipelineModuleLogic.Stage2Logic(s1));

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
