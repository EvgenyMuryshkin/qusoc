﻿using System;
using System.Collections;
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

        Type IRTLPipelineStage.InputsType => typeof(TInput);
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
        private readonly Func<TInput, TOutput, TOutput> stageMapWithState;
        private Func<TInput> inputsFactory;
        private IRTLPipelineStage<TOutput> nextStage;
        private IRTLCombinationalModule rtlModule;

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

        public IRTLPipelineStage<TSource, TResult> Stage<TResult>(Func<TOutput, TResult> map)
        {
            var next = new RTLPipelineStage<TSource, TOutput, TResult>(pipelineHead, map);
            nextStage = next;
            return next;
        }

        public IRTLPipelineStage<TSource, TResult> Stage<TResult>(Func<TOutput, TResult, TResult> map)
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
            if (stageMap != null)
            {
                NextState = stageMap(inputs);
            }
            else if (stageMapWithState != null)
            {
                NextState = stageMapWithState(inputs, State);
            }

            RTLPipelineStageTools.CarryOverAutoPropagateValues(inputs, NextState);

            return nextStage?.StageStage(iteration) ?? false;
        }
        #endregion;

        #region IRTLControlFlow
        public void Schedule(Func<TSource> sourceFactory) => pipelineHead.Schedule(sourceFactory);
        public bool Stage(int iteration) => pipelineHead.Stage(iteration);
        public void Commit() => pipelineHead.Commit();
        public void Reset() => pipelineHead.Reset();
        #endregion
        public void Setup(IRTLCombinationalModule module) => pipelineHead.Setup(module);
    }
}
