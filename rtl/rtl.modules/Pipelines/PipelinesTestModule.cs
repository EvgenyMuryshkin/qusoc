using Quokka.RTL;
using Quokka.RTL.Local;
using System;
/*
namespace RTL.Modules
{
    public class PipelinesTestModuleInputs
    {
        public bool inReady;
        public byte[] inData = new byte[8];
    }

    public struct PipelineResult
    {
        public bool ready;
        public ushort sum;
    }

    public class PipelinesTestModuleState
    {
    }

    public class PipelinesTestModule : RTLSynchronousModule<PipelinesTestModuleInputs, PipelinesTestModuleState>
    {
        IRTLPipelineStage<PipelinesTestModuleInputs, PipelineResult> Pipeline;

        public bool outReady => Pipeline.State.ready;
        public ushort outSum => Pipeline.State.sum;

        public PipelinesTestModule()
        {
            Pipeline = PipelineConfig;
        }

        IRTLPipelineStage<PipelinesTestModuleInputs, PipelineResult> PipelineConfig
            => PipelineBuilder
                .Source<PipelinesTestModuleInputs>()
                .Stage(i => new { 
                    IsS0Ready = i.inReady, 
                    sum01 = i.inData[0] + i.inData[1],
                    sum23 = i.inData[2] + i.inData[3],
                    sum45 = i.inData[4] + i.inData[5],
                    sum67 = i.inData[6] + i.inData[7],
                })
                .Stage(s0 => new { 
                    IsS1Ready = s0.IsS0Ready,
                    sum0123 = s0.sum01 + s0.sum23,
                    sum4567 = s0.sum45 + s0.sum67
                })
                .Stage(s1 => new PipelineResult() { 
                    ready = s1.IsS1Ready, 
                    sum = (ushort)(s1.sum0123 + s1.sum4567)
                });

        protected override void OnSchedule(Func<PipelinesTestModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            Pipeline.Schedule(() => Inputs);
        }

        protected override void OnStage()
        {
        }
    }
}

*/