using Quokka.RTL;
using Quokka.RTL.Tools;
using System;
using System.Linq;

namespace fir.modules
{
    public class FIRModule : RTLSynchronousModule<FIRModuleInputs, FIRModuleState>
    {
        public FIRModule() { }
        //public override RTLModuleAnalizers Analizers => new RTLModuleAnalizers() { SignalsUsage = true };
        public FIRModule(FIRParams firParams)
        {
            this.firParams = firParams;

            //InitInputs(new FIRModuleInputs(firParams));
            InitState(new FIRModuleState(firParams));
            //stages = Enumerable.Range(0, firParams.Order).Select(_ => new FIRStageModule(firParams)).ToArray();

            u_ram_coef = Enumerable.Range(0, firParams.Order).Select(_ => new FIRDecimatorRAM(2, c_nofc)).ToArray();
            u_ram_srls_i = Enumerable.Range(0, firParams.Order).Select(_ => new FIRDecimatorRAM(2, c_srls_length)).ToArray();
            u_ram_srls_q = Enumerable.Range(0, firParams.Order).Select(_ => new FIRDecimatorRAM(2, c_srls_length)).ToArray();
            u_ram_filo_i = new FIRDecimatorRAM(1, 512);
            u_ram_filo_q = new FIRDecimatorRAM(1, 512);
            
            c_coef_num_array = FIRTools.f_get_coef_num_array(firParams.Order);
            //c_coef_mask_array = FIRTools.f_get_coef_mask();
            //c_data_mask_array = FIRTools.f_get_data_mask();
            //c_ram_addr_hight_msb = FIRTools.log2(firParams.Order);
            c_out_lsb = FIRTools.log2(firParams.Order) + 2;
            
            ramd_din = Enumerable.Range(0, firParams.Order).Select(_ => new t_iq16()).ToArray();
            ramd_dout = Enumerable.Range(0, firParams.Order).Select(_ => new t_iq16()).ToArray();
            
            u_dsp48_i = Enumerable.Range(0, firParams.Order).Select(_ => new FIRDSPWrapperModule()).ToArray();
            u_dsp48_q = Enumerable.Range(0, firParams.Order).Select(_ => new FIRDSPWrapperModule()).ToArray();

            dsp48_p = Enumerable.Range(0, firParams.Order).Select(_ => new t_iq48()).ToArray();
            dsp48_pcout = Enumerable.Range(0, firParams.Order).Select(_ => new t_iq48()).ToArray();
            dsp48_opmode = Enumerable.Range(0, firParams.Order).Select(_ => new t_iq7()).ToArray();
            dsp48_b = Enumerable.Range(0, firParams.Order).Select(_ => new t_iq18()).ToArray();
            dsp48_d = Enumerable.Range(0, firParams.Order).Select(_ => new t_iq25()).ToArray();
            dsp48_a = Enumerable.Range(0, firParams.Order).Select(_ => new t_iq30()).ToArray();
            dsp48_pcin = Enumerable.Range(0, firParams.Order).Select(_ => new t_iq48()).ToArray();
        }

        // constants declaration
        internal readonly FIRParams firParams;
        private readonly int[] c_coef_num_array;
        private readonly RTLBitArray[] c_coef_mask_array = FIRTools.f_get_coef_mask();
        private readonly RTLBitArray[] c_data_mask_array = FIRTools.f_get_data_mask();
        private readonly int c_nofc = 512;
        private readonly int c_srls_length = 1024;
        //private readonly int c_ram_addr_hight_msb;
        //private readonly int c_dl_accum = 9;
        private readonly int c_out_lsb;
        
        // input buffers
        bool ib_coef_v => Inputs.iCOEF_V;
        RTLBitArray ib_coef => Inputs.iCOEFF;
        RTLBitArray ib_do => Inputs.iDO;
        bool ib_iq_v => Inputs.iIQ_V;
        t_iq16 ib_iq => Inputs.iIQ;

        // current settings

