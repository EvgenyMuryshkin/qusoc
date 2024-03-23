using Quokka.RTL;

namespace RTL.Modules
{
    public class StructByMemberInternalModule : RTLCombinationalModule<StructByMemberModuleInputs>
    {
        protected StructByMemberL1 internalL1 => Inputs.iL1;
    }

    public class StructByMemberInternalDirectModule : StructByMemberInternalModule
    {
        public StructByMemberL1 oL1 => internalL1;
    }

    public class StructByMemberInternalL1MembersModule : StructByMemberInternalModule
    {
        public StructByMemberL1 oL1 => new StructByMemberL1()
        {
            L1OptionalValue = internalL1.L1OptionalValue,
            L1RequiredValue = internalL1.L1RequiredValue,
            L2 = internalL1.L2
        };
    }

    public class StructByMemberInternalL2MembersModule : StructByMemberInternalModule
    {
        public StructByMemberL1 oL1 => new StructByMemberL1()
        {
            L1OptionalValue = internalL1.L1OptionalValue,
            L1RequiredValue = internalL1.L1RequiredValue,
            L2 = new[]
            {
                internalL1.L2[0],
                new StructByMemberL2()
                {
                    L2OptionalValue = internalL1.L2[1].L2OptionalValue,
                    L3 = internalL1.L2[1].L3,
                    L3Tuple = internalL1.L2[1].L3Tuple
                }
            }
        };
    }

    public class StructByMemberInternalL3TupleMembersModule : StructByMemberInternalModule
    {
        public StructByMemberL1 oL1 => new StructByMemberL1()
        {
            L1OptionalValue = internalL1.L1OptionalValue,
            L1RequiredValue = internalL1.L1RequiredValue,
            L2 = new[]
            {
                internalL1.L2[0],
                new StructByMemberL2()
                {
                    L2OptionalValue = internalL1.L2[1].L2OptionalValue,
                    L3 =
                    {
                        L3OptionalValue = internalL1.L2[1].L3.L3OptionalValue,
                        L3RequiredValue = internalL1.L2[1].L3.L3RequiredValue
                    },
                    L3Tuple = (internalL1.L2[1].L3Tuple.Item1, internalL1.L2[1].L3Tuple.Item2)
                }
            }
        };
    }

    public class StructByMemberInternalL3MembersModule : StructByMemberInternalModule
    {
        public StructByMemberL1 oL1 => new StructByMemberL1()
        {
            L1OptionalValue = internalL1.L1OptionalValue,
            L1RequiredValue = internalL1.L1RequiredValue,
            L2 = new[]
            {
                internalL1.L2[0],
                new StructByMemberL2()
                {
                    L2OptionalValue = internalL1.L2[1].L2OptionalValue,
                    L3 =
                    {
                        L3OptionalValue = internalL1.L2[1].L3.L3OptionalValue,
                        L3RequiredValue = internalL1.L2[1].L3.L3RequiredValue
                    },
                    L3Tuple =
                    (
                        internalL1.L2[1].L3Tuple.Item1,
                        new StructByMemberL3()
                        {
                            L3OptionalValue = internalL1.L2[1].L3Tuple.Item2.L3OptionalValue,
                            L3RequiredValue = internalL1.L2[1].L3Tuple.Item2.L3RequiredValue
                        }
                    )
                }
            }
        };
    }
}
