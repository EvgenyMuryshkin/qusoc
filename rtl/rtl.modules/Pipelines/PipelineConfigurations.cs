using Quokka.RTL;
using Quokka.RTL.Local;

namespace RTL.Modules
{
    public class PipelineTestInputs
    {
        public bool inReady;
        public byte[] inData = new byte[8];
    }

    public struct PipelineResult
    {
        public bool ready;
        public ushort result;
    }

    public class PipelineConfigurations
    {
        public static IRTLPipelineStage<PipelineTestInputs, PipelineResult> LocalPipelineConfig
            => PipelineBuilder
                .Source<PipelineTestInputs>()
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
                .Stage(s1 => new PipelineResult()
                {
                    ready = s1.IsS1Ready,
                    result = (ushort)(((byte)s1.sum0123 << 8) | (byte)s1.sum4567)
                });

        public static IRTLPipelineStage<PipelineTestInputs, TypedPipelineModuleStage2> TypedPipelineConfig
            => PipelineBuilder
                .Source<PipelineTestInputs>()
                .Stage(inputs =>
                {
                    var sum0 = (ushort)(inputs.inData[0] + inputs.inData[1]);
                    return new TypedPipelineModuleStage0
                    {
                        ready = inputs.inReady,
                        sums = new ushort[]
                        {
                            sum0,
                            (ushort)(inputs.inData[2] + inputs.inData[3]),
                            (ushort)(inputs.inData[4] + inputs.inData[5]),
                            (ushort)(inputs.inData[6] + inputs.inData[7]),
                            42
                        }
                    };
                })
                .Stage(stage0 => new TypedPipelineModuleStage1
                {
                    ready = stage0.ready,
                    s0Sums = stage0.sums,
                    sums = new[]
                    {
                        (ushort)(stage0.sums[0] + stage0.sums[1]),
                        (ushort)(stage0.sums[2] + stage0.sums[3])
                    }
                })
                .Stage(s1 => TypedPipelineModuleLogic.Stage2Logic(s1));
    }
}
