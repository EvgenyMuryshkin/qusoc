﻿using Quokka.RTL;
using System;
using System.Collections.Generic;
using System.Text;

namespace QuSoC
{
    public class SoCRegisterModuleInputs : SoCComponentModuleInputs
    {
    }

    public class SoCRegisterModuleState
    {
        public uint Value { get; set; }
    }

    public class SoCRegisterModule : SoCComponentModule<SoCRegisterModuleInputs, SoCRegisterModuleState>
    {
        public SoCRegisterModule() : base(4)
        {

        }

        bool internalIsActive => addressMatch;

        public override uint ReadValue => State.Value >> internalByteAddress;
        public override bool IsReady => true;
        public override bool IsActive => internalIsActive;
        public uint Value => State.Value;
        protected override void OnStage()
        {
            if (Inputs.Common.WE && internalIsActive)
            {
                NextState.Value = Inputs.Common.WriteValue;
            }
        }
    }
}
