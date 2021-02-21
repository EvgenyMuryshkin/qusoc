using System;
using System.Collections;
using System.Collections.Generic;

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
    }
}