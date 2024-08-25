using System.Diagnostics;
using System.IO.Ports;
using System.Threading.Tasks;
using System;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace QuSoC.Tests
{
    public class AXISocCPUUpdater : IDisposable
    {
        SerialPort _port;
        public AXISocCPUUpdater(string port = "COM12")
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

        public int BytesToRead => _port.BytesToRead;
        public byte[] ReadAll()
        {
            var buff = new byte[_port.BytesToRead];
            if (buff.Length == 0)
                return buff;

            _port.Read(buff, 0, buff.Length);
            return buff;
        }

        void ReadSync()
        {
            do
            {
                int data = _port.ReadByte();
                if (data == 0x55)
                    return;
            }
            while (true);
        }

        void writeValueWithFeedback(uint value)
        {
            var s = value.ToString("X8");
            var chars = s.ToArray();
            var feedbackBytes = new byte[8];

            for (var idx = 0; idx < chars.Length; idx++)
            {
                _port.Write(new[] { chars[idx] }, 0, 1);
                //while (mPort.BytesToRead == 0) { }
                //mPort.Read(feedbackBytes, idx, 1);
            }

            var feedbackString = _port.ReadLine().Trim();
            //Assert.AreEqual(s, feedbackString);

            //var feedbackString = Encoding.ASCII.GetString(feedbackBytes);
            //Assert.AreEqual(s, feedbackString);
            //var mewLine = mPort.ReadLine();
        }

        public Task<uint> readData(uint addr)
        {
            _port.Write(new[] { '6' }, 0, 1);
            writeValueWithFeedback(addr);
            var feedbackString = _port.ReadLine().Trim();
            var result = Convert.ToUInt32(feedbackString, 16);
            return Task.FromResult(result);
        }

        public Task writeData(uint addr, uint value, bool expectSync = true)
        {
            _port.Write(new[] { '5' }, 0, 1);
            //var addrPrompt = _port.ReadLine().Trim();
            writeValueWithFeedback(addr);

            //var dataPrompt = _port.ReadLine().Trim();

            writeValueWithFeedback(value);

            if (expectSync)
                ReadSync();
            //var doneLine = _port.ReadLine().Trim();

            return Task.CompletedTask;
        }

        public async Task<uint[]> ReadRemoteMemoryBlock(int cpu, int offset, int length)
        {
            var result = new uint[length];

            for (var i = 0; i < length; i++)
            {
                uint addr = 0xF1000000 + (uint)(i * 4);
                var data = await readData(addr);
                result[i] = data;
            }

            return result;
        }

        public async Task Update(int cpu, uint[] instructions)
        {
            // stop CPU1
            Trace.WriteLine("Resetting");
            uint cpuMask = 1U << cpu;
            await writeData(0x80000000, cpuMask, false);

            ReadAll();

            _port.Write(new[] { '4' }, 0, 1);
            ReadSync();
            //var hello = _port.ReadLine();

            var baseAddr = 0xF1000000;

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

        public static async Task UpdateCPU(int cpu, uint[] instructions, string port = "COM12")
        {
            using (var updated = new AXISocCPUUpdater(port))
            {
                await updated.Update(cpu, instructions);
            }
        }

        public void Dispose()
        {
            _port?.Dispose();
            _port = null;
        }
    }
}
