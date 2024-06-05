using Quokka.Core.Attributes;
using Quokka.RTL;
using System;

namespace axi.modules
{

    public class AXI4GatewayModuleInputs
    {
        public AXI4GatewayModuleInputs() : this(axiSize.B4) { }
        public AXI4GatewayModuleInputs(axiSize size)
        {
            iM2S = new AXI4_M2S(size);
            iS2M = new AXI4_S2M(size);
        }

        public AXI4_M2S iM2S;
        public AXI4_S2M iS2M;
    }

    public class AXI4GatewayModule : RTLCombinationalModule<AXI4GatewayModuleInputs>
    {
        internal AXI4GatewayAddressModule readAddress;
        internal AXI4GatewayAddressModule writeAddress;
        private readonly int axiSize;

        public AXI4GatewayModule(axiSize size, int originalLowerBits = 0)
        {
            this.axiSize = AXI4Tools.Bits(size);
            InitInputs(new AXI4GatewayModuleInputs(size));
            readAddress = new AXI4GatewayAddressModule(size, originalLowerBits);
            writeAddress = new AXI4GatewayAddressModule(size, originalLowerBits);
        }

        protected override void OnSchedule(Func<AXI4GatewayModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            readAddress.Schedule(() => new()
            {
                iOriginalAddress = Inputs.iM2S.R.AR.ARADDR,
                iMapAddress = new RTLBitArray(false).Resized(axiSize)
            });

            writeAddress.Schedule(() => new()
            {
                iOriginalAddress = Inputs.iM2S.W.AW.AWADDR,
                iMapAddress = new RTLBitArray(false).Resized(axiSize)
            });
        }

        public AXI4_M2S oM2S => new AXI4_M2S()
        {
            R =
            {
                AR =
                {
                    ARADDR = readAddress.oAddress,
                    ARBURST = Inputs.iM2S.R.AR.ARBURST,
                    ARCACHE = Inputs.iM2S.R.AR.ARCACHE,
                    ARID = Inputs.iM2S.R.AR.ARID,
                    ARLEN = Inputs.iM2S.R.AR.ARLEN,
                    ARLOCK = Inputs.iM2S.R.AR.ARLOCK,
                    ARPROT = Inputs.iM2S.R.AR.ARPROT,
                    ARQOS = Inputs.iM2S.R.AR.ARQOS,
                    ARREGION = Inputs.iM2S.R.AR.ARREGION,
                    ARSIZE = Inputs.iM2S.R.AR.ARSIZE,
                    ARUSER = Inputs.iM2S.R.AR.ARUSER,
                    ARVALID = Inputs.iM2S.R.AR.ARVALID
                },
                R = Inputs.iM2S.R.R
            },
            W =
            {
                AW =
                {
                    AWADDR = writeAddress.oAddress,
                    AWBURST = Inputs.iM2S.W.AW.AWBURST,
                    AWCACHE = Inputs.iM2S.W.AW.AWCACHE,
                    AWID = Inputs.iM2S.W.AW.AWID,
                    AWLEN = Inputs.iM2S.W.AW.AWLEN,
                    AWLOCK = Inputs.iM2S.W.AW.AWLOCK,
                    AWPROT = Inputs.iM2S.W.AW.AWPROT,
                    AWQOS = Inputs.iM2S.W.AW.AWQOS,
                    AWREGION = Inputs.iM2S.W.AW.AWREGION,
                    AWSIZE = Inputs.iM2S.W.AW.AWSIZE,
                    AWUSER = Inputs.iM2S.W.AW.AWUSER,
                    AWVALID = Inputs.iM2S.W.AW.AWVALID
                },
                B = Inputs.iM2S.W.B,
                W = Inputs.iM2S.W.W,
            }
        };

        public AXI4_S2M oS2M => Inputs.iS2M;
    }
}
