using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace Quokka.RTL.Local
{
    public class RTLPipelineStageTools
    {
        // https://stackoverflow.com/questions/17441420/how-to-set-value-for-property-of-an-anonymous-object

        static MemberInfo getBackingField(object value, MemberInfo member)
        {
            var type = value.GetType();

            if (member is FieldInfo)
                return member;

            var memberName = member.Name;
            const BindingFlags FieldFlags = BindingFlags.NonPublic | BindingFlags.Instance;
            string[] backingFieldNames = { $"<{memberName}>i__Field", $"<{memberName}>" };

            var fi = type
                .GetFields(FieldFlags)
                .FirstOrDefault(f => backingFieldNames.Contains(f.Name));

            if (fi == null)
                throw new NotSupportedException($"Cannot find backing field for {memberName}");

            return fi;
        }

        public static T RecurviseResetToDefaults<T>(T value)
        {
            var type = value.GetType();
            foreach (var m in RTLModuleHelper.SynthesizableMembers(type))
            {
                var memberType = m.GetMemberType();
                var memberValue = m.GetValue(value);
                var backingField = getBackingField(value, m);

                if (RTLModuleHelper.IsSynthesizableSignalType(memberType))
                {
                    if (RTLModuleHelper.TryGetNullableType(memberType, out var actualType))
                    {
                        backingField.SetValue(value, Activator.CreateInstance(actualType));
                    }
                    else
                    {
                        backingField.SetValue(value, Activator.CreateInstance(memberType));
                    }
                    continue;
                }

                if (RTLModuleHelper.IsSynthesizableObject(memberType))
                {
                    RecurviseResetToDefaults(memberValue);
                    continue;
                }

                if (RTLModuleHelper.IsSynthesizableArrayType(memberType))
                {
                    var emptyArray = Array.CreateInstance(memberType.GetElementType(), (memberValue as Array).Length);
                    backingField.SetValue(value, emptyArray);
                    continue;
                }
            }

            return value;
        }

        public static void CarryOverAutoPropagateValues<TSource, TTarget>(TSource source, TTarget target)
        {
            var sourceType = typeof(TSource);
            var sourceMembers = RTLModuleHelper.SynthesizableMembers(sourceType);

            var targetType = typeof(TTarget);
            var targetMembers = RTLModuleHelper.SynthesizableMembers(targetType);

            foreach (var m in targetMembers)
            {
                var targetValue = m.GetValue(target);
                if (targetValue != null)
                    return;

                var sourceMember = sourceMembers.SingleOrDefault(s => s == m);
                if (sourceMember == null)
                    throw new Exception($"Member value is null on target ({targetType}.{m.Name}). Source type {sourceType.Name} does not containe fallback member");

                var carryOverValue = sourceMember.GetValue(source);
                if (carryOverValue == null)
                    throw new Exception($"Member value is null on target ({targetType}.{m.Name}). Source type {sourceType.Name} returned null fallback value");

                var backingField = getBackingField(target, m);
                backingField.SetValue(target, carryOverValue);
            }
        }
    }
    
    [RTLToolkitType]
    public class RTLPipelineStage<TSource, TInput, TOutput> : 
        IRTLPipelineStage<TSource, TInput, TOutput>,
        IRTLPipelineDiagnostics
    {
        public IRTLPipelineDiagnostics Diag => this;
        public TOutput State { get; set; }
        public TOutput NextState { get; set; }

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
        private Func<TInput> inputsFactory;
        private IRTLPipelineStage<TOutput> nextStage;

        public RTLPipelineStage(IRTLPipelineHead<TSource> head, Func<TInput, TOutput> stage)
        {
            pipelineHead = head;
            stageMap = stage;
        }

        public IRTLPipelineStage<TSource, TResult> Stage<TResult>(Func<TOutput, TResult> map)
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
        public void StageSetup()
        {
            // do not setup state values of pipeline in StageSetup
            // moved to initial schedule with actual input values to support stage arrays
            nextStage?.StageSetup();
        }

        public void StageSchedule(Func<TInput> inputsFactory)
        {
            this.inputsFactory = inputsFactory;

            if (State == null && NextState == null)
            {
                var stageInputs = inputsFactory();
                State = RTLPipelineStageTools.RecurviseResetToDefaults(stageMap(stageInputs));
                RTLPipelineStageTools.CarryOverAutoPropagateValues(stageInputs, State);

                var nextStageInputs = inputsFactory();
                NextState = RTLPipelineStageTools.RecurviseResetToDefaults(stageMap(nextStageInputs));
                RTLPipelineStageTools.CarryOverAutoPropagateValues(nextStageInputs, NextState);
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
            NextState = stageMap(inputs);
            RTLPipelineStageTools.CarryOverAutoPropagateValues(inputs, NextState);

            return nextStage?.StageStage(iteration) ?? false;
        }
        #endregion;

        #region IRTLControlFlow
        public void Schedule(Func<TSource> sourceFactory) => pipelineHead.Schedule(sourceFactory);
        public bool Stage(int iteration) => pipelineHead.Stage(iteration);
        public void Commit() => pipelineHead.Commit();
        public void Reset() => pipelineHead.Reset();
        public void Setup() => pipelineHead.Setup();
        #endregion
    }
}
