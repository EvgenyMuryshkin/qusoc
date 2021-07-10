using Quokka.RTL;
using Quokka.RTL.Local;

namespace RTL.Modules
{
    public class IntDividerPipelineInputs<T>
        where T : struct
    {
        public T Payload;
        public RTLBitArray inNumerator = new RTLBitArray(0);
        public RTLBitArray inDenominator = new RTLBitArray(0);
    }

    public class IntDividerPipelineGeneratedState<T>
        where T : struct
    {
        public T Payload;
        public bool isResultNegative;
        public bool isRemainderNegative;
        public RTLBitArray numerator = new RTLBitArray(0);
        public RTLBitArray denominator = new RTLBitArray(0);
        public RTLBitArray result = new RTLBitArray(0);
    }

    public class IntDividerPipelineResult<T>
        where T : struct
    {
        public T Payload;
        public int result;
        public int remainder;
    }

    public class IntDividerPipelineTools
    {
        public static IntDividerPipelineGeneratedState<T> SignFeedIn<T>(IntDividerPipelineInputs<T> i)
            where T : struct
        {
            var isNumeratorNegative = i.inNumerator[31];
            var isDenominatorNegative = i.inDenominator[31];

            return new IntDividerPipelineGeneratedState<T>()
            {
                Payload = i.Payload,
                isResultNegative = isNumeratorNegative != isDenominatorNegative,
                isRemainderNegative = isNumeratorNegative,
                result = 0,
                numerator = isNumeratorNegative ? (0 - i.inNumerator) : i.inNumerator,
                denominator = isDenominatorNegative ? (0 - i.inDenominator) : i.inDenominator,
            };
        }

        public static IntDividerPipelineGeneratedState<T> DividerStage<T>(int idx, IntDividerPipelineGeneratedState<T> i)
            where T : struct
        {
            var denominator = new RTLBitArray(i.denominator, new RTLBitArray(0).Unsigned().Resized(31 - idx));
            var flag = i.numerator >= denominator;
            var result = new RTLBitArray(i.result[30, 0], flag);
            var nextNumerator = flag ? (i.numerator - denominator)[31, 0] : i.numerator;

            return new IntDividerPipelineGeneratedState<T>()
            {
                Payload = i.Payload,
                isRemainderNegative = i.isRemainderNegative,
                isResultNegative = i.isResultNegative,
                result = result,
                denominator = i.denominator,
                numerator = nextNumerator
            };
        }

        public static IntDividerPipelineResult<T> SignFeedOut<T>(IntDividerPipelineGeneratedState<T> i)
            where T : struct
        {
            return new IntDividerPipelineResult<T>()
            {
                Payload = i.Payload,
                result = i.isResultNegative ? (0 - i.result) : i.result,
                remainder = i.isRemainderNegative ? (0 - i.numerator) : i.numerator
            };
        }

        public static IRTLPipelineStage<IntDividerPipelineInputs<TPayload>, IntDividerPipelineResult<TPayload>> DivPipeline<TPayload>()
            where TPayload : struct
            => PipelineBuilder.Source<IntDividerPipelineInputs<TPayload>>()
                   .Stage(i => SignFeedIn(i))
                   .Generate(32, (idx, i) => DividerStage(idx, i))
                   .Stage(i => SignFeedOut(i))
               ;
    }
}
