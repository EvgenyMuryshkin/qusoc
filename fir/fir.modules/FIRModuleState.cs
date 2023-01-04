using Quokka.RTL;
using System.Linq;

namespace fir.modules
{
    public class FIRModuleState
    {
        public FIRModuleState() { }
        public FIRModuleState(FIRParams config)
        {
            set_do = new RTLBitArray().Resized(4);
            set_coef_mask = new RTLBitArray().Resized(9);
            set_data_mask = new RTLBitArray().Resized(10);
            set_do_mux = Enumerable.Range(0, config.Order).Select(_ => new RTLBitArray().Resized(4)).ToArray();
            coeff = new t_coeff(config.Order);
            main = new t_main(config.Order);
            mult_reset = new t_mult_reset(config.Order);
            filo = new t_filo(config.Order);
            dsp48 = new t_dsp48(config.Order);
            fir = new t_fir(config.Order);
            //tr = new t_tr(config.Order);
            ob_iq = new t_iq24();
        }

        public RTLBitArray set_do;
        public RTLBitArray[] set_do_mux;
        public RTLBitArray set_coef_mask;
        public RTLBitArray set_data_mask;

        // coefficients write logic
        public t_coeff coeff;
        // main logic
        public t_main main;
        // mult logic
        public t_mult_reset mult_reset;
        // filo logic
        public t_filo filo;
        // dsp48
        public t_dsp48 dsp48;
        // fir
        public t_fir fir;
        // transparent
        //public t_tr tr;

        // output buffers
        public bool ob_coef_rdy;
        public bool ob_iq_v;
        public t_iq24 ob_iq;
    }
}
