using System;
using System.Collections.Generic;
using System.Linq;

namespace Quokka.RTL.Local
{
    [RTLToolkitType]
    public class PipelineHead<TSource> : IRTLPipelineHead<TSource>, IRTLPipelineDiagnostics
    {
        IRTLPipelineStage<TSource> _stage;
        IRTLPipelineStage<TSource> FirstStage
        {
            get => _stage ?? throw new NullReferenceException(nameof(Stage));
            set => _stage = value;
        }

        public IRTLPipelineDiagnostics Diag => this;

        public IRTLPipelineStage<TSource, TResult> Stage<TResult>(Func<TSource, TResult> map)
        {
            var result = new RTLPipelineStage<TSource, TSource, TResult>(this, map);
            FirstStage = result;
            return result;
        }

        public void Setup() => FirstStage.StageSetup();

        #region IRTLPipelineDiagnostics
        IRTLPipelineHead IRTLPipelineDiagnostics.Head => this;
        IRTLPipelineStage IRTLPipelineDiagnostics.NextStage => _stage;
        List<IRTLPipelineStage> IRTLPipelineDiagnostics.Stages
        {
            get
            {
                var result = new List<IRTLPipelineStage>();

                IRTLPipelineDiagnostics diag = this;

                while (diag?.NextStage != null)
                {
                    result.Add(diag.NextStage);
                    diag = diag.NextStage as IRTLPipelineDiagnostics;
                }

                return result;
            }
        }
        Type IRTLPipelineDiagnostics.SourceType => typeof(TSource);
        Type IRTLPipelineDiagnostics.ResultType => (this as IRTLPipelineDiagnostics).Stages.Last().Diag.ResultType;
        #endregion

        public IRTLPipelinePeek<TState> Peek<TState>()
        {
            var stateType = typeof(TState);
            var stages = (this as IRTLPipelineDiagnostics).Stages;
            var matchingStages = stages.Where(s => s.StateType == stateType).ToList();
            switch(matchingStages.Count)
            {
                case 0: throw new Exception($"No stages of type '{stateType.Name}' found on pipeline");
                case 1: return new RTLPipelinePeek<TState>((TState)matchingStages.Single().StateValue);
                default: throw new Exception($"Multiple stages of type '{stateType.Name}' found on pipeline");
            }
        }

        #region IRTLControlFlow
        public void Schedule(Func<TSource> sourceFactory) => FirstStage.StageSchedule(sourceFactory);
        public bool Stage(int iteration) => FirstStage.StageStage(iteration);
        public void Commit() => FirstStage.StageCommit();
        public void Reset() => FirstStage.StageReset();
        #endregion
    }
}