        //FIRStageModule[] stages;
        FIRDecimatorRAM[] u_ram_coef;
        FIRDecimatorRAM[] u_ram_srls_i;
        FIRDecimatorRAM[] u_ram_srls_q;
        FIRDecimatorRAM u_ram_filo_i;
        FIRDecimatorRAM u_ram_filo_q;

        //public RTLBitArray o_u_ram_coef_DOUT => ramc_dout[Inputs.iCOEFF_RD_IDX];  
        internal RTLBitArray[] ramc_dout => u_ram_coef.Select(r => r.DOUT).ToArray();
        internal t_iq16[] ramd_din;
        internal t_iq16[] ramd_dout;
        //public RTLBitArray o_dsp_result => u_ram_coef[3].DOUT;// State.dsp48.dsp48_result[9];// u_ram_srls_i.Select(i => i.DOUT).ToArray();
        internal t_iq16 ramf_din => State.set_do == false
            ? State.dsp48.dsp48_srl[firParams.Order * 2 - 3]
            : ramd_dout[firParams.Order - 2];
        //t_iq18[] i_dsp => State.dsp48.dsp48_b;*/
        internal t_iq16 ramf_dout => new t_iq16 { i = u_ram_filo_i.DOUT, q = u_ram_filo_q.DOUT };
        FIRDSPWrapperModule[] u_dsp48_i;
        FIRDSPWrapperModule[] u_dsp48_q;

        // output
        //public RTLBitArray oCOEF_NUM => new RTLBitArray(2 * c_coef_num_array[0]).Resized(16);
        //public RTLBitArray oCOEF_CNT => State.coeff.coef_ram_cnt;
        public bool oCOEF_RDY => State.ob_coef_rdy;
        public bool oIQ_V => State.ob_iq_v;
        public t_iq oIQ => State.ob_iq;
        //public bool oIQi => State.ob_iq.i[Inputs.iIQAddr];
        //public bool oIQq => State.ob_iq.q[Inputs.iIQAddr];
        //public RTLBitArray[] oDSP_Q => State.dsp48.dsp48_result.Select(d => d.q).ToArray();

        RTLBitArray sxt(RTLBitArray source, int size) => source.Signed().Resized(size).Unsigned();

