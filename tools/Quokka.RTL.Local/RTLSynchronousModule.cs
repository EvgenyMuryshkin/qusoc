using Newtonsoft.Json;
using Newtonsoft.Json.Bson;
using Quokka.RTL.Tools;
using Quokka.VCD;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;

namespace Quokka.RTL
{
    /// <summary>
    /// Base class for hardware state machine module, will be in toolkit
    /// </summary>
    /// <typeparam name="TInput"></typeparam>
    /// <typeparam name="TState"></typeparam>
    [RTLToolkitType]
    public abstract class RTLSynchronousModule<TInput, TState> : RTLCombinationalModule<TInput>, IRTLSynchronousModule<TInput, TState>
        where TInput : new()
        where TState : new()
    {
        public Type StateType { get; } = typeof(TState);
        public List<MemberInfo> StateProps { get; } = RTLModuleHelper.SignalProperties(typeof(TState));
        public List<MemberInfo> PipelineProps { get; private set; }

        TState DefaultState;
        public TState State { get; private set; }
        public TState NextState { get; private set; }
        object IRTLSynchronousModule.RawState => State;

        IEnumerable<IRTLPipeline> Pipelines => PipelineProps.Select(p => p.GetValue(this)).OfType<IRTLPipeline>();
        StateBitArrayAdjust<TState> stateAdjust = new StateBitArrayAdjust<TState>();

        public RTLSynchronousModule()
        {

        }

        public RTLSynchronousModule(TState state)
        {
            State = state;
        }

        protected void InitState(TState state)
        {
            if (State != null)
                throw new Exception("State is already initialized");

            State = state;
            DefaultState = CopyState();
            NextState = CopyState();
        }

        protected override void OnSetup()
        {
            base.OnSetup();

            // do not create default state object if it was already assigned in ctor
            if (State == null)
                State = CreateAndInitializeRelatedObject<TState>();
            
            if (NextState == null)
                NextState = CreateAndInitializeRelatedObject<TState>();

            PipelineProps = RTLModuleHelper.PipelineProperties(GetType());

            foreach (var head in Pipelines.Select(pl => pl.Diag.Head))
            {
                head.Setup(this);
            }

            if (DefaultState == null)
            {
                // store default state for reset logic
                DefaultState = CopyState();
            }
        }

        /*
        protected override void OnSetupCompleted()
        {
            base.OnSetupCompleted();

            foreach (var head in Pipelines.Select(pl => pl.Diag.Head))
            {
                head.Stage(0);
                head.Commit();
            }
        }
        */

        protected bool InReset { get; private set; }

        public override void PopulateSnapshot(VCDSignalsSnapshot snapshot, RTLModuleSnapshotConfig config = null)
        {
            config = config ?? RTLModuleSnapshotConfig.Default;
            try
            {
                base.PopulateSnapshot(snapshot, config);

                if (config.IsIncluded(RTLModuleSnapshotConfigInclude.State))
                {
                    currentSnapshot = snapshot.Scope("State");
                    if (State == null)
                        throw new NullReferenceException("State is not initialized");

                    foreach (var prop in StateProps)
                    {
                        // TODO: support arrays in VCD
                        if (prop.GetMemberType().IsArray)
                            continue;

                        currentMember = prop;
                        var value = currentMember.GetValue(State);
                        currentSnapshot.SetVariables(ToVCDVariables(currentMember, value));
                    }
                }                    

                if (config.IsIncluded(RTLModuleSnapshotConfigInclude.NextState))
                {
                    currentSnapshot = snapshot.Scope("NextState");
                    if (NextState == null)
                        throw new NullReferenceException("NextState is not initialized");

                    foreach (var prop in StateProps)
                    {
                        // TODO: support arrays in VCD
                        if (prop.GetMemberType().IsArray)
                            continue;

                        currentMember = prop;
                        var value = currentMember.GetValue(NextState);
                        currentSnapshot.SetVariables(ToVCDVariables(currentMember, value));
                    }
                }

                if (config.IsIncluded(RTLModuleSnapshotConfigInclude.Pipelines))
                {
                    var pipelinesScope = snapshot.Scope("Pipelines");
                    currentSnapshot = pipelinesScope;
                    foreach (var pipelineProp in PipelineProps)
                    {
                        var pipeline = pipelineProp.GetValue(this) as IRTLPipeline;
                        var head = pipeline.Diag.Head;

                        var pipelineScope = pipelinesScope.Scope(pipelineProp.Name);
                        currentSnapshot = pipelineScope.Scope("Control");
                        currentSnapshot.SetVariables(ToVCDVariables("", head.PipelineControl, true));

                        currentSnapshot = pipelineScope.Scope("Preview");
                        currentSnapshot.SetVariables(ToVCDVariables("", head.PipelinePreview, true));

                        var stagesScope = pipelineScope.Scope("Stages");

                        foreach (var stage in pipeline.Diag.Stages)
                        {
                            var index = pipeline.Diag.Stages.IndexOf(stage);
                            var stageScope = stagesScope.Scope($"Stage{index}");

                            currentSnapshot = stageScope.Scope("Inputs");

                            currentSnapshot = stageScope.Scope("State");
                            var stateMember = stage.GetType().GetMember("State")[0];
                            currentSnapshot.SetVariables(ToVCDVariables("", stage.StateValue));

                            currentSnapshot = stageScope.Scope("NextState");
                            var nextStateMember = stage.GetType().GetMember("NextState")[0];
                            currentSnapshot.SetVariables(ToVCDVariables("", stage.NextStateValue));

                            var managed = stage.ManagedSignals;
                            currentSnapshot = stageScope.Scope("Control");
                            currentSnapshot.SetVariables(ToVCDVariables("", managed.Control, true));

                            currentSnapshot = stageScope.Scope("Request");
                            currentSnapshot.SetVariables(ToVCDVariables("", managed.Request, true));

                            currentSnapshot = stageScope.Scope("Preview");
                            currentSnapshot.SetVariables(ToVCDVariables("", managed.Preview, true));
                        }
                    }

                    currentSnapshot = null;
                }
            }
            catch (VCDSnapshotException)
            {
                throw;
            }
            catch (Exception ex)
            {
                ThrowVCDException(ex);
            }
        }

        protected abstract void OnStage();

        protected TState CopyState()
        {
            return DeepReflectionCopy.DeepCopy(State);
        }

        public override RTLModuleStageResult DeltaCycle(int deltaCycle)
        {
            if (base.DeltaCycle(deltaCycle) == RTLModuleStageResult.Stable)
                return RTLModuleStageResult.Stable;

            foreach (var pl in Pipelines)
                pl.Diag.Head.DeltaCycle(deltaCycle);

            NextState = CopyState();
            OnStage();

            stateAdjust.Run(State, NextState);

            // indicated processed inputs
            return RTLModuleStageResult.Unstable;
        }

        static void ResetObject(
            List<MemberInfo> members, 
            object target, 
            object source, 
            RTLModuleResetOptions resetOptions = null)
        {
            if (source == null || target == null)
                return;

            var targetType = target.GetType();
            foreach (var prop in members)
            {
                var memberType = prop.GetMemberType();
                var defaultValue = prop.GetValue(source);
                var clonable = defaultValue as ICloneable;

                if (memberType.IsArray && clonable != null)
                {
                    var resetTypeAttribute = prop.GetCustomAttribute<MemoryBlockResetTypeAttribute>() ?? resetOptions?.MemoryBlockResetType;
                    if (resetTypeAttribute == null)
                    {
                        throw new Exception($"No reset type is defined for {targetType.Name}.{prop.Name}. Use [MemoryBlockResetType] on property to declare behavious");
                    }

                    switch (resetTypeAttribute.ResetType)
                    {
                        case rtlMemoryBlockResetType.Keep:
                            break;
                        case rtlMemoryBlockResetType.Reset:
                            prop.SetValue(target, clonable.Clone());
                            break;
                    }
                }
                else if (clonable != null)
                {
                    prop.SetValue(target, clonable.Clone());
                }
                else if (memberType.IsValueType)
                {
                    prop.SetValue(target, defaultValue);
                }
                else if (RTLTypeCheck.IsSynthesizableObject(memberType))
                {
                    ResetObject(
                        RTLReflectionTools.SerializableMembers(memberType),
                        prop.GetValue(target),
                        defaultValue,
                        resetOptions
                    );
                }
                else
                {
                    throw new Exception($"Reference types note supported in reset logic: {targetType.Name}.{prop.Name}");
                }
            }
        }

        public override void Reset(RTLModuleResetOptions resetOptions = null)
        {
            base.Reset(resetOptions);

            foreach (var pl in Pipelines)
                pl.Diag.Head.Reset(resetOptions);

            if (Equals(DefaultState, default(TState)))
            {
                ThrowNotSetup();
            }

            ResetObject(StateProps, State, DefaultState, resetOptions);
        }

        public override void Commit()
        {
            base.Commit();

            foreach (var pl in Pipelines)
                pl.Diag.Head.Commit();

            State = NextState;
            NextState = CopyState();
        }
    }
}
