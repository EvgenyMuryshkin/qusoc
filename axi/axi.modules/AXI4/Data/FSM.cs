using System;
using System.Collections.Generic;
using System.Text;

namespace axi.modules
{
    /*
    public enum axiSlaveWriteFSM
    {
        RESET,
        Idle,
        AWREADY,
        WREADY,
        AWREADY_WREADY,
        WWAIT,
        BVALID
    }
    */

    public enum axiMasterReadFSM
    {
        RESET,
        Idle,
        OK
    }

    public enum axiMasterWriteFSM
    {
        RESET,
        Idle,
        OK
    }

    public enum axiSlaveReadFSM
    {
        RESET,
        Idle,
        Ack
    }

    public enum axiSlaveWriteFSM
    {
        RESET,
        Idle,
        Ack
    }
}
