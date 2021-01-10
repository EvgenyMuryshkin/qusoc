using Quokka.RTL;
using Quokka.RTL.Local;
using System;

namespace RTL.Modules
{
    public abstract class AutoPropagatePipelineModuleStage
    {
        // nullable signals will be propagated through pipeline
        public bool? ready;
    }

    public class AutoPropagatePipelineModuleStage0 : AutoPropagatePipelineModuleStage
    {
        public ushort[] sums;
    }

    public class AutoPropagatePipelineModuleStage1 : AutoPropagatePipelineModuleStage
    {
        public ushort[] s0Sums;
        public ushort[] sums;
    }

    public class AutoPropagatePipelineModuleStage2 : AutoPropagatePipelineModuleStage
    {
        public ushort result;
    }

    public class AutoPropagatePipelineModule : RTLSynchronousModule<PipelineTestInputs, PipelinesTestModuleEmptyState>
    {
        IRTLPipelineStage<PipelineTestInputs, AutoPropagatePipelineModuleStage2> Pipeline;

        public bool outReady => (bool)Pipeline.State.ready;
        public ushort outResult => Pipeline.State.result;

        public AutoPropagatePipelineModule()
        {
            Pipeline = LocalPipelineConfig;
        }

        AutoPropagatePipelineModuleStage0 Stage0Logic(PipelineTestInputs inputs)
        {
            var sum0 = (ushort)(inputs.inData[0] + inputs.inData[1]);
            return new AutoPropagatePipelineModuleStage0
            {
                // ready signal is set once and then propagated through pipeline until explicitly changed
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

        AutoPropagatePipelineModuleStage1 Stage1Logic(AutoPropagatePipelineModuleStage0 stage0)
        {
            return new AutoPropagatePipelineModuleStage1
            {
                s0Sums = stage0.sums,
                sums = new[]
                {
                    (ushort)(stage0.sums[0] + stage0.sums[1]),
                    (ushort)(stage0.sums[2] + stage0.sums[3])
                }
            };
        }

        AutoPropagatePipelineModuleStage2 Stage2Logic(AutoPropagatePipelineModuleStage1 stage1)
        {
            return new AutoPropagatePipelineModuleStage2()
            {
                result = (ushort)(stage1.sums[0] + stage1.sums[0] + stage1.s0Sums[4])
            };
        }

        IRTLPipelineStage<PipelineTestInputs, AutoPropagatePipelineModuleStage2> LocalPipelineConfig
            => PipelineBuilder
                .Source<PipelineTestInputs>()
                .Stage(i => Stage0Logic(i))
                .Stage(s0 => Stage1Logic(s0))
                .Stage(s1 => Stage2Logic(s1));

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
