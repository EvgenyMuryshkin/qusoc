using Quokka.RTL;
using Quokka.RTL.Local;
using System;

namespace RTL.Modules
{
    abstract class StageStateBaseType
    {
        public bool? IsReady { get; set; }
    }

    class Stage0PipelineState : StageStateBaseType
    {
        public ushort[] sums { get; set; } = new ushort[4];
        public ushort S0Counter { get; set; }
    }

    class Stage1PipelineState : StageStateBaseType
    {
        // size of the field may be unknown and can only be defined during module constructor. 
        // See OnRelatedObjectCreating override
        public ushort[] sums { get; set; }
        public ushort S0Counter { get; set; }
        public ushort S1Counter { get; set; }
    }

    class StatePipelineResult : StageStateBaseType
    {
        public ushort result;
        public ushort S0Counter;
        public ushort S1Counter;
        public ushort S2Counter;
    }

    public class StageStatePipelineModule : RTLSynchronousModule<PipelineTestInputs, PipelinesTestModuleEmptyState>
    {
        IRTLPipelineStage<PipelineTestInputs, StatePipelineResult> Pipeline;

        public bool outReady => (bool)Pipeline.State.IsReady;
        public ushort outResult => Pipeline.State.result;
        public ushort outS0Counter => Pipeline.State.S0Counter;
        public ushort outS1Counter => Pipeline.State.S1Counter;
        public ushort outS2Counter => Pipeline.State.S2Counter;

        public StageStatePipelineModule()
        {
            Pipeline = LocalPipelineConfig;
        }

        /// <summary>
        /// Pipelines are using default inputs propagation in order to determine size of data members
        /// When Stage method with inputs and current state is used, it is not possible to determine
        /// size of array, as state must me passed as argument.
        /// To resolve this chicken and egg situation, next method is introduced.
        /// It will be called to populate default state values.
        /// </summary>
        /// <param name="data">object to initialize</param>
        /// <returns>
        /// true: object is ready to use
        /// false: run object initialization with default type values
        /// </returns>
        public override bool OnRelatedObjectCreating(object data)
        {
            switch (data)
            {
                case Stage1PipelineState state:
                {
                    state.sums = new ushort[2];
                    return true;
                }
            }

            return base.OnRelatedObjectCreating(data);
        }

        IRTLPipelineStage<PipelineTestInputs, StatePipelineResult> LocalPipelineConfig
            => PipelineBuilder
                .Source<PipelineTestInputs>()
                // Using Stage with current state value required explicit type for stage and its specification
                // Alternative way is to user Pipeline.Peek, which still requires state type, but does not need 
                // explicit type specification in stage and OnRelatedObjectCreating call override
                .Stage<Stage0PipelineState>((i, state) => new Stage0PipelineState
                { 
                    IsReady = i.inReady, 
                    sums = new ushort[]
                    {
                        (ushort)(i.inData[2] + i.inData[3]),
                        (ushort)(i.inData[4] + i.inData[5]),
                        (ushort)(i.inData[0] + i.inData[1]),
                        (ushort)(i.inData[6] + i.inData[7]),
                    },
                    S0Counter = (ushort)(state.S0Counter + 1)
                })
                .Stage<Stage1PipelineState>((s0, prevState) => new Stage1PipelineState
                { 
                    S0Counter = s0.S0Counter,
                    S1Counter = (ushort)(prevState.S1Counter + 1),
                    sums = new ushort[]
                    {
                        (ushort)(s0.sums[0] + s0.sums[1]),
                        (ushort)(s0.sums[2] + s0.sums[3]),
                    }
                })
                .Stage< StatePipelineResult>((s1, prev) => new StatePipelineResult() { 
                    result = (ushort)(s1.sums[0] + s1.sums[1]),
                    S0Counter = s1.S0Counter,
                    S1Counter = s1.S1Counter,
                    S2Counter = (ushort)(prev.S2Counter + 1)
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
