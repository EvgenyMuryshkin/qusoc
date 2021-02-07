using Quokka.RTL;
using Quokka.RTL.Local;
using System;

namespace RTL.Modules
{
    public class StallControlInputs
    {
        public byte inData;
        public bool inReady;
        public bool inProcessed;
    }

    abstract class StallControlBaseType
    {
        public bool? IsReady { get; set; }
    }

    class StallControlStage0 : StallControlBaseType
    {
        public byte data;
    }

    class StallControlStage1 : StallControlBaseType
    {
        public byte data;
        public byte counter;
    }

    class StallControlStage2 : StallControlBaseType
    {
        public byte result;
    }

    public class StallControlPipelineModule : RTLSynchronousModule<StallControlInputs, PipelinesTestModuleEmptyState>
    {
        IRTLPipelineStage<StallControlInputs, StallControlStage2> Pipeline;
        IRTLPipelinePeek<StallControlStage0> stage0Peek => Pipeline.Peek<StallControlStage0>();
        IRTLPipelinePeek<StallControlStage1> stage1Peek => Pipeline.Peek<StallControlStage1>();
        IRTLPipelinePeek<StallControlStage2> stage2Peek => Pipeline.Peek<StallControlStage2>();

        public bool outReady => (bool)Pipeline.State.IsReady;
        public ushort outResult => Pipeline.State.result;
        public bool outPipelineWillStall => Pipeline.PipelineWillStall;
        public bool outPipelineStalled => Pipeline.PipelineStalled;
        public bool outStage0Stalled => stage0Peek.StageStalled;
        public bool outStage1Stalled => stage1Peek.StageStalled;
        public bool outStage2Stalled => stage2Peek.StageStalled;

        public StallControlPipelineModule()
        {
            Pipeline = LocalPipelineConfig;
        }

        IRTLPipelineStage<StallControlInputs, StallControlStage2> LocalPipelineConfig
            => PipelineBuilder
                .Source<StallControlInputs>()
                .Stage<StallControlStage0>((i, prevState, stageControl) =>
                {
                    // stall first stage until in data is ready
                    stageControl.StallSelf = !i.inReady;
                    return new StallControlStage0
                    {
                        IsReady = i.inReady,
                        data = i.inData
                    };
                })
                .Stage<StallControlStage1>((s0, prevState, stageControl) =>
                {
                    // stall previous stage until count to input value
                    stageControl.StallPrev = prevState.counter != s0.data;
                    return new StallControlStage1
                    {
                        counter = (byte)(prevState.counter == s0.data ? 0 : prevState.counter + 1),
                        data = (byte)(s0.data + 1)
                    };
                })
                .Stage<StallControlStage2>((s1, prev, stageControl) =>
                {
                    // stall whole pipeline until input indicates ready to proceed
                    stageControl.StallPipeline = !Inputs.inProcessed;
                    return new StallControlStage2()
                    {
                        result = (byte)(s1.data + prev.result + 1)
                    };
                });

        protected override void OnSchedule(Func<StallControlInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            Pipeline.Schedule(() => Inputs);
        }

        protected override void OnStage()
        {
        }
    }
}
