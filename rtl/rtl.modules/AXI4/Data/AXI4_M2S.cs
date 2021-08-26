namespace RTL.Modules
{
    public class AXI4_M2S
    {
        public AXI4_M2S() { }
        public AXI4_M2S(axiSize size)
        {
            AR = new AXI4_M_AR(size);
            R = new AXI4_M_R();
            AW = new AXI4_M_AW(size);
            W = new AXI4_M_W(size);
            B = new AXI4_M_B();
        }

        public AXI4_M_AR AR;
        public AXI4_M_R R;
        public AXI4_M_AW AW;
        public AXI4_M_W W;
        public AXI4_M_B B;
    }
}
