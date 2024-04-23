using Quokka.RTL;

namespace axi.modules
{
    /// <summary>
    /// Read address
    /// </summary>
    public class AXI4_M_AR
    {
        public AXI4_M_AR() { }

        public AXI4_M_AR(axiSize size)
        {
            ARSIZE = size;
        }

        [MemberIndex]
        public byte ARID = 0;

        [MemberIndex]
        public uint ARADDR;

        [MemberIndex]
        public byte ARLEN = 1;

        [MemberIndex]
        public axiSize ARSIZE = axiSize.B4;

        [MemberIndex]
        public axiBurst ARBURST = axiBurst.INCR;

        [MemberIndex]
        public axiLock ARLOCK = axiLock.Normal;

        [MemberIndex]
        public axiCache ARCACHE = axiCache.DeviceNonBufferable;

        [MemberIndex]
        public axiProt ARPROT = axiProt.UnprivilegedNonSecureData;

        [MemberIndex]
        public axiQOS ARQOS = axiQOS.Normal;

        [MemberIndex]
        public byte ARREGION = 0;

        [MemberIndex]
        public byte ARUSER = 0;

        [MemberIndex]
        public bool ARVALID;
    }
}
