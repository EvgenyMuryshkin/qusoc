using Quokka.RTL;
using Quokka.RTL.Local;
using System;

namespace RTL.Modules
{
    public class BitArrayResult
    {
        public bool ready;
        public RTLBitArray result;
    }

    public class BitArrayPipelineModule : RTLSynchronousModule<PipelineTestInputs, PipelinesTestModuleEmptyState>
    {
        IRTLPipelineStage<PipelineTestInputs, BitArrayResult> Pipeline;
        public bool outReady => Pipeline.State.ready;
        public ushort outResult => Pipeline.State.result;
        public RTLBitArray outBitArray => Pipeline.State.result;

        public BitArrayPipelineModule()
        {
            Pipeline = LocalPipelineConfig;
        }

        IRTLPipelineStage<PipelineTestInputs, BitArrayResult> LocalPipelineConfig
            => PipelineBuilder
                .Source<PipelineTestInputs>()
                .Stage(i => new {
                    IsS0Ready = i.inReady,
                    Sum = new RTLBitArray(i.inData[0]) + new RTLBitArray(i.inData[1]),
                    Data = i.inData,
                })
                .Stage(s0 => new {
                    IsS1Ready = s0.IsS0Ready,
                    Sum = s0.Sum + s0.Data[2],
                    Data = s0.Data,
                })
                .Stage(s1 => new BitArrayResult()
                {
                    ready = s1.IsS1Ready,
                    result = s1.Sum + s1.Data[3]
                });

        protected override void OnSchedule(Func<PipelineTestInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            Pipeline.Schedule(() => Inputs);
        }

        protected override void OnStage()
        {
        }
    }
}