        protected override void OnSchedule(Func<FIRModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            // GEN_ramc
            foreach (var a in range(firParams.Order))
            {
                u_ram_coef[a].Schedule(() => new FIRDecimatorRAMInputs()
                {
                    CE = true,
                    WR = State.coeff.coef_ram_wr[a],
                    WR_ADDR = State.coeff.coef_ram_wr_addr[a],
                    DIN = State.coeff.coef_ram_wr_data[a],
                    RD = ib_iq_v,
                    RD_ADDR = State.main.main_c_rd_addr[a]
                });
            }

            // GEN_ramd
            foreach (var a in range(firParams.Order))
            {
                ramd_dout[a].i = u_ram_srls_i[a].DOUT;
                ramd_dout[a].q = u_ram_srls_q[a].DOUT;
            }

            ramd_din[0] = ib_iq;
            for (var a = 1; a < firParams.Order; a++)
            {
                ramd_din[a] = ramd_dout[a - 1];
            }

            foreach (var a in range(firParams.Order))
            {
                u_ram_srls_i[a].Schedule(() => new FIRDecimatorRAMInputs()
                {
                    CE = true,
                    WR = ib_iq_v,
                    WR_ADDR = State.main.main_d_addr[a],
                    DIN = ramd_din[a].i,
                    RD = ib_iq_v,
                    RD_ADDR = State.main.main_d_addr[a]
                });
            }

            foreach (var a in range(firParams.Order))
            {
                u_ram_srls_q[a].Schedule(() => new FIRDecimatorRAMInputs()
                {
                    CE = true,
                    WR = ib_iq_v,
                    WR_ADDR = State.main.main_d_addr[a],
                    DIN = ramd_din[a].q,
                    RD = ib_iq_v,
                    RD_ADDR = State.main.main_d_addr[a]
                });
            }

            // filo

            u_ram_filo_i.Schedule(() => new FIRDecimatorRAMInputs()
            {
                CE = true,
                WR = ib_iq_v,
                WR_ADDR = State.filo.filo_addr_p,
                DIN = ramf_din.i,
                RD = ib_iq_v,
                RD_ADDR = State.filo.filo_addr_p
            });

            u_ram_filo_q.Schedule(() => new FIRDecimatorRAMInputs()
            {
                CE = true,
                WR = ib_iq_v,
                WR_ADDR = State.filo.filo_addr_p,
                DIN = ramf_din.q,
                RD = ib_iq_v,
                RD_ADDR = State.filo.filo_addr_p
            });

            // DSP
            foreach (var i in range(firParams.Order))
            {
                u_dsp48_i[i].Schedule(() => new FIRDSPWrapperModuleInputs()
                {
                    CE = ib_iq_v,
                    RST = false,
                    A = dsp48_a[i].i,
                    B = dsp48_b[i].i,
                    D = dsp48_d[i].i,
                    PCIN = dsp48_pcin[i].i,
                    OPMODE = dsp48_opmode[i].i[6, 4]                    
                });

                u_dsp48_q[i].Schedule(() => new FIRDSPWrapperModuleInputs()
                {
                    CE = ib_iq_v,
                    RST = false,
                    A = dsp48_a[i].q,
                    B = dsp48_b[i].q,
                    D = dsp48_d[i].q,
                    PCIN = dsp48_pcin[i].q,
                    OPMODE = dsp48_opmode[i].q[6, 4]
                });
            }

            // I channel
            dsp48_a[0].i = sxt(ib_iq.i, 30);
            dsp48_opmode[0].i = State.mult_reset.mult_reset_dsp[0] ? new RTLBitArray(RTLBitArrayInitType.MSB, "0000000") : new RTLBitArray(RTLBitArrayInitType.MSB, "0100000");
            dsp48_d[0].i = sxt(State.filo.fir_dreg[0].i, 25);
            dsp48_b[0].i = sxt(ramc_dout[0], 18);

            for (var a = 1; a < firParams.Order; a++)
            {
                dsp48_a[a].i = State.set_do_mux[a] != 0 ? sxt(ramd_dout[a - 1].i, 30) : sxt(State.dsp48.dsp48_srl[a * 2 - 1].i, 30);
                dsp48_opmode[a].i = State.mult_reset.mult_reset_dsp[a] ? new RTLBitArray(RTLBitArrayInitType.MSB, "0010000") : new RTLBitArray(RTLBitArrayInitType.MSB, "0100000");
                dsp48_d[a].i = sxt(State.filo.fir_dreg[a].i, 25);
                dsp48_b[a].i = sxt(ramc_dout[a], 18);
                dsp48_pcin[a].i = dsp48_pcout[a - 1].i;
            }

            // Q channel
            dsp48_a[0].q = sxt(ib_iq.q, 30);
            dsp48_opmode[0].q = State.mult_reset.mult_reset_dsp[0] ? new RTLBitArray(RTLBitArrayInitType.MSB, "0000000") : new RTLBitArray(RTLBitArrayInitType.MSB, "0100000");
            dsp48_d[0].q = sxt(State.filo.fir_dreg[0].q, 25);
            dsp48_b[0].q = sxt(ramc_dout[0], 18);

            for (var a = 1; a < firParams.Order; a++)
            {
                dsp48_a[a].q = State.set_do_mux[a] != 0 ? sxt(ramd_dout[a - 1].q, 30) : sxt(State.dsp48.dsp48_srl[a * 2 - 1].q, 30);
                dsp48_opmode[a].q = State.mult_reset.mult_reset_dsp[a] ? new RTLBitArray(RTLBitArrayInitType.MSB, "0010000") : new RTLBitArray(RTLBitArrayInitType.MSB, "0100000");
                dsp48_d[a].q = sxt(State.filo.fir_dreg[a].q, 25);
                dsp48_b[a].q = sxt(ramc_dout[a], 18);
                dsp48_pcin[a].q = dsp48_pcout[a - 1].q;
            }

            // P, PCOUT
            for (var a = 0; a < firParams.Order; a++)
            {
                dsp48_p[a].i = u_dsp48_i[a].P;
                dsp48_pcout[a].i = u_dsp48_i[a].PCOUT;
                dsp48_p[a].q = u_dsp48_q[a].P;
                dsp48_pcout[a].q = u_dsp48_q[a].PCOUT;
            }
        }

