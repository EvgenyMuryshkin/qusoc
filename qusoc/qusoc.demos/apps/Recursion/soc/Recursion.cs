﻿using QuSoC;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recursion
{
    public partial class Recursion : QuSoCModule
    {
        public uint Counter => CounterModule.Value;
    }
}
