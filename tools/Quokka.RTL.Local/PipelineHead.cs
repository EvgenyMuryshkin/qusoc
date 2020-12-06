using System;
using System.Collections.Generic;

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
        #endregion

        #region IRTLControlFlow
        public void Schedule(Func<TSource> sourceFactory) => FirstStage.StageSchedule(sourceFactory);
        public bool Stage(int iteration) => FirstStage.StageStage(iteration);
        public void Commit() => FirstStage.StageCommit();
        public void Reset() => FirstStage.StageReset();
        #endregion
    }
}
