using System;
using System.Collections;
using System.Collections.Generic;

namespace Quokka.RTL.Local
{
    public partial class RTLPipelineStage<TSource, TInput, TOutput>
    {
        #region IRTLPipelineStage
        Type IRTLPipelineStage.InputsType => typeof(TInput);
        Type IRTLPipelineStage.StateType => typeof(TOutput);
        object IRTLPipelineStage.StateValue => State;
        object IRTLPipelineStage.NextStateValue => NextState;

        IRTLPipelinePreviewSignals IRTLPipelineStage.PipelinePreview => pipelineHead.PipelinePreview;
        IRTLPipelineControlSignals IRTLPipelineStage.PipelineControl => pipelineHead.PipelineControl;
        #endregion
    }
}