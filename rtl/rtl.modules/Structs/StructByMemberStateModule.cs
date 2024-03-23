using Quokka.RTL;

namespace RTL.Modules
{
    public class StructByMemberModuleState
    {
        public StructByMemberL1 sL1 = new StructByMemberL1();
    }

    public abstract class StructByMemberStateModule : RTLSynchronousModule<StructByMemberModuleInputs, StructByMemberModuleState>
    {
        protected override void OnStage()
        {
            NextState.sL1 = Inputs.iL1;
        }
    }

    public class StructByMemberStateDirectModule : StructByMemberStateModule
    {
        public StructByMemberL1 oL1 => State.sL1;

        protected override void OnStage()
        {
            NextState.sL1 = Inputs.iL1;
        }
    }

    public class StructByMemberStateL1MembersModule : StructByMemberStateModule
    {
        public StructByMemberL1 oL1 => new StructByMemberL1()
        {
            L1OptionalValue = State.sL1.L1OptionalValue,
            L1RequiredValue = State.sL1.L1RequiredValue,
            L2 = State.sL1.L2
        };
    }

    public class StructByMemberStateL2MembersModule : StructByMemberStateModule
    {
        public StructByMemberL1 oL1 => new StructByMemberL1()
        {
            L1OptionalValue = State.sL1.L1OptionalValue,
            L1RequiredValue = State.sL1.L1RequiredValue,
            L2 = new[]
            {
                State.sL1.L2[0],
                new StructByMemberL2()
                {
                    L2OptionalValue = State.sL1.L2[1].L2OptionalValue,
                    L3 = State.sL1.L2[1].L3,
                    L3Tuple = State.sL1.L2[1].L3Tuple
                }
            }
        };
    }

    public class StructByMemberStateL3TupleMembersModule : StructByMemberStateModule
    {
        public StructByMemberL1 oL1 => new StructByMemberL1()
        {
            L1OptionalValue = State.sL1.L1OptionalValue,
            L1RequiredValue = State.sL1.L1RequiredValue,
            L2 = new[]
            {
                State.sL1.L2[0],
                new StructByMemberL2()
                {
                    L2OptionalValue = State.sL1.L2[1].L2OptionalValue,
                    L3 =
                    {
                        L3OptionalValue = State.sL1.L2[1].L3.L3OptionalValue,
                        L3RequiredValue = State.sL1.L2[1].L3.L3RequiredValue
                    },
                    L3Tuple = (State.sL1.L2[1].L3Tuple.Item1, State.sL1.L2[1].L3Tuple.Item2)
                }
            }
        };
    }

    public class StructByMemberStateL3MembersModule : StructByMemberStateModule
    {
        public StructByMemberL1 oL1 => new StructByMemberL1()
        {
            L1OptionalValue = State.sL1.L1OptionalValue,
            L1RequiredValue = State.sL1.L1RequiredValue,
            L2 = new[]
            {
                State.sL1.L2[0],
                new StructByMemberL2()
                {
                    L2OptionalValue = State.sL1.L2[1].L2OptionalValue,
                    L3 =
                    {
                        L3OptionalValue = State.sL1.L2[1].L3.L3OptionalValue,
                        L3RequiredValue = State.sL1.L2[1].L3.L3RequiredValue
                    },
                    L3Tuple =
                    (
                        State.sL1.L2[1].L3Tuple.Item1,
                        new StructByMemberL3()
                        {
                            L3OptionalValue = State.sL1.L2[1].L3Tuple.Item2.L3OptionalValue,
                            L3RequiredValue = State.sL1.L2[1].L3Tuple.Item2.L3RequiredValue
                        }
                    )
                }
            }
        };
    }
}
