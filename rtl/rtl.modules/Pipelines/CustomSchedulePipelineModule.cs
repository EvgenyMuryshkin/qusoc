using Quokka.RTL;
using Quokka.RTL.Local;
using System;

namespace RTL.Modules
{
    public class CustomSchedulePipelineModule : RTLSynchronousModule<PipelineTestInputs, PipelinesTestModuleEmptyState>
    {
        IRTLPipelineStage<PipelineTestInputs, PipelineResult> Pipeline1;
        IRTLPipelineStage<PipelineTestInputs, PipelineResult> Pipeline2;

        public bool outReady1 => Pipeline1.State.ready;
        public ushort outResult1 => Pipeline1.State.result;
        public bool outReady2 => Pipeline2.State.ready;
        public ushort outResult2 => Pipeline2.State.result;

        public CustomSchedulePipelineModule()
        {
            Pipeline1 = PipelineConfigurations.LocalPipelineConfig;
            Pipeline2 = PipelineConfigurations.LocalPipelineConfig;
        }

        protected override void OnSchedule(Func<PipelineTestInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            Pipeline1.Schedule(() => new PipelineTestInputs()
            {
                inData = Inputs.inData,
                inReady = Inputs.inReady
            });
            
            Pipeline2.Schedule(() => new PipelineTestInputs()
            {
                inData = new byte[] 
                {
                    (byte)(Inputs.inData[7] + 1),
                    (byte)(Inputs.inData[6] * 2),
                    (byte)(Inputs.inData[5] << 1),
                    (byte)(Inputs.inData[3] - 3),
                    Inputs.inData[2],
                    Inputs.inData[1],
                    (byte)(Inputs.inData[4] >> 1),
                    Inputs.inData[0]
                },
                inReady = Inputs.inReady                
            });
        }

        protected override void OnStage()
        {
        }
    }
}
