﻿using Quokka.RTL;
using System;
using System.Linq;

namespace fir.modules
{
    public class FIRModuleInputs
    {
        public FIRModuleInputs() { }
        public FIRModuleInputs(FIRParams firParams)
        {
            iCOEFF = new RTLBitArray().Resized(firParams.CoeffSize);

            iDO = new RTLBitArray().Resized(firParams.DOSize);
            iIQ = new t_iq16();
        }

        public bool iCOEF_V;
        public RTLBitArray iCOEFF;

        public RTLBitArray iDO;
        public bool iIQ_V;
        public t_iq16 iIQ;
    }

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
            tr = new t_tr(config.Order);
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
        public t_tr tr;

        // output buffers
        public bool ob_coef_rdy;
        public bool ob_iq_v;
        public t_iq24 ob_iq;
    }


    public class FIRModule : RTLSynchronousModule<FIRModuleInputs, FIRModuleState>
    {
        public FIRModule() { }

        public FIRModule(FIRParams firParams)
        {
            this.firParams = firParams;

            InitInputs(new FIRModuleInputs(firParams));
            InitState(new FIRModuleState(firParams));
            //stages = Enumerable.Range(0, firParams.Order).Select(_ => new FIRStageModule(firParams)).ToArray();

            u_ram_coef = Enumerable.Range(0, firParams.Order).Select(_ => new FIRDecimatorRAM(2, c_nofc)).ToArray();
            u_ram_srls_i = Enumerable.Range(0, firParams.Order).Select(_ => new FIRDecimatorRAM(2, c_srls_length)).ToArray();
            u_ram_srls_q = Enumerable.Range(0, firParams.Order).Select(_ => new FIRDecimatorRAM(2, c_srls_length)).ToArray();
            u_ram_filo_i = new FIRDecimatorRAM(1, 512);
            u_ram_filo_q = new FIRDecimatorRAM(1, 512);

            c_coef_num_array = FIRTools.f_get_coef_num_array(firParams.Order);
            c_coef_mask_array = FIRTools.f_get_coef_mask();
            c_data_mask_array = FIRTools.f_get_data_mask();
            c_ram_addr_hight_msb = FIRTools.log2(firParams.Order);
            c_out_lsb = FIRTools.log2(firParams.Order) + 2;

            ramd_din = Enumerable.Range(0, firParams.Order).Select(_ => new t_iq16()).ToArray();
            ramd_dout = Enumerable.Range(0, firParams.Order).Select(_ => new t_iq16()).ToArray();

            u_dsp48_i = Enumerable.Range(0, firParams.Order).Select(_ => new FIRDSPWrapperModule(firParams)).ToArray();
            u_dsp48_q = Enumerable.Range(0, firParams.Order).Select(_ => new FIRDSPWrapperModule(firParams)).ToArray();
        }

        // constants declaration
        private readonly FIRParams firParams;
        private readonly int[] c_coef_num_array;
        private readonly RTLBitArray[] c_coef_mask_array;
        private readonly RTLBitArray[] c_data_mask_array;
        private readonly int c_nofc = 512;
        private readonly int c_srls_length = 1024;
        private readonly int c_ram_addr_hight_msb;
        private readonly int c_dl_accum = 9;
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
        
        RTLBitArray[] ramc_dout => u_ram_coef.Select(r => r.DOUT).ToArray();
        t_iq16[] ramd_din;
        t_iq16[] ramd_dout;

        t_iq16 ramf_din => State.set_do == false
            ? State.dsp48.dsp48_srl[firParams.Order * 2 - 3]
            : ramd_dout[firParams.Order - 2];
       
        t_iq16 ramf_dout => new t_iq16 { i = u_ram_filo_i.DOUT, q = u_ram_filo_q.DOUT };
        FIRDSPWrapperModule[] u_dsp48_i;
        FIRDSPWrapperModule[] u_dsp48_q;

        // output
        public RTLBitArray oCOEF_NUM => new RTLBitArray(2 * c_coef_num_array[0]).Resized(16);//oCOEF_NUM                       <= conv_std_logic_vector(2 * c_coef_num_array(0), 16);
        public RTLBitArray oCOEF_CNT => State.coeff.coef_ram_cnt; //oCOEF_CNT                       <= ob_coef_cnt;
        public bool oCOEF_RDY => State.ob_coef_rdy;//oCOEF_RDY                       <= ob_coef_rdy;
        public bool oIQ_V => State.ob_iq_v;//oIQ_V                           <= ob_iq_v;
        public t_iq oIQ => State.ob_iq;//oIQ                             <= ob_iq;

        RTLBitArray sxt(RTLBitArray source, int size) => source.Signed().Resized(size);

        protected override void OnSchedule(Func<FIRModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            // GEN_ramc
            for (var a = 0; a < firParams.Order; a++)
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

            for (var a = 0; a < firParams.Order; a++)
            {
                ramd_dout[a].i = u_ram_srls_i[a].DOUT;
                ramd_dout[a].q = u_ram_srls_q[a].DOUT;
            }

            ramd_din[0] = ib_iq;
            for (var a = 1; a < firParams.Order; a++)
            {
                ramd_din[a] = ramd_dout[a - 1];
            }

            for (var a = 0; a < firParams.Order; a++)
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

            for (var a = 0; a < firParams.Order; a++)
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
            for (var i = 0; i < firParams.Order; i++)
            {
                u_dsp48_i[i].Schedule(() => new FIRDSPWrapperModuleInputs()
                {
                    CE = ib_iq_v,
                    RST = false,
                    A = State.dsp48.dsp48_a[i].i,
                    B = State.dsp48.dsp48_b[i].i,
                    D = State.dsp48.dsp48_d[i].i,
                    PCIN = State.dsp48.dsp48_pcin[i].i,
                    OPMODE = State.dsp48.dsp48_opmode[i].i[6, 4]
                });

                u_dsp48_q[i].Schedule(() => new FIRDSPWrapperModuleInputs()
                {
                    CE = ib_iq_v,
                    RST = false,
                    A = State.dsp48.dsp48_a[i].q,
                    B = State.dsp48.dsp48_b[i].q,
                    D = State.dsp48.dsp48_d[i].q,
                    PCIN = State.dsp48.dsp48_pcin[i].q,
                    OPMODE = State.dsp48.dsp48_opmode[i].q[6, 4]
                });
            }
        }

        /// <summary>
        /// process, current settings
        /// </summary>
        void CurrentSetting()
        {
            var next_set_do = ib_do;
            NextState.set_do = next_set_do;
            NextState.set_coef_mask = c_coef_mask_array[next_set_do];
            NextState.set_data_mask = c_data_mask_array[next_set_do];
            
            for (var a = 0; a < firParams.Order; a++)
            {
                NextState.set_do_mux[a] = next_set_do;
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
                    NextState.coeff.coef_ram_wr[a] = false;
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
                    NextState.main.main_c_cnt = 0;
                }
                else
                {
                    NextState.main.main_c_cnt = State.main.main_c_cnt + 1;
                }

                NextState.main.main_c_cnt_masked = State.main.main_c_cnt ^ State.set_data_mask;
                for (var a = 0; a < firParams.Order - 1; a++)
                {
                    NextState.main.main_d_addr[a] = State.main.main_c_cnt;
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
                NextState.dsp48.dsp48_srl_out = State.dsp48.dsp48_srl[firParams.Order * 2 - 2];

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
                    NextState.fir.fir_areg1[a].i = State.dsp48.dsp48_a[a].i[24, 0];
                    NextState.fir.fir_areg1[a].q = State.dsp48.dsp48_a[a].q[24, 0];
                    NextState.fir.fir_areg2[a] = State.fir.fir_areg1[a];
                    NextState.fir.fir_breg[a] = State.dsp48.dsp48_b[a];
                    NextState.fir.fir_adreg[a].i = State.fir.fir_areg2[a].i + State.dsp48.dsp48_d[a].i;
                    NextState.fir.fir_adreg[a].q = State.fir.fir_areg2[a].q + State.dsp48.dsp48_d[a].q;
                    NextState.fir.fir_mreg[a].i = State.fir.fir_adreg[a].i.Signed() * State.fir.fir_breg[a].i.Signed();
                    NextState.fir.fir_mreg[a].q = State.fir.fir_adreg[a].q.Signed() * State.fir.fir_breg[a].q.Signed();
                    NextState.mult_reset.mult_reset[a] = State.mult_reset.mult_reset_dsp[a];
                    if (a == 0)
                    {
                        if (State.mult_reset.mult_reset[a])
                        {
                            NextState.fir.fir_preg[a].i = State.fir.fir_mreg[a].i.Signed().Resized(48);
                            NextState.fir.fir_preg[a].q = State.fir.fir_mreg[a].q.Signed().Resized(48);
                        }
                        else
                        {
                            NextState.fir.fir_preg[a].i = State.fir.fir_preg[a].i + State.fir.fir_mreg[a].i.Signed().Resized(48);
                            NextState.fir.fir_preg[a].q = State.fir.fir_preg[a].q + State.fir.fir_mreg[a].q.Signed().Resized(48);
                        }
                    }
                    else
                    {
                        if (State.mult_reset.mult_reset[a])
                        {
                            NextState.fir.fir_preg[a].i = State.fir.fir_preg[a - 1].i + State.fir.fir_mreg[a].i.Signed().Resized(48);
                            NextState.fir.fir_preg[a].q = State.fir.fir_preg[a - 1].q + State.fir.fir_mreg[a].q.Signed().Resized(48);
                        }
                        else
                        {
                            NextState.fir.fir_preg[a].i = State.fir.fir_preg[a].i + State.fir.fir_mreg[a].i.Signed().Resized(48);
                            NextState.fir.fir_preg[a].q = State.fir.fir_preg[a].q + State.fir.fir_mreg[a].q.Signed().Resized(48);
                        }
                    }
                }
                for (var a = 0; a < 10; a++)
                {
                    NextState.fir.fir_result[a].i = State.fir.fir_preg[firParams.Order - 1].i[c_out_lsb + a + 23, c_out_lsb + a];
                    NextState.fir.fir_result[a].q = State.fir.fir_preg[firParams.Order - 1].q[c_out_lsb + a + 23, c_out_lsb + a];
                }

                // transparent mode
                NextState.tr.tr_fir_mreg.i = State.fir.fir_adreg[firParams.Order - 1].i;
                NextState.tr.tr_fir_mreg.q = State.fir.fir_adreg[firParams.Order - 1].q;
                NextState.tr.tr_fir_preg = State.tr.tr_fir_mreg;
                NextState.tr.tr_fir_result = State.tr.tr_fir_preg;

            }
        }

        void DSPLogic()
        {
            // I channel
            NextState.dsp48.dsp48_a[0].i = sxt(ib_iq.i, 30);
            NextState.dsp48.dsp48_opmode[0].i = State.mult_reset.mult_reset_dsp[0] ? new RTLBitArray("0000000") : new RTLBitArray("0100000");
            NextState.dsp48.dsp48_d[0].i = sxt(State.filo.fir_dreg[0].i, 25);
            NextState.dsp48.dsp48_b[0].i = sxt(ramc_dout[0], 18);
            
            for (var a = 1; a < firParams.Order; a++)
            {
                NextState.dsp48.dsp48_a[a].i = State.set_do_mux[a] != 0 ? sxt(ramd_dout[a - 1].i, 30) : sxt(State.dsp48.dsp48_srl[a * 2 - 1].i, 30);//dbg
                NextState.dsp48.dsp48_opmode[a].i = State.mult_reset.mult_reset_dsp[a] ? new RTLBitArray("0010000") : new RTLBitArray("0100000");
                NextState.dsp48.dsp48_d[a].i = sxt(State.filo.fir_dreg[a].i, 25);
                NextState.dsp48.dsp48_b[a].i = sxt(ramc_dout[a], 18);
                NextState.dsp48.dsp48_pcin[a].i = State.dsp48.dsp48_pcout[a - 1].i;
            }

            // Q channel
            NextState.dsp48.dsp48_a[0].q = sxt(ib_iq.q, 30);
            NextState.dsp48.dsp48_opmode[0].q = State.mult_reset.mult_reset_dsp[0] ? new RTLBitArray("0000000") : new RTLBitArray("0100000");
            NextState.dsp48.dsp48_d[0].q = sxt(State.filo.fir_dreg[0].q, 25);
            NextState.dsp48.dsp48_b[0].q = sxt(ramc_dout[0], 18);

            for (var a = 1; a < firParams.Order; a++)
            {
                NextState.dsp48.dsp48_a[a].q = State.set_do_mux[a] != 0 ? sxt(ramd_dout[a - 1].q, 30) : sxt(State.dsp48.dsp48_srl[a * 2 - 1].q, 30);//dbg
                NextState.dsp48.dsp48_opmode[a].q = State.mult_reset.mult_reset_dsp[a] ? new RTLBitArray("0010000") : new RTLBitArray("0100000");
                NextState.dsp48.dsp48_d[a].q = sxt(State.filo.fir_dreg[a].q, 25);
                NextState.dsp48.dsp48_b[a].q = sxt(ramc_dout[a], 18);
                NextState.dsp48.dsp48_pcin[a].q = State.dsp48.dsp48_pcout[a - 1].q;
            }
        }

        protected override void OnStage()
        {
            CurrentSetting();
            Coefficients();
            MainLogic();
            FiloLogic();
            ReadWriteFILO();
            DSPLogic();
            AlternativeCalculations();
        }
    }
}