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

        public bool Trigger = false;
        public bool Ack = false;
        public RTLBitArray Data = byte.MinValue;
    }
}
