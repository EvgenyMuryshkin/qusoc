using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace Quokka.RTL.Local
{
    public partial class RTLPipelineStage<TSource, TInput, TOutput>
    {
        private IRTLPipelineStage<TOutput> nextStage;

        public IRTLPipelineStage<TSource, TResult> Stage<TResult>(Func<TOutput, TResult> map)
        {
            var next = new RTLPipelineStage<TSource, TOutput, TResult>(pipelineHead, map);
            nextStage = next;
            return next;
        }

        public IRTLPipelineStage<TSource, TResult> Stage<TResult>(Func<TOutput, TResult, TResult> map)
        {
            var next = new RTLPipelineStage<TSource, TOutput, TResult>(pipelineHead, map);
            nextStage = next;
            return next;
        }

        public IRTLPipelineStage<TSource, TResult> Stage<TResult>(Func<TOutput, TResult, IRTLPipelineStageManagedSignals, TResult> map)
        {
            var next = new RTLPipelineStage<TSource, TOutput, TResult>(pipelineHead, map);
            nextStage = next;
            return next;
        }

        public IRTLPipelineStage<TSource, TOutput> Generate(int range, Func<int, TOutput, TOutput> map)
        {
            if (range <= 0) throw new ArgumentOutOfRangeException(nameof(range), "should be positive");

            IRTLPipelineStage<TSource, TOutput> lastStage = this;

            foreach (var idx in Enumerable.Range(0, range))
            {
                lastStage = lastStage.Stage((source) => map(idx, source));
            }

            return lastStage;
        }
    }
}