using Quokka.RTL;
using Quokka.RTL.Local;
using System;

namespace RTL.Modules
{
    public class FunctionsPipelineModuleInputs
    {
        public RTLBitArray inNumerator = new RTLBitArray(0);
    }

    public class FunctionsPipelineModuleStage
    {
        public RTLBitArray numerator = new RTLBitArray(0);
    }

    public class FunctionsPipelineTools
    {
        public static FunctionsPipelineModuleStage SignFeedIn(FunctionsPipelineModuleInputs i)
        {
            var isNumeratorNegative = i.inNumerator[31];

            return new FunctionsPipelineModuleStage()
            {
                numerator = isNumeratorNegative ? (0 - i.inNumerator) : i.inNumerator,
            };
        }
    }

    public class FunctionsPipelineModule : RTLSynchronousModule<FunctionsPipelineModuleInputs, PipelinesTestModuleEmptyState>
    {
        IRTLPipelineStage<FunctionsPipelineModuleInputs, FunctionsPipelineModuleStage> Pipeline
            = PipelineBuilder.Source<FunctionsPipelineModuleInputs>()
                .Stage(i => {
                    var isNumeratorNegative = i.inNumerator[31];

                    return new FunctionsPipelineModuleStage()
                    {
                        numerator = isNumeratorNegative ? (0 - i.inNumerator) : i.inNumerator,
                    };
                });

        public RTLBitArray OutResult => Pipeline.State.numerator;

        protected override void OnSchedule(Func<FunctionsPipelineModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            Pipeline.Schedule(() => Inputs);
        }

        protected override void OnStage()
        {
        }
    }
}