        internal t_iq48[] dsp48_p;
        internal t_iq48[] dsp48_pcout;
        internal t_iq7[] dsp48_opmode;
        internal t_iq18[] dsp48_b;
        internal t_iq25[] dsp48_d;
        internal t_iq30[] dsp48_a;
        internal t_iq48[] dsp48_pcin;
        /// <summary>
        /// process, current settings
        /// </summary>
        void CurrentSetting()
        {
            NextState.set_do = ib_do;
            NextState.set_coef_mask = c_coef_mask_array[ib_do];
            NextState.set_data_mask = c_data_mask_array[ib_do];
            
            for (var a = 0; a < firParams.Order; a++)
            {
                NextState.set_do_mux[a] = ib_do;
            }
        }

        /// <summary>
        /// process, coefficient write logic
        /// </summary>
        void Coefficients()
        {
            if (ib_coef_v)
            {
                if (State.coeff.coef_wr_cnt_cell == State.set_coef_mask)
                {
                    NextState.coeff.coef_wr_cnt_cell = 0;
                    NextState.coeff.coef_ram_cnt = State.coeff.coef_wr_cnt_ram.Resized(16) + 1;
                    if (State.coeff.coef_wr_cnt_ram == 2 * firParams.Order - 1)
                    {
                        NextState.coeff.coef_wr_cnt_ram = 0;
                    }
                    else
                    {
                        NextState.coeff.coef_wr_cnt_ram = State.coeff.coef_wr_cnt_ram + 1;
                    }
                }
                else
                {
                    NextState.coeff.coef_wr_cnt_cell = State.coeff.coef_wr_cnt_cell + 1;
                }
            }

            for (var a = 0; a < firParams.Order; a++)
            {
                if (State.coeff.coef_wr_cnt_ram == a)
                {
                    NextState.coeff.coef_ram_wr[a] = ib_coef_v;
                    NextState.coeff.coef_ram_wr_addr[a] = State.coeff.coef_wr_cnt_cell;
                    NextState.coeff.coef_ram_wr_data[a] = ib_coef;
                }
                else
                {
                    NextState.coeff.coef_ram_wr[a] = false;//dbg
                    NextState.coeff.coef_ram_wr_addr[a] = 0;
                    NextState.coeff.coef_ram_wr_data[a] = 0;
                }
            }

            if (State.coeff.coef_ram_cnt == 2 * c_coef_num_array[0])
            {
                NextState.ob_coef_rdy = true;
            }
            else
            {
                NextState.ob_coef_rdy = false;
            }
        }

