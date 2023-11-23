using Quokka.RTL;
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

        [MemberIndex]
        public byte RID;

        [MemberIndex]
        public byte[] RDATA;

        [MemberIndex]
        public axiResp RRESP;

        [MemberIndex]
        public bool RLAST = true;

        [MemberIndex]
        public byte RUSER;

        [MemberIndex]
        public bool RVALID;
    }
}
