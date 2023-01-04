using Quokka.RTL;

namespace fir.modules
{
    public class FIRModuleInputs
    {
        public FIRModuleInputs() { }
        /*        public FIRModuleInputs(FIRParams firParams)
        {
            iCOEFF = new RTLBitArray().Resized(firParams.CoeffSize);
            iDO = new RTLBitArray().Resized(firParams.DOSize);
            iIQ = new t_iq16();
        }
        */
        public bool iCOEF_V;
        public RTLBitArray iCOEFF = new RTLBitArray().Resized(16);
        public RTLBitArray iDO = new RTLBitArray().Resized(4);
        public bool iIQ_V;
        public t_iq16 iIQ = new t_iq16();
    }
}
