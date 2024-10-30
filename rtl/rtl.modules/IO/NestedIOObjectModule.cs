using Quokka.RTL;
using System;

namespace RTL.Modules
{
    public class L1NestedIOObjectModuleInputs
    {
        public bool boolValue;
        public byte byteValue;
    }

    public class L2NestedIOObjectModuleInputs
    {
        public L1NestedIOObjectModuleInputs i1 = new L1NestedIOObjectModuleInputs();
        public L1NestedIOObjectModuleInputs i2 = new L1NestedIOObjectModuleInputs();
    }

    public class L1ToArrayIOObjectModule : RTLCombinationalModule<L2NestedIOObjectModuleInputs>
    {
        public L1NestedIOObjectModuleInputs[] oValues => [
            Inputs.i1,
            Inputs.i2
        ];
    }

    public class L1NestedIOObjectModule : RTLCombinationalModule<L1NestedIOObjectModuleInputs>
    {
        L2NestedIOObjectModule l2 = new L2NestedIOObjectModule();
        protected override void OnSchedule(Func<L1NestedIOObjectModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            l2.Schedule(() => new L2NestedIOObjectModuleInputs()
            { 
                i1 = new L1NestedIOObjectModuleInputs()
                {
                    boolValue = Inputs.boolValue,
                    byteValue = Inputs.byteValue,
                },
                i2 = new L1NestedIOObjectModuleInputs()
                {
                    boolValue = !Inputs.boolValue,
                    byteValue = (byte)(Inputs.byteValue + 1)
                }
            });
        }

        public L1NestedIOObjectModuleInputs[] oValues => l2.oValues;
    }

    public class L2NestedIOObjectModule : RTLCombinationalModule<L2NestedIOObjectModuleInputs>
    {
        public L1NestedIOObjectModuleInputs[] oValues => [
            Inputs.i1,
            Inputs.i2
        ];
    }
}
