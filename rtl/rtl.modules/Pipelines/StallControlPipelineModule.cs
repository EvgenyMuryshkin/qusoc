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
        public bool? ready { get; set; }
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

    public class StallControlOutput
    {
        public bool ready;
        public ushort result;
        public bool pipelineWillStall;
        public bool pipelineStalled;
        public bool stage0WillStall;
        public bool stage0Stalled;
        public bool stage1WillStall;
        public bool stage1Stalled;
        public bool stage2WillStall;
        public bool stage2Stalled;
    }

    public class StallControlPipelineModule : RTLSynchronousModule<StallControlInputs, PipelinesTestModuleEmptyState>
    {
        IRTLPipelineStage<StallControlInputs, StallControlStage2> Pipeline;
        IRTLPipelinePeek<StallControlStage0> stage0Peek => Pipeline.Peek<StallControlStage0>();
        IRTLPipelinePeek<StallControlStage1> stage1Peek => Pipeline.Peek<StallControlStage1>();
        IRTLPipelinePeek<StallControlStage2> stage2Peek => Pipeline.Peek<StallControlStage2>();

        public StallControlOutput outResult => new StallControlOutput()
        {
            ready = (bool)Pipeline.State.ready,
            result = Pipeline.State.result,
            pipelineWillStall = Pipeline.PipelinePreview.PipelineWillStall,
            pipelineStalled = Pipeline.PipelineControl.PipelineStalled,
            stage0WillStall = stage0Peek.Preview.StageWillStall,
            stage0Stalled = stage0Peek.Control.StageStalled,
            stage1WillStall = stage1Peek.Preview.StageWillStall,
            stage1Stalled = stage1Peek.Control.StageStalled,
            stage2WillStall = stage2Peek.Preview.StageWillStall,
            stage2Stalled = stage2Peek.Control.StageStalled
        };

        public StallControlPipelineModule()
        {
            Pipeline = LocalPipelineConfig;
        }

        IRTLPipelineStage<StallControlInputs, StallControlStage2> LocalPipelineConfig
            => PipelineBuilder
                .Source<StallControlInputs>()
                .Stage<StallControlStage0>((i, state, stageControl) =>
                {
                    // stall first stage until in data is ready
                    stageControl.Request.StallSelf = !i.inReady;
                    return new StallControlStage0
                    {
                        ready = i.inReady,
                        data = i.inData
                    };
                })
                .Stage<StallControlStage1>((s0, state, stageControl) =>
                {
                    // stall previous stage until count to input value
                    stageControl.Request.StallPrev = (bool)s0.ready && (state.counter < s0.data);
                    return new StallControlStage1
                    {
                        counter = (byte)(state.counter == s0.data ? 0 : state.counter + 1),
                        data = (byte)(s0.data + 1),
                        ready = (bool)s0.ready && state.counter == s0.data
                    };
                })
                .Stage<StallControlStage2>((s1, state, stageControl) =>
                {
                    // stall whole pipeline until input indicates ready to proceed
                    stageControl.Request.StallPipeline = !Inputs.inProcessed;
                    return new StallControlStage2()
                    {
                        result = (byte)(s1.data + state.result)
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
