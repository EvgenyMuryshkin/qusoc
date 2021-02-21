using System;
using System.Collections;
using System.Collections.Generic;

namespace Quokka.RTL.Local
{
    public partial class RTLPipelineStage<TSource, TInput, TOutput>
    {
        public IRTLPipelineDiagnostics Diag => this;

        #region IRTLPipelineDiagnostics
        IRTLPipelineHead IRTLPipelineDiagnostics.Head => pipelineHead;
        IRTLPipelineStage IRTLPipelineDiagnostics.NextStage => nextStage;
        List<IRTLPipelineStage> IRTLPipelineDiagnostics.Stages => (pipelineHead as IRTLPipelineDiagnostics).Stages;
        Type IRTLPipelineDiagnostics.SourceType => typeof(TSource);
        Type IRTLPipelineDiagnostics.ResultType => typeof(TOutput);
        bool IRTLPipelineDiagnostics.HasControlSignals => stageMapWithStateAndControl != null;
        #endregion
    }
}