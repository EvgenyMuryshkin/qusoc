using Quokka.RTL;

namespace axi.modules
{
    public class AXI4_S_B
    {
        [MemberIndex]
        public byte BID;

        [MemberIndex]
        public axiResp BRESP;

        [MemberIndex]
        public byte BUSER;

        [MemberIndex]
        public bool BVALID;
    }
}