        //RTLBitArray ob_coef_cnt => State.coeff.coef_ram_cnt;
        void MainLogic()
        {
            if (ib_iq_v)
            {
                NextState.main.main_c_cnt = State.main.main_c_cnt - 1;
                NextState.main.main_c_cnt_masked = State.main.main_c_cnt & State.set_coef_mask;
                NextState.main.main_c_rd_addr_cmn = State.main.main_c_cnt_masked;

                for (var a = 0; a < firParams.Order; a++)
                {
                    NextState.main.main_c_rd_addr[a] = State.main.main_c_rd_addr_cmn;
                }

                if (State.main.main_c_rd_addr_cmn == State.set_coef_mask)
                {
                    NextState.mult_reset.mult_reset_common = true;
                }
                else
                {
                    NextState.mult_reset.mult_reset_common = false;
                }

                // pipeline for reset
                NextState.mult_reset.mult_reset_common_p = State.mult_reset.mult_reset_common;
                NextState.mult_reset.mult_reset_common_p1 = State.mult_reset.mult_reset_common_p;
                NextState.mult_reset.mult_reset_common_p2 = State.mult_reset.mult_reset_common_p1;
                NextState.mult_reset.mult_reset_common_p3 = State.mult_reset.mult_reset_common_p2;

                for (var a = 0; a < firParams.Order; a++)
                {
                    NextState.mult_reset.mult_reset_dsp[a] = State.mult_reset.mult_reset_common_p1;
                }

                if (State.set_do == 1)
                {
                    NextState.main.main_d_cnt_rst = !State.main.main_d_cnt_rst;
                }
                else
                {
                    if (State.main.main_d_cnt_masked == 0)
                    {
                        NextState.main.main_d_cnt_rst = true;
                    }
                    else
                    {
                        NextState.main.main_d_cnt_rst = false;
                    }
                }

                if (State.main.main_d_cnt_rst)
                {
                    NextState.main.main_d_cnt = 0;
                }
                else
                {
                    NextState.main.main_d_cnt = State.main.main_d_cnt + 1;
                }

                NextState.main.main_d_cnt_masked = State.main.main_d_cnt ^ State.set_data_mask;
                for (var a = 0; a < firParams.Order - 1; a++)
                {
                    NextState.main.main_d_addr[a] = State.main.main_d_cnt;
                }
            }
        }

        void FiloLogic()
        { 
            if (ib_iq_v)
            {
                NextState.filo.filo_counter_dec = State.filo.filo_counter_dec - 1;
                NextState.filo.filo_counter_inc = State.filo.filo_counter_inc + 1;
                NextState.filo.filo_addr_inc = State.filo.filo_counter_inc & State.set_coef_mask;
                NextState.filo.filo_addr_dec = State.filo.filo_counter_dec & State.set_coef_mask;

                if (State.filo.filo_way == false)
                {
                    NextState.filo.filo_addr_p1 = State.filo.filo_addr_inc;
                    if (State.filo.filo_addr_dec == 0)
                        NextState.filo.filo_way = !State.filo.filo_way;
                }
                else
                {
                    NextState.filo.filo_addr_p1 = State.filo.filo_addr_dec;
                    if (State.filo.filo_addr_inc == State.set_coef_mask)
                        NextState.filo.filo_way = !State.filo.filo_way;
                }

                if (State.set_do == 0)
                    NextState.filo.filo_addr_p = 0;
                else
                    NextState.filo.filo_addr_p = State.filo.filo_addr_p1;
            }
        }

        void ReadWriteFILO()
        {
            if (ib_iq_v)
            {
                NextState.dsp48.dsp48_srl[0] = ib_iq;
                foreach (var idx in range(0, firParams.Order * 2 - 2))
                {
                    NextState.dsp48.dsp48_srl[idx + 1] = State.dsp48.dsp48_srl[idx];
                }
                //NextState.dsp48.dsp48_srl_out = State.dsp48.dsp48_srl[firParams.Order * 2 - 2];

                for (var a = 0; a < firParams.Order; a++)
                {
                    NextState.filo.fir_dreg[a] = ramf_dout;
                }
            }
        }

