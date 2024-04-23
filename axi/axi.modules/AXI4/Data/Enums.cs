using System;
using System.Collections.Generic;
using System.Text;

namespace axi.modules
{
    public enum axiResp : byte
    {
        OKAY,
        EXOKAY,
        SLVERR,
        DECERR
    }

    public enum axiSize : byte
    {
        B1,
        B2,
        B4,
        B8,
        B16,
        B32,
        B64,
        B128
    }

    public enum axiBurst : byte
    {
        FIXED,
        INCR,
        WRAP,
        Reserved
    }

    public enum axiCache : byte
    {
        DeviceNonBufferable = 0,
        Bufferable = 1,
        Modifiable = 2,
        ReadAllocate = 4,
        WriteAllocate = 8
    }

    public enum axiLock : byte
    {
        Normal = 0,
        Exclusive = 1,
        [Obsolete("AXI4 removes this mode")]
        Locked = 2,
        [Obsolete("AXI4 removes this mode")]
        Reserverd = 3
    }

    public enum axiProt : byte
    {
        UnprivilegedSecureData = 0,
        Privileged = 1,
        NonSecure = 2,
        Instructions = 4,
        UnprivilegedNonSecureData = 2,
    }

    public enum axiQOS : byte
    {
        Normal = 0,
        Highest = 15
    }
}
