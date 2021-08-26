namespace RTL.Modules
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

        public byte ARID = 0;
        public uint ARADDR;
        public byte ARLEN = 1;
        public axiSize ARSIZE = axiSize.B4;
        public axiBurst ARBURST = axiBurst.INCR;
        public axiLock ARLOCK = axiLock.Normal;
        public axiCache ARCACHE = axiCache.DeviceNonBufferable;
        public axiProt ARPROT = axiProt.UnprivilegedNonSecureData;
        public axiQOS ARQOS = axiQOS.Normal;
        public byte ARREGION = 0;
        public byte ARUSER = 0;
        public bool ARVALID;
    }
}
