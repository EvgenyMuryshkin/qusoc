using Quokka.RTL;
using Quokka.RTL.Tools;
using System;
using System.Collections.Generic;
using System.Text;

namespace RTL.Modules
{
    public class VGASyncModuleInputs
    {
        public bool Enabled;
    }

    public class VGASyncModuleState
    {
        public RTLBitArray counter = new RTLBitArray();
    }

    public class VGASyncModule : RTLSynchronousModule<VGASyncModuleInputs, VGASyncModuleState>
    {
        private readonly uint visible;
        private readonly uint fp;
        private readonly uint sp;
        private readonly uint bp;
        private readonly uint max;
        private readonly uint capacity;

        public VGASyncModule(uint visible, uint fp, uint sp, uint bp)
        {
            this.visible = visible;
            this.fp = this.visible + fp;
            this.sp = this.fp + sp;
            this.bp = this.sp + bp;

            max = visible + fp + sp + bp - 1;
            capacity = RTLCalculators.CalcBitsForValue(max);
        }

        public override bool OnRelatedObjectCreating(object data)
        {
            switch (data)
            {
                case VGASyncModuleState state:
                {
                    state.counter = new RTLBitArray().Resized(capacity).Unsigned();
                    return true;
                }
                default:
                {
                    return base.OnRelatedObjectCreating(data);
                }
            }
        }
        bool internalIsMax => State.counter == max;

        public bool OutVisible => State.counter < visible;
        public bool OutFP => State.counter >= visible && State.counter < fp;
        public bool OutSP => State.counter >= fp && State.counter < sp;
        public bool OutBP => State.counter >= sp && State.counter < bp;
        public bool OutMax => internalIsMax;
        public RTLBitArray OutCounter => State.counter;

        protected override void OnStage()
        {
            if (Inputs.Enabled)
                NextState.counter = new RTLBitArray(internalIsMax ? new RTLBitArray(0) : State.counter + 1).Resized(capacity).Unsigned();
        }
    }
}
