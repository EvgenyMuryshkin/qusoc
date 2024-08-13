using Microsoft.VisualStudio.TestTools.UnitTesting;
using QRV32.Compliance;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AXISoC.ComplianceTests
{

    [TestClass]
    public class RV32I : RV32Base
    {
        public RV32I() : base(new AXISoCComplianceTestsBaseAdapter("rv32i", "rv32i")) { }
    }

    [TestClass]
    public class HardwareRV32I : RV32Base
    {
        public HardwareRV32I() : base(new AXISoCComplianceHardwareTestsBaseAdapter("rv32i", "rv32i")) { }
    }
}
