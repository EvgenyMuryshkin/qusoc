using System.Linq;

namespace fir.modules
{
    public struct t_dsp48
    {
        public t_dsp48(int order)
        {
            //dsp48_opmode = Enumerable.Range(0, order).Select(_ => new t_iq7()).ToArray();
            //dsp48_b = Enumerable.Range(0, order).Select(_ => new t_iq18()).ToArray();
            //dsp48_d = Enumerable.Range(0, order).Select(_ => new t_iq25()).ToArray();
            //dsp48_a = Enumerable.Range(0, order).Select(_ => new t_iq30()).ToArray();

            //dsp48_pcin = Enumerable.Range(0, order).Select(_ => new t_iq48()).ToArray();
            //dsp48_p = Enumerable.Range(0, order).Select(_ => new t_iq48()).ToArray();
            //dsp48_pcout = Enumerable.Range(0, order).Select(_ => new t_iq48()).ToArray();

            // TODO: why 10?
            dsp48_result = Enumerable.Range(0, 10).Select(_ => new t_iq24()).ToArray();
            
            //dsp48_srl_out = new t_iq16();
            //dsp48_srl_out_p = new t_iq16();
            //dsp48_srl_out_p1 = new t_iq16();
            dsp48_srl = Enumerable.Range(0, order * 2 - 1).Select(_ => new t_iq16()).ToArray();
        }

        //public t_iq7[] dsp48_opmode;
        //public t_iq18[] dsp48_b;
        //public t_iq25[] dsp48_d;
        //public t_iq30[] dsp48_a;

        //public t_iq48[] dsp48_p;
        //public t_iq48[] dsp48_pcin;
        //public t_iq48[] dsp48_pcout;

        public t_iq24[] dsp48_result;

        public t_iq16[] dsp48_srl;
        //public t_iq16 dsp48_srl_out_p;
        //public t_iq16 dsp48_srl_out_p1;
        //public t_iq16 dsp48_srl_out;
    }
}
