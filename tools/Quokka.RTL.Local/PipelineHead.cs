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


        RTLPipelineControlSignals _pipelineControl = new RTLPipelineControlSignals();

        public IRTLPipelineDiagnostics Diag => this;

        public IRTLPipelineStage<TSource, TResult> Stage<TResult>(Func<TSource, TResult> map)
        {
            var result = new RTLPipelineStage<TSource, TSource, TResult>(this, map);
            FirstStage = result;
            return result;
        }

        public IRTLPipelineStage<TSource, TResult> Stage<TResult>(Func<TSource, TResult, TResult> map)
        {
            var result = new RTLPipelineStage<TSource, TSource, TResult>(this, map);
            FirstStage = result;
            return result;
        }

        public IRTLPipelineStage<TSource, TResult> Stage<TResult>(Func<TSource, TResult, IRTLPipelineStageManagedSignals, TResult> map)
        {
            var result = new RTLPipelineStage<TSource, TSource, TResult>(this, map);
            FirstStage = result;
            return result;
        }

        public IRTLPipelineStage<TSource, TSource> Generate(int range, Func<int, TSource, TSource> map)
        {
            if (range <= 0) throw new ArgumentOutOfRangeException(nameof(range), "should be positive");
            var firstStage = new RTLPipelineStage<TSource, TSource, TSource>(this, (source) => map(0, source));

            FirstStage = firstStage;
            IRTLPipelineStage<TSource, TSource> lastStage = firstStage;

            foreach (var idx in Enumerable.Range(1, range - 1))
            {
                lastStage = lastStage.Stage((source) => map(idx, source));
            }

            return lastStage;
        }

        public void Setup(IRTLCombinationalModule module) => FirstStage.StageSetup(module);

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
        Type IRTLPipelineDiagnostics.ResultType => Diag.Stages.Last().Diag.ResultType;

        bool IRTLPipelineDiagnostics.HasControlSignals => Diag.Stages.Any(s => s.Diag.HasControlSignals);
        object IRTLPipelineDiagnostics.Source => Diag.Stages.First().Diag.Source;
        object IRTLPipelineDiagnostics.Result => Diag.Stages.Last().Diag.Result;
        #endregion

        public IRTLPipelinePeek<TState> Peek<TState>()
        {
            var stateType = typeof(TState);
            var stages = Diag.Stages;
            var matchingStages = stages.Where(s => s.StateType == stateType).ToList();
            switch(matchingStages.Count)
            {
                case 0: throw new Exception($"No stages of type '{stateType.Name}' found on pipeline");
                case 1:
                    var stage = matchingStages.Single();
                    return new RTLPipelinePeek<TState>((TState)stage.StateValue, (TState)stage.NextStateValue, stage.ManagedSignals);
                default: throw new Exception($"Multiple stages of type '{stateType.Name}' found on pipeline");
            }
        }

        #region IRTLControlFlow
        public IRTLPipelinePreviewSignals PipelinePreview
        {
            get
            {
                var hardwareSignals = Diag.Stages.Select(s => s as IRTLPipelineStageHardwareSignals);
                var pipelineStall = hardwareSignals.Any(s => s.PipelineStallRequested);
                var lastStageStallRequested = hardwareSignals.Last().StageStallRequested;

                return new RTLPipelinePreviewSignals() { PipelineWillStall = pipelineStall || lastStageStallRequested };
            }
        }
    
        public IRTLPipelineControlSignals PipelineControl => _pipelineControl;
        public void Schedule(Func<TSource> sourceFactory) => FirstStage.StageSchedule(sourceFactory);
        public RTLModuleStageResult DeltaCycle(int deltaCycle) => FirstStage.StageDeltaCycle(deltaCycle);
        public void Commit()
        {
            _pipelineControl = new RTLPipelineControlSignals() { PipelineStalled = PipelinePreview.PipelineWillStall };
            FirstStage.StageCommit();
        }

        public void Reset() => FirstStage.StageReset();
        #endregion
    }
}
