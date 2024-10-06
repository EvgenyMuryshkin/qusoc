using System.IO.Ports;
using System;
using System.Threading.Tasks;
using System.Linq;
using System.Diagnostics;

namespace QuSoC.Tests
{
    public class AXIProgrammerClient : IDisposable
    {
        SerialPort _port;
        public AXIProgrammerClient(string port = "COM12")
        {
            _port = new SerialPort()
            {
                PortName = port,
                BaudRate = 115200,
                Parity = Parity.None,
                DataBits = 8,
                StopBits = StopBits.One,
                Handshake = Handshake.None,
                ReceivedBytesThreshold = 1
            };

            //mPort.DataReceived += DataReceivedHandler;
            //mPort.ErrorReceived += ErrorReceivedHandler;
            _port.ReceivedBytesThreshold = 1;
            _port.Open();
        }

        Task<byte[]> ReadAll()
        {
            var buff = new byte[_port.BytesToRead];
            if (buff.Length > 0)
                _port.Read(buff, 0, buff.Length);
    
            return Task.FromResult(buff);
        }

        public async Task<bool> Sync()
        {
            while (true)
            {
                _port.Write(new byte[] { 0x55 }, 0, 1);

                while (true)
                {
                    var data = await ReadAll();
                    if (data.Length == 0)
                        break;

                    if (data.Length == 1 && data[0] == 0x55)
                        return true;

                    await Task.Delay(TimeSpan.FromMilliseconds(50));
                }

                await Task.Delay(TimeSpan.FromMilliseconds(1000));
            }
        }

        void writeData(byte[] data)
        {
            _port.Write(data, 0, data.Length);
        }


        void writeData(uint value)
        {
            var data = new byte[4]
            { 
                (byte)(value >> 24), 
                (byte)(value >> 16), 
                (byte)(value >> 8),
                (byte)(value) 
            };

            writeData(data);
        }

        async Task<uint> readUInt32()
        {
            var buff = new byte[4];
            while (_port.BytesToRead < 4)
                await Task.Delay(TimeSpan.FromMilliseconds(100));
            _port.Read(buff, 0, buff.Length);

            uint result = (
                (uint)(buff[0] << 24) |
                (uint)(buff[1] << 16) | 
                (uint)(buff[2] << 8) |
                (uint)(buff[3])
            );

            return result;

        }

        public async Task<uint> readData(uint addr)
        {
            writeData([1]);
            writeData(addr);
            return await readUInt32();
        }

        public Task writeData(uint addr, uint data)
        {
            writeData([2]);
            writeData(addr);
            writeData(data);
            return Task.CompletedTask;
        }

        public void Dispose()
        {
            _port?.Dispose();
            _port = null;
        }

        public async Task Update(int cpu, uint[] instructions)
        {
            // stop CPU1
            Trace.WriteLine("Resetting");
            uint cpuMask = 1U << cpu;
            await writeData(0x80000000, cpuMask);

            var baseAddrMask = (uint)(cpu << 24); 
            var baseAddr = 0xF0000000 | baseAddrMask;

            Trace.WriteLine($"Firmware size: {instructions.Length} words [{baseAddr:X} - {(baseAddr + instructions.Length * 4):X}]");
            Stopwatch sw = new Stopwatch();
            sw.Start();
            var reportPeriod = TimeSpan.FromSeconds(1);

            for (var i = 0; i < instructions.Length; i++)
            {
                uint addr = baseAddr + (uint)(i * 4);
                await writeData(addr, instructions[i]);

                if (sw.Elapsed > reportPeriod)
                {
                    sw.Restart();
                    Trace.WriteLine($"Firmware update {(int)(((float)i / instructions.Length) * 100.0)}%");
                }
            }

            // run all CPUs
            Trace.WriteLine("Restaring");
            await writeData(0x80000000, 0x00000000);
        }

    }
}
