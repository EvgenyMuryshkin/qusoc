using Quokka.RTL;

namespace axi.modules
{
    public class AXI4_M_W
    {
        public AXI4_M_W() { }
        public AXI4_M_W(axiSize size)
        {
            WDATA = new byte[AXI4Tools.Bytes(size)];
            WSTRB = new RTLBitArray().Resized(AXI4Tools.Bytes(size));
        }

        [MemberIndex]
        public byte WID = 0;

        [MemberIndex]
        public byte[] WDATA;

        [MemberIndex]
        public RTLBitArray WSTRB;

        [MemberIndex]
        public bool WLAST = true;

        [MemberIndex]
        public byte WUSER = 0;

        [MemberIndex]
        public bool WVALID;
    }
}
