using FPGA.Attributes;
using Quokka.Public.Tools;
using Quokka.RTL;
using System;
using System.Linq;

namespace RTL.Modules
{
    public class BoardTimerModuleInputs
    {
        public bool Restart;
    }

    public class BoardTimerModuleState { }

    [BoardConfig(Name = "Test")]
    public class BoardTimerModule : RTLSynchronousModule<BoardTimerModuleInputs, BoardTimerModuleState>
    {
        TimerInputs nestedTimerInputs => new TimerInputs { Restart = Inputs.Restart };
        TimerModule timerModule10;
        TimerModule timerModule20;

        public bool OutActive10 => timerModule10.OutActive;
        public bool OutActive20 => timerModule20.OutActive;

        public BoardTimerModule(
            RuntimeConfiguration runtimeConfiguration,
            TimerModule.Factory timerFactory)
        {
            var attribute = BoardConfigResolver.ResolveAttribute();
            var config = runtimeConfiguration.Config.Configurations.SingleOrDefault(c => c.Name == attribute?.Name);
            if (config == null)
                throw new NullReferenceException($"Cannot find board configuration: {attribute?.Name ?? "<<board name was not specified>>"}");

            timerModule10 = timerFactory(config.ClockFrequency);
            timerModule20 = timerFactory(config.ClockFrequency * 2);
        }

        protected override void OnSchedule(Func<BoardTimerModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            timerModule10.Schedule(() => nestedTimerInputs);
            timerModule20.Schedule(() => nestedTimerInputs);
        }

        protected override void OnStage()
        {
        }
    }
}
