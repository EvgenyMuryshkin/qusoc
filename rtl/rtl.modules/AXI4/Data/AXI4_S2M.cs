﻿namespace RTL.Modules
{
    public class AXI4_S2M
    {
        public AXI4_S2M() { }
        public AXI4_S2M(axiSize size)
        {
            AR = new AXI4_S_AR();
            R = new AXI4_S_R(size);
            AW = new AXI4_S_AW();
            W = new AXI4_S_W();
            B = new AXI4_S_B();
        }

        public AXI4_S_AR AR;
        public AXI4_S_AW AW;
        public AXI4_S_B B;
        public AXI4_S_R R;
        public AXI4_S_W W;
    }
}