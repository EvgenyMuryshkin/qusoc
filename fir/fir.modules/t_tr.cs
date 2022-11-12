namespace fir.modules
{
    public struct t_tr
    {
        public t_tr(int order)
        {
            tr_fir_mreg = new t_iq25();
            tr_fir_preg = new t_iq25();
            tr_fir_result = new t_iq25();
        }

        public t_iq25 tr_fir_mreg;
        public t_iq25 tr_fir_preg;
        public t_iq25 tr_fir_result;
    }
}
