using System;
using System.Collections;
using System.Collections.Generic;

namespace Quokka.RTL.Local
{
    public partial class RTLPipelineStage<TSource, TInput, TOutput>
    {
        #region IRTLModuleControlFlow
        public void Schedule(Func<TSource> sourceFactory) => pipelineHead.Schedule(sourceFactory);
        public RTLModuleStageResult DeltaCycle(int deltaCycle) => pipelineHead.DeltaCycle(deltaCycle);
        public void Commit() => pipelineHead.Commit();
        public void Reset() => pipelineHead.Reset();
        #endregion
    }
}