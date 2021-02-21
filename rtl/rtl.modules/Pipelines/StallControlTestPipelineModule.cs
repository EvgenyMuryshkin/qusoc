using Quokka.RTL;
using Quokka.RTL.Local;
using System;

namespace RTL.Modules
{
    public class StallControlTestPipelineModuleInputs
    {
        public bool stallStage0;
        public bool stallStage1;
        public bool stallStage2;
        public bool stallStage3;
        public bool stallPipeline;
        public bool stallPrev;
    }

    public class StallControlTestPipelineStage0
    {
        public byte stage0Counter;
    }

    public class StallControlTestPipelineStage1
    {
        public byte stage0Counter;
        public byte stage1Counter;
    }

    public class StallControlTestPipelineStage2
    {
        public byte stage0Counter;
        public byte stage1Counter;
        public byte stage2Counter;
    }

    public class StallControlTestPipelineStage3
    {
        public byte stage0Counter;
        public byte stage1Counter;
        public byte stage2Counter;
        public byte stage3Counter;
    }

    public class StallControlTestOutput
    {
        public bool pipelineWillStall;
        public bool pipelineStalled;
        public bool stage0WillStall;
        public bool stage0Stalled;
        public bool stage1WillStall;
        public bool stage1Stalled;
        public bool stage2WillStall;
        public bool stage2Stalled;
        public bool stage3WillStall;
        public bool stage3Stalled;
        public byte stage0Counter;
        public byte stage1Counter;
        public byte stage2Counter;
        public byte stage3Counter;
    }

    public class StallControlTestPipelineModule : RTLSynchronousModule<StallControlTestPipelineModuleInputs, PipelinesTestModuleEmptyState>
    {
        IRTLPipelineStage<StallControlTestPipelineModuleInputs, StallControlTestPipelineStage3> Pipeline;
        IRTLPipelinePeek<StallControlTestPipelineStage0> stage0Peek => Pipeline.Peek<StallControlTestPipelineStage0>();
        IRTLPipelinePeek<StallControlTestPipelineStage1> stage1Peek => Pipeline.Peek<StallControlTestPipelineStage1>();
        IRTLPipelinePeek<StallControlTestPipelineStage2> stage2Peek => Pipeline.Peek<StallControlTestPipelineStage2>();
        IRTLPipelinePeek<StallControlTestPipelineStage3> stage3Peek => Pipeline.Peek<StallControlTestPipelineStage3>();

        public StallControlTestOutput outResult => new StallControlTestOutput()
        {
            pipelineWillStall = Pipeline.PipelinePreview.PipelineWillStall,
            pipelineStalled = Pipeline.PipelineControl.PipelineStalled,
            stage0WillStall = stage0Peek.Preview.StageWillStall,
            stage0Stalled = stage0Peek.Control.StageStalled,
            stage1WillStall = stage1Peek.Preview.StageWillStall,
            stage1Stalled = stage1Peek.Control.StageStalled,
            stage2WillStall = stage2Peek.Preview.StageWillStall,
            stage2Stalled = stage2Peek.Control.StageStalled,
            stage3WillStall = stage3Peek.Preview.StageWillStall,
            stage3Stalled = stage3Peek.Control.StageStalled,
            stage0Counter = Pipeline.State.stage0Counter,
            stage1Counter = Pipeline.State.stage1Counter,
            stage2Counter = Pipeline.State.stage2Counter,
            stage3Counter = Pipeline.State.stage3Counter,
        };

        public StallControlTestPipelineModule()
        {
            Pipeline = LocalPipelineConfig;
        }

        IRTLPipelineStage<StallControlTestPipelineModuleInputs, StallControlTestPipelineStage3> LocalPipelineConfig
            => PipelineBuilder
                .Source<StallControlTestPipelineModuleInputs>()
                .Stage<StallControlTestPipelineStage0>((i, state, stageControl) =>
                {
                    stageControl.Request.StallSelf = Inputs.stallStage0 && !Inputs.stallPipeline && !Inputs.stallPrev;
                    stageControl.Request.StallPrev = Inputs.stallStage0 && !Inputs.stallPipeline && Inputs.stallPrev;
                    stageControl.Request.StallPipeline = Inputs.stallStage0 && Inputs.stallPipeline && !Inputs.stallPrev;

                    return new StallControlTestPipelineStage0
                    {
                        stage0Counter = (byte)(state.stage0Counter + 1)
                    };
                })
                .Stage<StallControlTestPipelineStage1>((i, state, stageControl) =>
                {
                    stageControl.Request.StallSelf = Inputs.stallStage1 && !Inputs.stallPipeline && !Inputs.stallPrev;
                    stageControl.Request.StallPrev = Inputs.stallStage1 && !Inputs.stallPipeline && Inputs.stallPrev;
                    stageControl.Request.StallPipeline = Inputs.stallStage1 && Inputs.stallPipeline && !Inputs.stallPrev;

                    return new StallControlTestPipelineStage1
                    {
                        stage0Counter = i.stage0Counter,
                        stage1Counter = (byte)(state.stage1Counter + 1)
                    };
                })
                .Stage<StallControlTestPipelineStage2>((i, state, stageControl) =>
                {
                    stageControl.Request.StallSelf = Inputs.stallStage2 && !Inputs.stallPipeline && !Inputs.stallPrev;
                    stageControl.Request.StallPrev = Inputs.stallStage2 && !Inputs.stallPipeline && Inputs.stallPrev;
                    stageControl.Request.StallPipeline = Inputs.stallStage2 && Inputs.stallPipeline && !Inputs.stallPrev;

                    return new StallControlTestPipelineStage2
                    {
                        stage0Counter = i.stage0Counter,
                        stage1Counter = i.stage1Counter,
                        stage2Counter = (byte)(state.stage2Counter + 1),
                    };
                })
                .Stage<StallControlTestPipelineStage3>((i, state, stageControl) =>
                {
                    stageControl.Request.StallSelf = Inputs.stallStage3 && !Inputs.stallPipeline && !Inputs.stallPrev;
                    stageControl.Request.StallPrev = Inputs.stallStage3 && !Inputs.stallPipeline && Inputs.stallPrev;
                    stageControl.Request.StallPipeline = Inputs.stallStage3 && Inputs.stallPipeline && !Inputs.stallPrev;

                    return new StallControlTestPipelineStage3
                    {
                        stage0Counter = i.stage0Counter,
                        stage1Counter = i.stage1Counter,
                        stage2Counter = i.stage2Counter,
                        stage3Counter = (byte)(state.stage3Counter + 1)
                    };
                });

        protected override void OnSchedule(Func<StallControlTestPipelineModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            Pipeline.Schedule(() => Inputs);
        }

        protected override void OnStage()
        {
        }
    }
}
