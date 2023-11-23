using Quokka.RTL;

namespace RTL.Modules
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
