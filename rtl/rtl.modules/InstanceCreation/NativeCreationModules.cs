using Newtonsoft.Json.Linq;
using Quokka.RTL;
using Quokka.RTL.Tools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace rtl.modules
{
    public class NativeInstanceCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public sbyte Value
        {
            get
            {
                var result = sbyte.MinValue;
                return result;
            }
        }
    }

    public class EnumInstanceCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public InstanceCreationType Value
        {
            get
            {
                var result = InstanceCreationType.UInt;
                return result;
            }
        }
    }
}
