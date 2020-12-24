using System;
using System.Collections.Generic;

namespace Quokka.RTL.Local
{
    [RTLToolkitType]
    public class RTLPipelineStage<TSource, TInput, TOutput> : 
        IRTLPipelineStage<TSource, TInput, TOutput>,
        IRTLPipelineDiagnostics
    {
        public IRTLPipelineDiagnostics Diag => this;
        public TOutput State { get; set; }
        public TOutput NextState { get; set; }

        Type IRTLPipelineStage.StateType => typeof(TOutput);
        object IRTLPipelineStage.StateValue => State;
        object IRTLPipelineStage.NextStateValue => NextState;

        IRTLPipelineHead<TSource> _pipelineHead;
        IRTLPipelineHead<TSource> pipelineHead
        {
            get => _pipelineHead ?? throw new NullReferenceException(nameof(IRTLPipelineDiagnostics.Head));
            set => _pipelineHead = value;
        }

        private readonly Func<TInput, TOutput> stageMap;
        private Func<TInput> inputsFactory;
        private IRTLPipelineStage<TOutput> nextStage;

        public RTLPipelineStage(IRTLPipelineHead<TSource> head, Func<TInput, TOutput> stage)
        {
            pipelineHead = head;
            stageMap = stage;
        }

        public IRTLPipelineStage<TSource, TResult> Stage<TResult>(Func<TOutput, TResult> map)
        {
            var next = new RTLPipelineStage<TSource, TOutput, TResult>(pipelineHead, map);
            nextStage = next;
            return next;
        }

        #region IRTLPipelineDiagnostics
        IRTLPipelineHead IRTLPipelineDiagnostics.Head => pipelineHead;
        IRTLPipelineStage IRTLPipelineDiagnostics.NextStage => nextStage;
        List<IRTLPipelineStage> IRTLPipelineDiagnostics.Stages => (pipelineHead as IRTLPipelineDiagnostics).Stages;
        Type IRTLPipelineDiagnostics.SourceType => typeof(TSource);
        Type IRTLPipelineDiagnostics.ResultType => typeof(TOutput);
        #endregion

        #region IRTLPipelineStage
        public void StageSetup()
        {
            // TODO: maybe run default inputs throught pipeline instead
            State = RTLModuleHelper.Activate<TOutput>();
            NextState = RTLModuleHelper.Activate<TOutput>();
            nextStage?.StageSetup();
        }

        public void StageSchedule(Func<TInput> inputsFactory)
        {
            this.inputsFactory = inputsFactory;
            nextStage?.StageSchedule(() => State);
        }
        public void StageCommit()
        {
            State = NextState;
            nextStage?.StageCommit();
        }

        public void StageReset()
        {
            NextState = State;
            nextStage?.StageReset();
        }

        public bool StageStage(int iteration)
        {
            var inputs = inputsFactory();
            NextState = stageMap(inputs);
            return nextStage?.StageStage(iteration) ?? false;
        }
        #endregion;

        #region IRTLControlFlow
        public void Schedule(Func<TSource> sourceFactory) => pipelineHead.Schedule(sourceFactory);
        public bool Stage(int iteration) => pipelineHead.Stage(iteration);
        public void Commit() => pipelineHead.Commit();
        public void Reset() => pipelineHead.Reset();
        public void Setup() => pipelineHead.Setup();
        #endregion
    }
}
