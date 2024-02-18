namespace soc
{
    public abstract class SoCComponent
    {
        public Guid Id { get; set; } = new Guid();
        public string Name { get; set; }
    }

    public class Interconnect : SoCComponent
    {
        public List<Guid> ComponentIds { get; set; } = new List<Guid>();
    }

    public class RISCV : SoCComponent
    {

    }

    public class Gateway : SoCComponent
    {
        public string FromInterconnectId {  get; set; }
        public int FromInterconnectAddress { get; set; }
        public string ToInterconnectId { get; set; }
        public int ToInterconnectAddress { get; set; }
        public int Depth { get; set; }
    }

    public class Register : SoCComponent
    {
        public int Address { get; set; }
    }

    public class MemoryBlock : SoCComponent
    {
        public int Address { get; set; }
        public int Depth { get; set; }
    }

    public class SoC
    {
        public List<SoCComponent> Components { get; set; } = new List<SoCComponent>();
    }

    public class SoCComponentInfo
    {
        public string Name { get; set; }
        public string DisplayName { get; set; }
        public bool IsTopLevel { get; set; }
        public bool IsMaster { get; set; }
        public bool IsSlave { get; set; }
    }
}
