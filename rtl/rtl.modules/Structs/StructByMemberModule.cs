using Quokka.RTL;

namespace RTL.Modules
{
    public class StructByMemberL3
    {
        public bool L3OptionalValue = false;
        public short L3RequiredValue;
    }

    public class StructByMemberL2
    {
        public StructByMemberL3 L3 = new StructByMemberL3();
        public (bool,StructByMemberL3) L3Tuple = (false, new StructByMemberL3());
        public RTLBitArray L2OptionalValue = new RTLBitArray().Resized(2);
    }

    public class StructByMemberL1
    {
        public StructByMemberL2[] L2 = new[] { new StructByMemberL2(), new StructByMemberL2() };
        public RTLBitArray L1OptionalValue = new RTLBitArray().Resized(1);
        public bool L1RequiredValue;
    }

    public class StructByMemberModuleInputs
    {
        public StructByMemberL1 iL1 = new StructByMemberL1();
    }

    public class StructByMemberModuleState
    {
        public StructByMemberL1 sL1 = new StructByMemberL1();
    }

    public class StructByMemberDirectModule : RTLCombinationalModule<StructByMemberModuleInputs>
    {
        public StructByMemberL1 oL1 => Inputs.iL1;
    }

    public class StructByMemberL1MembersModule : RTLCombinationalModule<StructByMemberModuleInputs>
    {
        public StructByMemberL1 oL1 => new StructByMemberL1()
        {
            L1OptionalValue = Inputs.iL1.L1OptionalValue,
            L1RequiredValue = Inputs.iL1.L1RequiredValue,
            L2 = Inputs.iL1.L2
        };
    }

    public class StructByMemberL2MembersModule : RTLCombinationalModule<StructByMemberModuleInputs>
    {
        public StructByMemberL1 oL1 => new StructByMemberL1()
        {
            L1OptionalValue = Inputs.iL1.L1OptionalValue,
            L1RequiredValue = Inputs.iL1.L1RequiredValue,
            L2 = new []
            {
                Inputs.iL1.L2[0],
                new StructByMemberL2()
                {
                    L2OptionalValue = Inputs.iL1.L2[1].L2OptionalValue,
                    L3 = Inputs.iL1.L2[1].L3,
                    L3Tuple = Inputs.iL1.L2[1].L3Tuple
                }
            }
        };
    }

    public class StructByMemberL3TupleMembersModule : RTLCombinationalModule<StructByMemberModuleInputs>
    {
        public StructByMemberL1 oL1 => new StructByMemberL1()
        {
            L1OptionalValue = Inputs.iL1.L1OptionalValue,
            L1RequiredValue = Inputs.iL1.L1RequiredValue,
            L2 = new[]
            {
                Inputs.iL1.L2[0],
                new StructByMemberL2()
                {
                    L2OptionalValue = Inputs.iL1.L2[1].L2OptionalValue,
                    L3 =
                    {
                        L3OptionalValue = Inputs.iL1.L2[1].L3.L3OptionalValue,
                        L3RequiredValue = Inputs.iL1.L2[1].L3.L3RequiredValue
                    },
                    L3Tuple = (Inputs.iL1.L2[1].L3Tuple.Item1, Inputs.iL1.L2[1].L3Tuple.Item2)
                }
            }
        };
    }

    public class StructByMemberL3MembersModule : RTLCombinationalModule<StructByMemberModuleInputs>
    {
        public StructByMemberL1 oL1 => new StructByMemberL1()
        {
            L1OptionalValue = Inputs.iL1.L1OptionalValue,
            L1RequiredValue = Inputs.iL1.L1RequiredValue,
            L2 = new[]
            {
                Inputs.iL1.L2[0],
                new StructByMemberL2()
                {
                    L2OptionalValue = Inputs.iL1.L2[1].L2OptionalValue,
                    L3 =
                    {
                        L3OptionalValue = Inputs.iL1.L2[1].L3.L3OptionalValue,
                        L3RequiredValue = Inputs.iL1.L2[1].L3.L3RequiredValue
                    },
                    L3Tuple = 
                    (
                        Inputs.iL1.L2[1].L3Tuple.Item1, 
                        new StructByMemberL3()
                        {
                            L3OptionalValue = Inputs.iL1.L2[1].L3Tuple.Item2.L3OptionalValue,
                            L3RequiredValue = Inputs.iL1.L2[1].L3Tuple.Item2.L3RequiredValue
                        }
                    )
                }
            }
        };
    }

    public class StructByMemberModule : RTLSynchronousModule<StructByMemberModuleInputs, StructByMemberModuleState>
    {
        protected override void OnStage()
        {
        }
    }
}
