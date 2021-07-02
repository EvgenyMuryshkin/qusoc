using Quokka.RTL;
using Quokka.RTL.Local;
using System;
using System.Diagnostics;

namespace RTL.Modules
{
    public class IntDividerPipelineModuleInputs
    {
        public bool inReady;
        public RTLBitArray inNumerator = new RTLBitArray(0);
        public RTLBitArray inDenominator = new RTLBitArray(0);
    }

    public class IntDividerPipelineGeneratedState
    {
        // nullable signals will be propagated through pipeline
        public bool? ready;
        public bool? isResultNegative;
        public bool? isRemainderNegative;
        public RTLBitArray numerator = new RTLBitArray(0);
        public RTLBitArray denominator = new RTLBitArray(0);
        public RTLBitArray result = new RTLBitArray(0);
    }

    public class IntDividerPipelineModuleResult
    {
        public bool ready;
        public int result;
        public int remainder;
    }

    public class IntDividerPipelineTools
    {
        public static IntDividerPipelineGeneratedState SignFeedIn(IntDividerPipelineModuleInputs i)
        {
            var isNumeratorNegative = i.inNumerator[31];
            var isDenominatorNegative = i.inDenominator[31];

            return new IntDividerPipelineGeneratedState()
            {
                ready = i.inReady,
                isResultNegative = isNumeratorNegative != isDenominatorNegative,
                isRemainderNegative = isNumeratorNegative,
                result = 0,
                numerator = isNumeratorNegative ? (0 - i.inNumerator) : i.inNumerator,
                denominator = isDenominatorNegative ? (0 - i.inDenominator) : i.inDenominator,
            };
        }

        public static IntDividerPipelineGeneratedState DividerStage(int idx, IntDividerPipelineGeneratedState i)
        {
            var denominator = new RTLBitArray(i.denominator, new RTLBitArray(0).Unsigned().Resized(31 - idx));

            var flag = i.numerator >= denominator;

            var result = new RTLBitArray(i.result[30, 0], flag);
            var nextNumerator = flag ? (i.numerator - denominator)[31, 0] : i.numerator;

            return new IntDividerPipelineGeneratedState()
            {
                ready = i.ready,
                result = result,
                denominator = i.denominator,
                numerator = nextNumerator
            };
        }

        public static IntDividerPipelineModuleResult SignFeedOut(IntDividerPipelineGeneratedState i)
        {
            return new IntDividerPipelineModuleResult()
            {
                ready = (bool)i.ready,
                result = (bool)i.isResultNegative ? (0 - i.result) : i.result,
                remainder = (bool)i.isRemainderNegative ? (0 - i.numerator) : i.numerator
            };
        }
    }

    public class IntDividerPipelineModule : RTLSynchronousModule<IntDividerPipelineModuleInputs, PipelinesTestModuleEmptyState>
    {
        IRTLPipelineStage<IntDividerPipelineModuleInputs, IntDividerPipelineModuleResult> DivPipeline
            = PipelineBuilder.Source<IntDividerPipelineModuleInputs>()
                .Stage(i => IntDividerPipelineTools.SignFeedIn(i))
                .Generate(32, (idx, i) => IntDividerPipelineTools.DividerStage(idx, i))
                .Stage(i => IntDividerPipelineTools.SignFeedOut(i))
            ;

        public bool OutReady => DivPipeline.State.ready;
        public int OutRes => DivPipeline.State.result;
        public int OutRem => DivPipeline.State.remainder;


        protected override void OnSchedule(Func<IntDividerPipelineModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            DivPipeline.Schedule(() => Inputs);
        }
        
        protected override void OnStage()
        {
        }
    }
}
