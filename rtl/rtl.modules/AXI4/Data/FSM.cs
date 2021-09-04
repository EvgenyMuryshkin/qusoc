using System;
using System.Collections.Generic;
using System.Text;

namespace RTL.Modules
{
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

    public enum axiMasterFSM
    {
        RESET,
        Idle,
        RWAIT,
        RACK,
        WWAIT,
        WACK,
    }
}
