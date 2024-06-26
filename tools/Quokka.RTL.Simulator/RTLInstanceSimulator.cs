﻿using Quokka.VCD;
using System;
using System.IO;

namespace Quokka.RTL.Simulator
{
    public class RTLInstanceSimulatorHooks
    {

    }

    public class RTLInstanceSimulator<TModule>
        where TModule : IRTLCombinationalModule
    {
        protected TModule _topLevel;

        RTLModuleSnapshotConfig _snapshotConfig;
        VCDBuilder _vcdBuilder;
        VCDSignalsSnapshot _topLevelSnapshot;
        protected RTLSimulatorContext _simulatorContext;

        public RTLSimulatorSnapshot Snapshot => new RTLSimulatorSnapshot() { Clock = _simulatorContext.Clock };
        
        protected RTLSimulatorCallback<TModule> CallbackData 
            => new RTLSimulatorCallback<TModule>()
            {
                TopLevel = _topLevel,
                Clock = _simulatorContext.Clock,
                StageIteration = _simulatorContext.DeltaCycle
            };

        public TModule TopLevel => _topLevel;
        public Action<TModule> OnPostStage { get; set; }
        public Action<TModule> OnPostCommit { get; set; }
        public Func<RTLSimulatorCallback<TModule>, bool> IsRunning { get; set; }

        protected RTLInstanceSimulator()
        {

        }

        public RTLInstanceSimulator(TModule topLevel, string vcdPath, RTLModuleSnapshotConfig config = null)
        {
            Initialize(topLevel, vcdPath, config);
        }

        protected void Initialize(TModule topLevel, string vcdPath, RTLModuleSnapshotConfig config = null)
        {
            _topLevel = topLevel;
            _topLevel.Setup();
            _simulatorContext = new RTLSimulatorContext();

            if (vcdPath != null)
            {
                TraceToVCD(vcdPath, config);
            }

            DeltaCycles();
            _simulatorContext.NextMilestone();
        }

        internal void RecursiveCreateTargetDirectory(string directory)
        {
            if (Directory.Exists(directory))
                return;

            RecursiveCreateTargetDirectory(Path.GetDirectoryName(directory));

            Directory.CreateDirectory(directory);
        }

        void TraceToVCD(string outputFileName, RTLModuleSnapshotConfig config = null)
        {
            Console.WriteLine($"Tracing to: {outputFileName}");
            RecursiveCreateTargetDirectory(Path.GetDirectoryName(outputFileName));

            _snapshotConfig = config;
            _vcdBuilder = new VCDBuilder(outputFileName);
            _topLevelSnapshot = new VCDSignalsSnapshot("TOP");
            _simulatorContext.ControlScope = _topLevelSnapshot.Scope("Control");
            _simulatorContext.ClockSignal = _simulatorContext.ControlScope.Add(new VCDVariable("Clock", false, 1));

            _topLevel.PopulateSnapshot(_topLevelSnapshot, _snapshotConfig);
            _vcdBuilder.Init(_topLevelSnapshot);
        }

        protected virtual void TraceSignals()
        {
            if (_vcdBuilder == null)
                return;

            _topLevel.PopulateSnapshot(_topLevelSnapshot, _snapshotConfig);
            _vcdBuilder.Snapshot(_simulatorContext.CurrentTime, _topLevelSnapshot);
        }

        public virtual void DeltaCycles()
        {
            _simulatorContext.DeltaCycle = 0;
            _simulatorContext.MilestoneOffset = 0;

            do
            {
                _simulatorContext.MilestoneOffset++;

                var stageResult = _topLevel.DeltaCycle(_simulatorContext.DeltaCycle);
                _simulatorContext.TotalDeltaCycles++;

                TraceSignals();

                // no modules were modified during stage iteration, all converged
                if (stageResult == RTLModuleStageResult.Stable)
                    break;
            }
            while (++_simulatorContext.DeltaCycle < _simulatorContext.MaxDeltaCycles);

            if (_simulatorContext.DeltaCycle >= _simulatorContext.MaxDeltaCycles)
                throw new MaxStageIterationReachedException();
        }

        public virtual void ClockCycle()
        {
            DeltaCycles();

            OnPostStage?.Invoke(_topLevel);

            _simulatorContext.NextMilestone();

            // clock rise will commit all changes
            _simulatorContext.ClockSignal?.SetValue(true);
            _topLevel.Commit();
            TraceSignals();

            DeltaCycles();
            OnPostCommit?.Invoke(_topLevel);

            _simulatorContext.Clock++;
            _simulatorContext.NextMilestone();

            // clock fall is not handled in RTL module, all sync is done of clock rise at the moment
            _simulatorContext.ClockSignal?.SetValue(false);
            TraceSignals();
        }

        public void Run()
        {
            while (_simulatorContext.Clock < _simulatorContext.MaxClockCycles)
            {
                if (!(IsRunning?.Invoke(CallbackData) ?? true))
                    break;

                ClockCycle();
            }
        }

        public virtual bool HasTestbench => false;
        public virtual string CompleteTestbench() => null;
    }

    public class RTLInstanceSimulator<TModule, TInputs> : RTLInstanceSimulator<TModule>
        where TModule : IRTLCombinationalModule<TInputs>
        where TInputs : new()
    {
        TestbenchGenerator _tbGen = null;

        public RTLInstanceSimulator(
            TModule topLevel, 
            string vcdPath = null,
            RTLModuleSnapshotConfig config = null,
            bool withTestbench = false) : base(topLevel, vcdPath, config)
        {
            if (withTestbench)
                _tbGen = new TestbenchGenerator(_simulatorContext, topLevel);
            
            _tbGen?.SetupTestbench();
        }

        public virtual void ClockCycles(
            Func<bool> preCheck,
            Func<TInputs> inputsFactory, 
            Func<bool> postCheck, 
            int maxIterations = 100, 
            string message = "Max cycles exceeded")
        {
            while (maxIterations-- >= 0)
            {
                if (preCheck != null && preCheck())
                    return;

                ClockCycle(inputsFactory());

                if (postCheck != null && postCheck())
                    return;
            }

            throw new Exception(message);
        }

        public virtual void ClockCycle(TInputs inputs)
        {
            // TODO: override parameterless ClockCycle and write tb signals
            _topLevel.Schedule(() => inputs);
            _tbGen?.SetTestbenchInputs(inputs);
            ClockCycle();
            _tbGen?.AssertOutputs();
        }

        public override bool HasTestbench => _tbGen != null;
        public override string CompleteTestbench() => _tbGen?.CompleteTestbench();

        public TestbenchAdapter<TModule> TBAdapter(string configPath)
        {
            if (!HasTestbench)
                throw new Exception($"Testbench was not configures in {GetType().Name} simulator instance");

            return new TestbenchAdapter<TModule>(configPath, this);
        }
    }
}
