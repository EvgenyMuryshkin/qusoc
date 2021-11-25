using RTL.Modules;
using System.Collections.Generic;
using System.Text;

namespace rtl.modules
{
    public class AXI4RegisterModuleB4 : AXI4RegisterModule
    {
        public AXI4RegisterModuleB4() : base(axiSize.B4)
        {

        }
    }

    public class AXI4MasterModuleB4 : AXI4MasterModule
    {
        public AXI4MasterModuleB4() : base(axiSize.B4)
        {

        }
    }

    public class AXI4MemoryModuleB4 : AXI4MemoryModule
    {
        public AXI4MemoryModuleB4() : base(axiSize.B4, 1024)
        {

        }
    }
}
