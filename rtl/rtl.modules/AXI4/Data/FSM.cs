using System;
using System.Collections.Generic;
using System.Text;

namespace RTL.Modules
{
    public enum axiMasterFSM
    {
        RESET
    }

    public enum axiSlaveWriteFSM
    {
        RESET,
        Idle,
        OK
    }

    public enum axiSlaveReadFSM
    {
        RESET,
        Idle,
        OK
    }
}
