using Quokka.RTL;

namespace axi.modules
{
    public class AXI4_S2M_R
    {
        public AXI4_S2M_R() : this(axiSize.B4) { }
        public AXI4_S2M_R(axiSize size)
        {
            AR = new AXI4_S_AR();
            R = new AXI4_S_R(size);
        }

        [MemberIndex]
        public AXI4_S_AR AR;

        [MemberIndex]
        public AXI4_S_R R;
    }

    public class AXI4_S2M_W
    {
        public AXI4_S2M_W() : this(axiSize.B4) { }
        public AXI4_S2M_W(axiSize size)
        {
            AW = new AXI4_S_AW();
            W = new AXI4_S_W();
            B = new AXI4_S_B();
        }

        [MemberIndex]
        public AXI4_S_AW AW;

        [MemberIndex]
        public AXI4_S_B B;

        [MemberIndex]
        public AXI4_S_W W;
    }

    public class AXI4_S2M
    {
        public AXI4_S2M() : this(axiSize.B4) { }
        public AXI4_S2M(axiSize size)
        {
            R = new AXI4_S2M_R(size);
            W = new AXI4_S2M_W(size);
        }

        [MemberIndex]
        public AXI4_S2M_R R;

        [MemberIndex]
        public AXI4_S2M_W W;
    }
}
