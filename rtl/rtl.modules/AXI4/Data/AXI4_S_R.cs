using System;
using System.Collections.Generic;
using System.Text;

namespace RTL.Modules
{
    public class AXI4_S_R
    {
        public AXI4_S_R() { }
        public AXI4_S_R(axiSize size)
        {
            RDATA = new byte[AXI4Tools.Bytes(size)];
        }

        public byte RID;
        public byte[] RDATA;
        public axiResp RRESP;
        public bool RLAST = true;
        public byte RUSER;
        public bool RVALID;
    }
}
