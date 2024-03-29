﻿using Quokka.RTL;
using System;
using System.Collections.Generic;
using System.Text;

namespace QuSoC
{
    // NOTE: inheritance from IRTLCombinationalModule is a key to create module multiplexer
    public interface ISoCComponentModule : IRTLCombinationalModule
    {
        bool IsActive { get; }
        bool IsReady { get; }
        uint ReadValue { get; }
    }

    public class SoCComponentModuleCommon
    {
        public uint Address;
        public uint WriteValue;
        public bool WE;
        public bool RE;
        public RTLBitArray MemAccessMode = new RTLBitArray().Resized(2);
    }

    public class SoCComponentModuleInputs
    {
        public SoCComponentModuleCommon Common = new SoCComponentModuleCommon();
        public uint DeviceAddress;
    }

    public abstract class SoCComponentModule<TInputs, TState> : RTLSynchronousModule<TInputs, TState>, ISoCComponentModule
        where TInputs : SoCComponentModuleInputs, new()
        where TState : new()
    {
        public abstract bool IsActive { get; }
        public abstract bool IsReady { get; }
        public abstract uint ReadValue { get; }

        private readonly uint addressSpan;
        public SoCComponentModule(uint addressSpan)
        {
            this.addressSpan = addressSpan;
        }

        public SoCComponentModule(uint addressSpan, TState state) : base(state)
        {
            this.addressSpan = addressSpan;
        }

        protected virtual bool addressMatch => Inputs.Common.Address >= Inputs.DeviceAddress && Inputs.Common.Address < (Inputs.DeviceAddress + addressSpan);
        protected RTLBitArray internalAddressBits => new RTLBitArray(Inputs.Common.Address);
        protected RTLBitArray internalByteAddress => internalAddressBits[1, 0] << 3;
    }
}
