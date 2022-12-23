using System.Linq;

namespace fir.modules
{
    public struct t_fir
    {
        public t_fir(int order)
        {
            fir_areg1 = Enumerable.Range(0, order).Select(_ => new t_iq25()).ToArray();
            fir_areg2 = Enumerable.Range(0, order).Select(_ => new t_iq25()).ToArray();
            fir_adreg = Enumerable.Range(0, order).Select(_ => new t_iq25()).ToArray();
            fir_breg = Enumerable.Range(0, order).Select(_ => new t_iq18()).ToArray();
            fir_mreg = Enumerable.Range(0, order).Select(_ => new t_iq43()).ToArray();
            fir_preg = Enumerable.Range(0, order).Select(_ => new t_iq48()).ToArray();
            // TODO: why 10?
            //fir_result = Enumerable.Range(0, 10).Select(_ => new t_iq24()).ToArray();
        }

        public t_iq25[] fir_areg1;
        public t_iq25[] fir_areg2;
        public t_iq25[] fir_adreg;
        public t_iq18[] fir_breg;
        public t_iq43[] fir_mreg;
        public t_iq48[] fir_preg;
        //public t_iq24[] fir_result;
    }
}
