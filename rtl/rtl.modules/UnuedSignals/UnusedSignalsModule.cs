using Quokka.RTL;
using Quokka.RTL.Tools;
using System;
using System.Collections.Generic;
using System.Text;

namespace RTL.Modules
{
    public class UnusedSignalsData
    {
        public bool UsedValue { get; set; }
        public bool UnusedValue;
        public bool[] UsedValueArray = new bool[4];
        public bool[] UnusedValueArray = new bool[4];
        public Tuple<bool, bool> Tuple = new Tuple<bool, bool>(false, false);
    }

    public class UnusedSignalsModuleInputs
    {
        public bool iUsedValue;
        public bool iUnusedValue;
        public bool[] iUsedValueArray = new bool[4];
        public bool[] iUnusedValueArray = new bool[4];
        public Tuple<bool, bool> iUsedTuple = new Tuple<bool, bool>(false, false);
        public Tuple<bool, bool> iUnusedTuple = new Tuple<bool, bool>(false, false);
        public UnusedSignalsData iObject = new UnusedSignalsData();
    }

    public class UnusedSignalsModuleState
    {
        public bool UnusedState;
        public bool UsedState;
    }

    public class UnusedSignalsModule : RTLSynchronousModule<UnusedSignalsModuleInputs, UnusedSignalsModuleState>
    {
        public override RTLModuleAnalizers Analizers => new RTLModuleAnalizers() { SignalsUsage = true };
        bool usedInternal => Inputs.iUsedValue;
        bool unusedInternal => Inputs.iUsedValue;

        public bool oInputValue => Inputs.iUsedValue;
        public bool[] oInputArray => Inputs.iUsedValueArray;
        public bool oInputClassValue => Inputs.iUsedValue;
        public bool oInputClassArrayValue => Inputs.iUsedValue;
        public bool oInternal => usedInternal;
        public bool oStateValue => State.UsedState;
        public bool oInputArrayValue => Inputs.iUsedValueArray[1];

        protected override void OnStage()
        {
        }
    }
}
