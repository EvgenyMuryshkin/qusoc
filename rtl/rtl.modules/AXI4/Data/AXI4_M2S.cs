using Quokka.RTL;

namespace RTL.Modules
{
    public class AXI4_M2S_R
    {
        public AXI4_M2S_R() : this(axiSize.B4) { }
        public AXI4_M2S_R(axiSize size)
        {
            AR = new AXI4_M_AR(size);
            R = new AXI4_M_R();
        }

        [MemberIndex]
        public AXI4_M_AR AR;

        [MemberIndex]
        public AXI4_M_R R;
    }

    public class AXI4_M2S_W
    {
        public AXI4_M2S_W() : this(axiSize.B4) { }
        public AXI4_M2S_W(axiSize size)
        {
            AW = new AXI4_M_AW(size);
            W = new AXI4_M_W(size);
            B = new AXI4_M_B();
        }

        [MemberIndex]
        public AXI4_M_AW AW;

        [MemberIndex]
        public AXI4_M_W W;

        [MemberIndex]
        public AXI4_M_B B;
    }

    public class AXI4_M2S
    {
        public AXI4_M2S() : this(axiSize.B4) { }
        public AXI4_M2S(axiSize size)
        {
            AR = new AXI4_M_AR(size);
            R = new AXI4_M_R();
            AW = new AXI4_M_AW(size);
            W = new AXI4_M_W(size);
            B = new AXI4_M_B();
        }

        [MemberIndex]
        public AXI4_M_AR AR;

        [MemberIndex]
        public AXI4_M_R R;

        [MemberIndex]
        public AXI4_M_AW AW;

        [MemberIndex]
        public AXI4_M_W W;

        [MemberIndex]
        public AXI4_M_B B;
    }
}