        void AlternativeCalculations()
        {
            if (ib_iq_v)
            {
                for (var a = 0; a < firParams.Order; a++)
                {
                    NextState.fir.fir_areg1[a].i = dsp48_a[a].i[24, 0];
                    NextState.fir.fir_areg1[a].q = dsp48_a[a].q[24, 0];
                    NextState.fir.fir_areg2[a] = State.fir.fir_areg1[a];
                    NextState.fir.fir_breg[a] = dsp48_b[a];
                    NextState.fir.fir_adreg[a].i = State.fir.fir_areg2[a].i + dsp48_d[a].i;
                    NextState.fir.fir_adreg[a].q = State.fir.fir_areg2[a].q + dsp48_d[a].q;
                    NextState.fir.fir_mreg[a].i = (State.fir.fir_adreg[a].i.Signed() * State.fir.fir_breg[a].i.Signed()).Unsigned();
                    NextState.fir.fir_mreg[a].q = (State.fir.fir_adreg[a].q.Signed() * State.fir.fir_breg[a].q.Signed()).Unsigned();
                    NextState.mult_reset.mult_reset[a] = State.mult_reset.mult_reset_dsp[a];
                    if (a == 0)
                    {
                        if (State.mult_reset.mult_reset[a])
                        {
                            NextState.fir.fir_preg[a].i = (State.fir.fir_mreg[a].i.Signed().Resized(48)).Unsigned();
                            NextState.fir.fir_preg[a].q = (State.fir.fir_mreg[a].q.Signed().Resized(48)).Unsigned();
                        }
                        else
                        {
                            NextState.fir.fir_preg[a].i = (State.fir.fir_preg[a].i.Signed() + State.fir.fir_mreg[a].i.Signed().Resized(48)).Unsigned();
                            NextState.fir.fir_preg[a].q = (State.fir.fir_preg[a].q.Signed() + State.fir.fir_mreg[a].q.Signed().Resized(48)).Unsigned();
                        }
                    }
                    else
                    {
                        if (State.mult_reset.mult_reset[a])
                        {
                            NextState.fir.fir_preg[a].i = (State.fir.fir_preg[a - 1].i.Signed() + State.fir.fir_mreg[a].i.Signed().Resized(48)).Unsigned();
                            NextState.fir.fir_preg[a].q = (State.fir.fir_preg[a - 1].q.Signed() + State.fir.fir_mreg[a].q.Signed().Resized(48)).Unsigned();
                        }
                        else
                        {
                            NextState.fir.fir_preg[a].i = (State.fir.fir_preg[a].i.Signed() + State.fir.fir_mreg[a].i.Signed().Resized(48)).Unsigned();
                            NextState.fir.fir_preg[a].q = (State.fir.fir_preg[a].q.Signed() + State.fir.fir_mreg[a].q.Signed().Resized(48)).Unsigned();
                        }
                    }
                }
                /*
                for (var a = 0; a < 10; a++)
                {
                    NextState.fir.fir_result[a].i = State.fir.fir_preg[firParams.Order - 1].i[c_out_lsb + a + 23, c_out_lsb + a];
                    NextState.fir.fir_result[a].q = State.fir.fir_preg[firParams.Order - 1].q[c_out_lsb + a + 23, c_out_lsb + a];
                }
                */
                /*
                // transparent mode
                NextState.tr.tr_fir_mreg.i = State.fir.fir_adreg[firParams.Order - 1].i;
                NextState.tr.tr_fir_mreg.q = State.fir.fir_adreg[firParams.Order - 1].q;
                NextState.tr.tr_fir_preg = State.tr.tr_fir_mreg;
                NextState.tr.tr_fir_result = State.tr.tr_fir_preg;
                */
            }
        }

        void ProcessOutputs()
        {
            if (ib_iq_v)
            {
                for (var a = 0; a < 10; a++)
                {
                    NextState.dsp48.dsp48_result[a].i = dsp48_p[firParams.Order - 1].i[c_out_lsb + a + 23, c_out_lsb + a];
                    NextState.dsp48.dsp48_result[a].q = dsp48_p[firParams.Order - 1].q[c_out_lsb + a + 23, c_out_lsb + a];
                }

                if (State.mult_reset.mult_reset_common_p3)
                {
                    NextState.ob_iq_v = true;
                }
                else
                {
                    NextState.ob_iq_v = false;
                }
            }
            else
            {
                NextState.ob_iq_v = false;
            }

            if (State.ob_iq_v)
            {
                NextState.ob_iq = State.dsp48.dsp48_result[State.set_do];
            }
        }
        
        protected override void OnStage()
        {
            CurrentSetting();
            Coefficients();
            MainLogic();
            FiloLogic();
            ReadWriteFILO();
            AlternativeCalculations();
            ProcessOutputs();
        }
    }
}
