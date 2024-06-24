using Quokka.RTL;
using System;
using System.Drawing;
using System.Linq;

namespace axi.modules
{
    public class AXI4PWMModuleInputs
    {
        public AXI4PWMModuleInputs() : this(axiSize.B4) { }
        public AXI4PWMModuleInputs(axiSize size)
        {
            M2S = new AXI4_M2S(size);
        }

        public AXI4_M2S M2S;
    }

    public class AXI4PWMModuleState
    {
        public AXI4PWMModuleState() { }

        public AXI4PWMModuleState(int pwmCount, uint pwmDurationClocks)
        {
            pwm = new uint[pwmCount];
            this.pwmDurationClocks = pwmDurationClocks;
        }

        public uint waddr;
        public uint wdata;

        public uint[] pwm;
        public uint pwmDurationClocks;
    }

    public class AXI4PWMModule : RTLSynchronousModule<AXI4PWMModuleInputs, AXI4PWMModuleState>
    {
        readonly int pwmCount;
        private readonly int addressLSB;
        private readonly int addressBits;

        internal AXI4NonBufferedSlaveModule axiSlave;
        internal PWMModule[] pwms;

        public AXI4PWMModule(axiSize size, int pwmCount, uint pwmDurationClocks)
        {
            this.pwmCount = pwmCount;
            this.addressLSB = AXI4Tools.AddressLSB(size);
            this.addressBits = AXITools.log2(pwmCount);

            InitState(new AXI4PWMModuleState(pwmCount, pwmDurationClocks));
            axiSlave = new AXI4NonBufferedSlaveModule(size);
            pwms = range(pwmCount).Select(i => new PWMModule()).ToArray();
        }

        RTLBitArray rawAddr => new RTLBitArray(State.waddr >> addressLSB)[7, 0];
        RTLBitArray pwmWADDR => new RTLBitArray(State.waddr >> addressLSB)[addressBits - 1, 0];

        public AXI4_S2M oS2M => axiSlave.S2M;
        public bool[] oPWM => pwms.Select(p => p.oPWM).ToArray();

        protected override void OnSchedule(Func<AXI4PWMModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            axiSlave.Schedule(() => new AXI4NonBufferedSlaveModuleInputs()
            {
                M2S = Inputs.M2S,
                inRDATA = new RTLBitArray(0),
                inARREADY = true,
                inRVALID = true,
                inAWREADY = true,
                inWREADY = true,
                inBVALID = true,
            });

            foreach (var pwm in range(pwmCount))
            {
                pwms[pwm].Schedule(() => new()
                {
                    iActive = true,
                    iOnClock = 50000,//State.pwm[pwm],
                    iDurationClocks = 1000000//State.pwmDurationClocks
                });
            }
        }

        bool pwmClocksWE => axiSlave.outWriteTXCompleting && rawAddr == 0x3F;
        bool pwmWE => axiSlave.outWriteTXCompleting && rawAddr < pwmCount && !pwmClocksWE;

        protected override void OnStage()
        {
            if (axiSlave.outAWREADYConfirming)
                NextState.waddr = axiSlave.outAWADDR;

            if (axiSlave.outWREADYConfirming)
                NextState.wdata = new RTLBitArray(axiSlave.outWDATA);

            if (pwmClocksWE)
                NextState.pwmDurationClocks = State.wdata;

            if (pwmWE)
            {
                NextState.pwm[pwmWADDR] = State.wdata;
            }
        }
    }
}
