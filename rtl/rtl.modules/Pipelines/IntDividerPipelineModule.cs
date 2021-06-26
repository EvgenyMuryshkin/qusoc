using Quokka.RTL;
using Quokka.RTL.Local;
using System;

namespace RTL.Modules
{
    public class IntDividerPipelineModuleInputs
    {
        public bool inReady;
        public int inNumerator;
        public int inDenominator;
    }

    public class IntDividerPipelineModuleStage
    {
        // nullable signals will be propagated through pipeline
        public bool? ready;
        public long numerator;
        public long denominator;
        public int result;
    }

    public class IntDividerPipelineModuleResult
    {
        public bool outReady;
    }

    public class IntDividerPipelineModule : RTLSynchronousModule<IntDividerPipelineModuleInputs, PipelinesTestModuleEmptyState>
    {
        IRTLPipelineStage<IntDividerPipelineModuleStage, IntDividerPipelineModuleStage> DivPipeline
            = PipelineBuilder.Source<IntDividerPipelineModuleStage>()
            .Generate(32, (idx, i) =>
            {
                var denominator = i.denominator >> 1;
                var flag = i.numerator >= denominator;

                var result = (i.result << 1) | (flag ? 1 : 0);
                var numerator = flag ? i.numerator - denominator : i.numerator;

                return new IntDividerPipelineModuleStage()
                {
                    ready = i.ready,
                    result = result,
                    denominator = denominator,
                    numerator = numerator
                };
            });

        /*
        IRTLPipelineStage<IntDividerPipelineModuleStage, IntDividerPipelineModuleStage> DivPipeline
            = PipelineBuilder.Source<IntDividerPipelineModuleStage>()
            .Stage(i =>
            {
                var denominator = i.denominator >> 1;
                var flag = i.numerator >= denominator;

                var result = (i.result << 1) | (flag ? 1 : 0);
                var numerator = flag ? i.numerator - denominator : i.numerator;

                return new IntDividerPipelineModuleStage()
                {
                    ready = i.ready,
                    result = result,
                    denominator = denominator,
                    numerator = numerator
                };
            });
        */
        public bool OutReady => (bool)DivPipeline.State.ready;
        public int OutRes => DivPipeline.State.result;
        public int OutRem => (int)DivPipeline.State.numerator;


        protected override void OnSchedule(Func<IntDividerPipelineModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            DivPipeline.Schedule(() => new IntDividerPipelineModuleStage()
            {
                ready = Inputs.inReady,
                result = 0,
                numerator = Inputs.inNumerator,
                denominator = (long)Inputs.inDenominator << 32,
            });
        }
        
        protected override void OnStage()
        {
        }
    }
}
