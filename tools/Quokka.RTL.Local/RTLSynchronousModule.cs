using Newtonsoft.Json;
using Newtonsoft.Json.Bson;
using Quokka.VCD;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;

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
        public TState State { get; private set; } = new TState();
        object IRTLSynchronousModule.RawState => State;
        public TState NextState = new TState();

        IEnumerable<IRTLPipeline> Pipelines => PipelineProps.Select(p => p.GetValue(this)).OfType<IRTLPipeline>();

        protected override void OnSetup()
        {
            base.OnSetup();
            PipelineProps = RTLModuleHelper.PipelineProperties(GetType());

            foreach (var pl in Pipelines)
                pl.Diag.Head.Setup();

            // store default state for reset logic
            DefaultState = CopyState();
        }

        public override void PopulateSnapshot(VCDSignalsSnapshot snapshot)
        {
            try
            {
                base.PopulateSnapshot(snapshot);

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

                currentSnapshot = snapshot.Scope("NextState");
                if (State == null)
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

                currentSnapshot = null;
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
            return RTLModuleHelper.DeepCopy(State);
        }

        public override bool Stage(int iteration)
        {
            if (!base.Stage(iteration))
                return false;

            foreach (var pl in Pipelines)
                pl.Diag.Head.Stage(iteration);

            NextState = CopyState();
            OnStage();

            // indicated processed inputs
            return true;
        }

        public override void Reset()
        {
            base.Reset();

            foreach (var pl in Pipelines)
                pl.Diag.Head.Reset();

            if (Equals(DefaultState, default(TState)))
            {
                ThrowNotSetup();
            }

            foreach (var prop in StateProps)
            {
                var memberType = prop.GetMemberType();
                var defaultValue = prop.GetValue(DefaultState);
                var clonable = defaultValue as ICloneable;

                if (memberType.IsArray && clonable != null)
                {
                    var resetTypeAttribute = prop.GetCustomAttribute<MemoryBlockResetTypeAttribute>();
                    if (resetTypeAttribute == null)
                    {
                        throw new Exception($"No reset type is defined for {StateType.Name}.{prop.Name}. Use [MemoryBlockResetType] on property to declare behavious");
                    }

                    switch (resetTypeAttribute.ResetType)
                    {
                        case rtlMemoryBlockResetType.Keep:
                            break;
                        case rtlMemoryBlockResetType.Reset:
                            prop.SetValue(State, clonable.Clone());
                            break;
                    }
                }
                else if (clonable != null)
                {
                    prop.SetValue(State, clonable.Clone());
                }
                else if (memberType.IsValueType)
                {
                    prop.SetValue(State, defaultValue);
                }
                else
                {
                    throw new Exception($"Reference types note supported in reset logic: {StateType.Name}.{prop.Name}");
                }
            }
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
