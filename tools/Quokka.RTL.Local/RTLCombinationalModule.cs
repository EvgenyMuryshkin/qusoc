using Quokka.RTL.Simulator;
using Quokka.RTL.Tools;
using Quokka.RTL.Verilog;
using Quokka.RTL.VHDL;
using Quokka.VCD;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace Quokka.RTL
{
    [RTLToolkitType]
    public class RTLModuleCycleParams
    {
        public int MaxDeltaCycles = 1000;
        public Action OnBeforeStage;
    }


    [RTLToolkitType]
    public abstract class RTLCombinationalModule<TInput> : IRTLCombinationalModule<TInput>
        where TInput : new()
    {
        public virtual RTLModuleAnalizers Analizers => null;
        public Type InputsType { get; } = typeof(TInput);
        public virtual string ModuleName => GetType().Name;
        public virtual IEnumerable<MemberInfo> InputProps { get; private set; }
        public virtual IEnumerable<MemberInfo> OutputProps { get; private set; }
        public virtual IEnumerable<MemberInfo> InternalProps { get; private set; }
        public virtual IEnumerable<MemberInfo> ModuleProps { get; private set; }
        public virtual List<RTLModuleDetails> ModuleDetails { get; private set; } = new List<RTLModuleDetails>();
        public virtual IEnumerable<IRTLCombinationalModule> Modules => ModuleDetails.Select(m => m.Module);

        public event EventHandler Scheduled;

        protected void InitInputs(TInput inputs)
        {
            if (inputs == null) throw new NullReferenceException(nameof(inputs));
            Inputs = inputs;
        }

        protected void ThrowNotSetup()
        {
            throw new InvalidOperationException($"Module '{GetType().Name}' is not initialized. Please call .Setup() on module instance or top of the hierarchy.");
        }

        protected T CreateAndInitializeRelatedObject<T>() where T : new()
        {
            var t = new T();
            OnRelatedObjectCreating(t);
            return t;
        }

        void Initialize()
        {
            if (Inputs == null)
                Inputs = CreateAndInitializeRelatedObject<TInput>();

            InputProps = RTLModuleHelper.SignalProperties(InputsType);
            OutputProps = RTLModuleHelper.OutputProperties(GetType());
            InternalProps = RTLModuleHelper.InternalProperties(GetType());
            ModuleProps = RTLModuleHelper.ModuleProperties(GetType());
            ModuleDetails = new List<RTLModuleDetails>();

            var fields = ModuleProps.Where(m => RTLModuleHelper.IsField(m));
            foreach (var m in fields)
            {
                var value = m.GetValue(this);

                if (value == null)
                {
                    throw new Exception($"Field {m.Name} returns null. Module should have an instance.");
                }

                var valueType = value.GetType();
                if (value is IRTLCombinationalModule module)
                {
                    ModuleDetails.Add(new RTLModuleDetails()
                    {
                        Module = module,
                        Member = m,
                        Name = m.Name
                    });
                    continue;
                }

                if (valueType.IsArray)
                {
                    var elementType = valueType.GetElementType();
                    if (typeof(IRTLCombinationalModule).IsAssignableFrom(elementType))
                    {
                        ModuleDetails.AddRange(
                            (value as IEnumerable).OfType<IRTLCombinationalModule>()
                            .Select((iteration, idx) =>
                            {
                                return new RTLModuleDetails()
                                {
                                    Module = iteration,
                                    Member = m,
                                    Name = $"{m.Name}{idx}"
                                };
                            }));
                        continue;
                    }
                }

                throw new Exception($"Field {m.Name} is not a module. Actual type is {(value?.GetType()?.Name ?? "null")}");
            }
        }

        protected virtual void OnSetup()
        {
            Initialize();

            foreach (var child in Modules)
            {
                child.Setup();
            }
        }

        protected virtual void OnSetupCompleted()
        {

        }

        public virtual bool OnRelatedObjectCreating(object data) => false;

        public void Setup()
        {
            OnSetup();

            Schedule(() => Inputs);

            OnSetupCompleted();
        }

        public TInput Inputs { get; private set; }
        object IRTLCombinationalModule.RawInputs => Inputs;
        protected Func<TInput> InputsFactory;

        protected virtual void OnSchedule(Func<TInput> inputsFactory)
        {
            InputsFactory = inputsFactory;
        }

        public void Schedule(Func<TInput> inputsFactory)
        {
            OnSchedule(inputsFactory);

            Scheduled?.Invoke(this, new EventArgs());
        }

        public virtual bool DeepEquals(object lhs, object rhs) => DeepDiff.DeepEquals(lhs, rhs);
        protected virtual bool ShouldStage(TInput nextInputs)
        {
            if (InputProps == null)
                ThrowNotSetup();

            // check if given set of inputs was already processed on previous iteration
            return !DeepEquals(Inputs, nextInputs);
        }

        public virtual RTLModuleStageResult DeltaCycle(int deltaCycle)
        {
            if (InputsFactory == null)
                throw new InvalidOperationException($"InputsFactory is not specified. Did you forget to schedule module?");

            var nextInputs = InputsFactory();

            bool selfModified = deltaCycle == 0 || ShouldStage(nextInputs);
            bool childrenModified = false;

            Inputs = nextInputs;

            foreach (var child in Modules)
            {
                childrenModified |= child.DeltaCycle(deltaCycle) == RTLModuleStageResult.Unstable;
            }

            return (selfModified | childrenModified) ? RTLModuleStageResult.Unstable : RTLModuleStageResult.Stable;
        }

        public virtual void Commit()
        {
            foreach (var child in Modules)
            {
                child.Commit();
            }
        }

        public virtual void Reset(RTLModuleResetOptions resetOptions = null)
        {
            foreach (var child in Modules)
            {
                child.Reset(resetOptions);
            }
        }

        public virtual RTLSignalInfo SizeOfValue(object value) => RTLSignalTools.SizeOfValue(value);
        public virtual int VCDSizeOfValue(object value) => VCDInteraction.SizeOf(value);

        protected virtual IEnumerable<VCDVariable> ToVCDVariables(string name, object value, bool includeToolkitTypes = false)
        {
            if (value == null)
                return Enumerable.Empty<VCDVariable>();

            var recursivePrefix = string.IsNullOrEmpty(name) ? "" : $"{name}_";

            switch (value)
            {
                case Enum v:
                    return new[]
                    {
                        new VCDVariable($"{name}ToString", value.ToString(), VCDSizeOfValue("")),
                        new VCDVariable($"{name}", value, VCDSizeOfValue(value))
                    };
                case RTLBitArray b:
                    return new[]
                    {
                        new VCDVariable($"{name}", value, VCDSizeOfValue(value))
                    };
                default:
                    var valueType = value.GetType();
                    if (valueType.IsArray)
                    {
                        var result = new List<VCDVariable>();
                        // TODO: array of objects
                        var enumerable = value as IEnumerable;
                        var idx = 0;
                        foreach (var item in enumerable)
                        {
                            result.AddRange(ToVCDVariables($"{name}{idx++}", item, includeToolkitTypes));
                        }
                        return result;
                    }

                    if (RTLTypeCheck.IsSynthesizableObject(valueType))
                    {
                        var result = new List<VCDVariable>();

                        var props = RTLReflectionTools.SynthesizableMembers(valueType, includeToolkitTypes);
                        foreach (var m in props)
                        {
                            var memberValue = m.GetValue(value) ?? RTLModuleHelper.Activate(m.GetMemberType());

                            result.AddRange(ToVCDVariables(m, memberValue, recursivePrefix));
                        }

                        return result;
                    }

                    if (valueType.IsConstructedGenericType)
                    {
                        var genericType = valueType.GetGenericTypeDefinition();

                        // TODO: something smarter then this
                        if (genericType.Name.StartsWith("ValueTuple`"))
                        {
                            var result = new List<VCDVariable>();

                            var props = RTLReflectionTools.SynthesizableMembers(valueType, includeToolkitTypes).Where(m => m.Name.StartsWith("Item"));
                            foreach (var m in props)
                            {
                                var memberValue = m.GetValue(value) ?? RTLModuleHelper.Activate(m.GetMemberType());

                                result.AddRange(ToVCDVariables(m, memberValue, recursivePrefix));
                            }

                            return result;
                        }
                    }

                    return new[]
                    {
                        new VCDVariable($"{name}", value, VCDSizeOfValue(value))
                    };
            }
        }

        protected virtual IEnumerable<VCDVariable> ToVCDVariables(MemberInfo memberInfo, object value, string namePrefix = "")
        {
            return ToVCDVariables($"{namePrefix}{memberInfo.Name}", value);
        }

        protected VCDSignalsSnapshot currentSnapshot = null;
        protected MemberInfo currentMember = null;

        protected void ThrowVCDException(Exception ex)
        {
            throw new VCDSnapshotException($"Failed to save snapshot of {GetType().Name}.{(currentSnapshot?.Name ?? "null")}.{(currentMember?.Name ?? "null")}", ex);
        }

        public virtual void PopulateSnapshot(VCDSignalsSnapshot snapshot, RTLModuleSnapshotConfig config = null)
        {
            config = config ?? RTLModuleSnapshotConfig.Default;
            try
            {
                if (config.IsIncluded(RTLModuleSnapshotConfigInclude.Inputs))
                {
                    currentSnapshot = snapshot.Scope("Inputs");
                    foreach (var prop in InputProps)
                    {
                        currentMember = prop;
                        var value = currentMember.GetValue(Inputs);
                        currentSnapshot.SetVariables(ToVCDVariables(currentMember, value));
                    }
                }

                if (config.IsIncluded(RTLModuleSnapshotConfigInclude.Outputs))
                {
                    currentSnapshot = snapshot.Scope("Outputs");
                    foreach (var prop in OutputProps)
                    {
                        currentMember = prop;
                        var value = currentMember.GetValue(this);
                        currentSnapshot.SetVariables(ToVCDVariables(currentMember, value));
                    }
                }

                if (config.IsIncluded(RTLModuleSnapshotConfigInclude.Internals))
                {
                    currentSnapshot = snapshot.Scope("Internals");
                    foreach (var prop in InternalProps)
                    {
                        currentMember = prop;
                        var value = currentMember.GetValue(this);
                        currentSnapshot.SetVariables(ToVCDVariables(currentMember, value));
                    }
                }

                if (config.IsIncluded(RTLModuleSnapshotConfigInclude.Modules))
                {
                    currentSnapshot = null;
                    foreach (var m in ModuleProps.Where(m => RTLModuleHelper.IsField(m)))
                    {
                        var value = m.GetValue(this);
                        currentMember = m;

                        if (value is IRTLCombinationalModule module)
                        {
                            var moduleScope = snapshot.Scope(m.Name);

                            module.PopulateSnapshot(moduleScope);
                            continue;
                        }

                        // TODO: support for modules array
                    }
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

        public void Cycle(TInput inputs, RTLModuleCycleParams cycleParams = null)
        {
            if (cycleParams == null)
                cycleParams = new RTLModuleCycleParams();

            Schedule(() => inputs);
            var iteration = 0;
            for (; iteration < cycleParams.MaxDeltaCycles; iteration++)
            {
                if (DeltaCycle(iteration) == RTLModuleStageResult.Stable)
                    break;
            }

            if (iteration == cycleParams.MaxDeltaCycles)
                throw new MaxStageIterationReachedException();

            cycleParams.OnBeforeStage?.Invoke();

            Commit();
        }

        protected int[] range(int length)
        {
            return Enumerable.Range(0, length).ToArray();
        }

        protected int[] range(int from, int length)
        {
            return Enumerable.Range(from, length).ToArray();
        }

        [RTLNonSynthesizable]
        protected void Assert(bool condition, string message)
        {
            if (!condition)
                throw new Exception($"Condition failed: {message}");
        }

        [RTLNonSynthesizable]
        protected void Assert(Action action)
        {
            action();
        }

        [RTLNonSynthesizable]
        public virtual IRTLModuleTranslator InstanceTranslator(IRTLModuleTranslatorDeps deps) => null;

        public List<MemberInfo> GetMembers()
        {
            var members = GetType().GetMembers(BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.FlattenHierarchy).ToList();// RTLReflectionTools.SerializableMembers(topType);
            return members;
        }
    }
}
