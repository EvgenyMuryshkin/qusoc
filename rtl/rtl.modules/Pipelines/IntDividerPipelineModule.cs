using Quokka.RTL;
using System;
using System.Diagnostics;

namespace RTL.Modules
{
    public class IntDividerPipelineModuleInputs
    {
        public bool inReady;
        public RTLBitArray inNumerator = new RTLBitArray(0);
        public RTLBitArray inDenominator = new RTLBitArray(0);
    }

    public class IntDividerPipelineModule : RTLSynchronousModule<IntDividerPipelineModuleInputs, PipelinesTestModuleEmptyState>
    {
        IRTLPipelineStage<IntDividerPipelineInputs<bool>, IntDividerPipelineResult<bool>> DivPipeline = IntDividerPipelineTools.DivPipeline<bool>();

        public bool OutReady => DivPipeline.State.Payload;
        public int OutRes => DivPipeline.State.result;
        public int OutRem => DivPipeline.State.remainder;

        protected override void OnSchedule(Func<IntDividerPipelineModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            DivPipeline.Schedule(() => new IntDividerPipelineInputs<bool>()
            {
                Payload = Inputs.inReady,
                inNumerator = Inputs.inNumerator,
                inDenominator = Inputs.inDenominator
            });
        }
        
        protected override void OnStage()
        {
        }
    }
}
