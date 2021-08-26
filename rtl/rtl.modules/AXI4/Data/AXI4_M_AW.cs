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

        public byte AWID = 0;
        public uint AWADDR;
        public byte AWLEN = 1;
        public axiSize AWSIZE = axiSize.B4;
        public axiBurst AWBURST = axiBurst.INCR;
        public axiLock AWLOCK = axiLock.Normal;
        public axiCache AWCACHE = axiCache.DeviceNonBufferable;
        public axiProt AWPROT = axiProt.UnprivilegedNonSecureData;
        public axiQOS AWQOS = axiQOS.Normal;
        public byte AWREGION = 0;
        public byte AWUSER = 0;
        public bool AWVALID;
    }
}
