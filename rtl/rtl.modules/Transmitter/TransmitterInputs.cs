using Quokka.RTL;

namespace RTL.Modules
{
    // Example module

    /// <summary>
    /// Inputs declarations, names, types and sizes;
    /// </summary>
    public class TransmitterInputs
    {
        public TransmitterInputs() { }

        public bool iTrigger = false;
        public bool iAck = false;
        public RTLBitArray iData = byte.MinValue;
    }
}
