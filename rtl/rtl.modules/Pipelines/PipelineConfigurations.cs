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
    }
}
