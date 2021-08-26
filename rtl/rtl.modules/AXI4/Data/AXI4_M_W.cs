using Quokka.RTL;

namespace RTL.Modules
{
    public class AXI4_M_W
    {
        public AXI4_M_W() { }
        public AXI4_M_W(axiSize size)
        {
            WDATA = new byte[AXI4Tools.Bytes(size)];
            WSTRB = new RTLBitArray().Resized(AXI4Tools.Bytes(size));
        }

        public byte WID;
        public byte[] WDATA;
        public RTLBitArray WSTRB;
        public bool WLAST;
        public byte WUSER;
        public bool WVALID;
    }
}
