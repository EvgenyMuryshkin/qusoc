using System;
using System.Collections;
using System.Collections.Generic;

namespace Quokka.RTL.Local
{
    public partial class RTLPipelineStage<TSource, TInput, TOutput>
    {
        #region IRTLPipelineStageHardwareSignals
        bool IRTLPipelineStageHardwareSignals.PipelineStallRequested => _requestSignals.StallPipeline ?? false;
        bool IRTLPipelineStageHardwareSignals.PrevStageStallRequested => _requestSignals.StallPrev ?? false;
        bool IRTLPipelineStageHardwareSignals.StageStallRequested => _requestSignals.StallSelf ?? false;
        bool IRTLPipelineStageHardwareSignals.StageWillStall => PreviewSignals.StageWillStall;
        #endregion
    }
}