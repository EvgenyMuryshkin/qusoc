using System;
using System.Collections;
using System.Collections.Generic;

namespace Quokka.RTL.Local
{
    public partial class RTLPipelineStage<TSource, TInput, TOutput>
    {
        private readonly Func<TInput, TOutput> stageMap;
        private readonly Func<TInput, TOutput, TOutput> stageMapWithState;
        private readonly Func<TInput, TOutput, IRTLPipelineStageManagedSignals, TOutput> stageMapWithStateAndControl;

        IRTLPipelineHead<TSource> _pipelineHead;
        IRTLPipelineHead<TSource> pipelineHead
        {
            get => _pipelineHead ?? throw new NullReferenceException(nameof(IRTLPipelineDiagnostics.Head));
            set => _pipelineHead = value;
        }

        public RTLPipelineStage(IRTLPipelineHead<TSource> head, Func<TInput, TOutput> stage)
        {
            pipelineHead = head;
            stageMap = stage;
        }

        public RTLPipelineStage(IRTLPipelineHead<TSource> head, Func<TInput, TOutput, TOutput> stage)
        {
            pipelineHead = head;
            stageMapWithState = stage;
        }

        public RTLPipelineStage(IRTLPipelineHead<TSource> head, Func<TInput, TOutput, IRTLPipelineStageManagedSignals, TOutput> stage)
        {
            pipelineHead = head;
            stageMapWithStateAndControl = stage;
        }
    }
}