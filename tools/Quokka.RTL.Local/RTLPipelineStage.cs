using System;
using System.Collections;
using System.Collections.Generic;

namespace Quokka.RTL.Local
{
    [RTLToolkitType]
    public partial class RTLPipelineStage<TSource, TInput, TOutput> : 
        IRTLPipelineStage<TSource, TInput, TOutput>,
        IRTLPipelineDiagnostics
    {
        public TOutput State { get; set; }
        public TOutput NextState { get; set; }

        RTLPipelineStageControlSignals _сontrolSignals = new RTLPipelineStageControlSignals();
        RTLPipelineStageRequestSignals _requestSignals = new RTLPipelineStageRequestSignals();

        private Func<TInput> inputsFactory;
        private IRTLCombinationalModule rtlModule;

        #region IRTLPipelineStage
        public IRTLPipelinePeek<TState> Peek<TState>() => pipelineHead.Peek<TState>();

        public void StageSetup(IRTLCombinationalModule module)
        {
            rtlModule = module;
            // do not setup state values of pipeline in StageSetup
            // moved to initial schedule with actual input values to support stage arrays
            nextStage?.StageSetup(module);
        }

        public void StageSchedule(Func<TInput> inputsFactory)
        {
            this.inputsFactory = inputsFactory;

            if (State == null && NextState == null)
            {
                var stageInputs = inputsFactory();
                var nextStageInputs = inputsFactory();

                if (stageMap != null)
                {
                    State = RTLPipelineStageTools.RecurviseResetToDefaults(stageMap(stageInputs));
                    NextState = RTLPipelineStageTools.RecurviseResetToDefaults(stageMap(nextStageInputs));
                }
                else if (stageMapWithState != null)
                {
                    var virtualState = RTLModuleHelper.Activate<TOutput>();
                    rtlModule.OnRelatedObjectCreating(virtualState);

                    State = RTLPipelineStageTools.RecurviseResetToDefaults(stageMapWithState(stageInputs, virtualState));

                    var virtualNextState = RTLModuleHelper.Activate<TOutput>();
                    rtlModule.OnRelatedObjectCreating(virtualNextState);

                    NextState = RTLPipelineStageTools.RecurviseResetToDefaults(stageMapWithState(nextStageInputs, virtualNextState));
                }
                else if (stageMapWithStateAndControl != null)
                {
                    var virtualState = RTLModuleHelper.Activate<TOutput>();
                    rtlModule.OnRelatedObjectCreating(virtualState);

                    State = RTLPipelineStageTools.RecurviseResetToDefaults(stageMapWithStateAndControl(stageInputs, virtualState, ManagedSignals));

                    var virtualNextState = RTLModuleHelper.Activate<TOutput>();
                    rtlModule.OnRelatedObjectCreating(virtualNextState);

                    NextState = RTLPipelineStageTools.RecurviseResetToDefaults(stageMapWithStateAndControl(nextStageInputs, virtualNextState, ManagedSignals));
                }
                else
                {
                    throw new Exception($"Pipeline stage is not initialized with scheduling method");
                }

                RTLPipelineStageTools.CarryOverAutoPropagateValues(stageInputs, State);
                rtlModule.OnRelatedObjectCreating(State);

                RTLPipelineStageTools.CarryOverAutoPropagateValues(nextStageInputs, NextState);
                rtlModule.OnRelatedObjectCreating(NextState);
            }

            nextStage?.StageSchedule(() => State);
        }
        protected TOutput CopyState()
        {
            return RTLModuleHelper.DeepCopy(State);
        }

        public void StageCommit()
        {
            _сontrolSignals = new RTLPipelineStageControlSignals()
            {
                StageStalled = ManagedSignals.Preview.StageWillStall
            };
            
            if (!_сontrolSignals.StageStalled)
            {
                State = NextState;
            }

            NextState = CopyState();

            nextStage?.StageCommit();

            _requestSignals = new RTLPipelineStageRequestSignals();
        }

        public void StageReset()
        {
            NextState = State;
            _requestSignals = new RTLPipelineStageRequestSignals();
            nextStage?.StageReset();
        }

        IRTLPipelineStageHardwareSignals NextStateHardwareSignals => nextStage;

        IRTLPipelineStagePreviewSignals PreviewSignals
        {
            get
            {
                var pipelineWillStall = pipelineHead.PipelinePreview.PipelineWillStall;
                var selfStallRequested = _requestSignals.StallSelf ?? false;
                var nextStageWillStall = NextStateHardwareSignals?.StageWillStall ?? false;
                var nestStagePrevStageStallRequested = NextStateHardwareSignals?.PrevStageStallRequested ?? false;

                return new RTLPipelineStagePreviewSignals()
                {
                    StageWillStall = pipelineWillStall || selfStallRequested || nextStageWillStall || nestStagePrevStageStallRequested
                };
            }
        }

        public IRTLPipelineStageManagedSignals ManagedSignals
        {
            get
            {
                return new RTLPipelineStageManagedSignals()
                {
                    Control = _сontrolSignals,
                    Preview = PreviewSignals,
                    Request = _requestSignals
                };
            }
        }

        (TOutput, IRTLPipelineStageManagedSignals) NextStateCandidate()
        {
            var inputs = inputsFactory();
            TOutput result = default(TOutput);

            var managedSignals = ManagedSignals;
            if (stageMap != null)
            {
                result = stageMap(inputs);
            }
            else if (stageMapWithState != null)
            {
                result = stageMapWithState(inputs, State);
            }
            else if (stageMapWithStateAndControl != null)
            {
                result = stageMapWithStateAndControl(inputs, State, managedSignals);
            }

            RTLPipelineStageTools.CarryOverAutoPropagateValues(inputs, result);
            return (result, managedSignals);
        }

        public RTLModuleStageResult StageDeltaCycle(int deltaCycle)
        {
            var (nextStateCandidate, managedSignals) = NextStateCandidate();

            var modified = !rtlModule.DeepEquals(NextState, nextStateCandidate);

            NextState = nextStateCandidate;
            _requestSignals = managedSignals.Request as RTLPipelineStageRequestSignals;

            var nextStageResult = nextStage?.StageDeltaCycle(deltaCycle) ?? RTLModuleStageResult.Stable;

            return (modified || nextStageResult == RTLModuleStageResult.Unstable) ? RTLModuleStageResult.Unstable : RTLModuleStageResult.Stable;
        }
        #endregion;

        public void Setup(IRTLCombinationalModule module) => pipelineHead.Setup(module);
    }
}
