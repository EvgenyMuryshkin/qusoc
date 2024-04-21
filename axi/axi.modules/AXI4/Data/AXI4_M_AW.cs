using Quokka.RTL;

namespace RTL.Modules
{
    /// <summary>
    /// Write address
    /// </summary>
    public class AXI4_M_AW
    {
        public AXI4_M_AW() { }
        public AXI4_M_AW(axiSize size)
        {
            AWSIZE = size;
        }

        [MemberIndex]
        public byte AWID = 0;

        [MemberIndex]
        public uint AWADDR;

        [MemberIndex]
        public byte AWLEN = 1;

        [MemberIndex]
        public axiSize AWSIZE = axiSize.B4;

        [MemberIndex]
        public axiBurst AWBURST = axiBurst.INCR;

        [MemberIndex]
        public axiLock AWLOCK = axiLock.Normal;

        [MemberIndex]
        public axiCache AWCACHE = axiCache.DeviceNonBufferable;

        [MemberIndex]
        public axiProt AWPROT = axiProt.UnprivilegedNonSecureData;

        [MemberIndex]
        public axiQOS AWQOS = axiQOS.Normal;

        [MemberIndex]
        public byte AWREGION = 0;

        [MemberIndex]
        public byte AWUSER = 0;

        [MemberIndex]
        public bool AWVALID;
    }
}
