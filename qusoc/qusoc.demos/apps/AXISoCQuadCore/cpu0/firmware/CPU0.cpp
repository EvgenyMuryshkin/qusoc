#include "CPU0.h"
#include <stdint.h>
#include <stdbool.h>
#include "soc.h"
#include "HardwareUART.h"

namespace AXISoCQuadCore
{
	void CPU0::Increment(uint32_t* counter)
	{
		(*counter)++;
	}

	void CPU0::Counter(uint32_t delay)
	{
		uint32_t counter = 0;
		while (true)
		{
			CPU0::Increment(&counter);
			AXISoCQuadCore_SOC_Reg0 = counter;
		}
	}

	void CPU0::EntryPoint()
	{
		CPU0::Counter(50000000);

		uint32_t counter = 0;
		struct qusoc::HardwareUART hardwareUART;//(/*0x90000000*/);

		while (true)
		{
			(counter++);
			AXISoCQuadCore_SOC_Reg0 = counter;

			if (hardwareUART.HasData())
			{
				uint8_t readData = hardwareUART.ReadByte();

				switch (readData)
				{
					case '0':
					{
						hardwareUART.SendMessage("1 - reg3, 2 - write, 3 - read\r\n");
					}
					break;
					case '1':
					{
						volatile uint32_t* reg3Addr = 0;
						reg3Addr = (volatile uint32_t*)0x80000010;
						uint32_t reg3Value = *reg3Addr;
						if (reg3Value == 0)
							reg3Value = 1;
						else
							reg3Value = 0;
						*reg3Addr = reg3Value;
					}
					break;
					case '2':
					{
						hardwareUART.SendMessage("Enter write address in 8-symbol hex:\r\n");
						uint32_t addr = hardwareUART.ReadUint32FromText();
						if ((addr & 0x3) != 0)
						{
							hardwareUART.SendMessage("Address is not 4 byte aligned:\r\n");
							break;
						}

						hardwareUART.SendMessage("Enter write data in 8-symbol hex:\r\n");
						uint32_t data = hardwareUART.ReadUint32FromText();

						volatile uint32_t* addrPtr = (uint32_t*)addr;
						*addrPtr = data;
						hardwareUART.SendMessage("Done!\r\n");
					}
					break;
					case '3':
					{
						hardwareUART.SendMessage("Enter read address in 8-symbol hex:\r\n");
						uint32_t addr = hardwareUART.ReadUint32FromText();
						if ((addr & 0x3) != 0)
						{
							hardwareUART.SendMessage("Address is not 4 byte aligned:\r\n");
							break;
						}
						volatile uint32_t* addrPtr = (uint32_t*)addr;
						uint32_t data = *addrPtr;
						hardwareUART.SendMessage("0x");
						hardwareUART.WriteUint32AsText(data);
						hardwareUART.SendMessage("\r\n");
					}
					break;
					case '4': // sync
					{
						hardwareUART.Sync();
					}
					break;
					case '5': // write
					{
						uint32_t addr = hardwareUART.ReadUint32FromText();
						uint32_t data = hardwareUART.ReadUint32FromText();
						hardwareUART.Sync();
						volatile uint32_t* addrPtr = (uint32_t*)addr;
						*addrPtr = data;
					}
					break;
					case '6': // read
					{
						uint32_t addr = hardwareUART.ReadUint32FromText();
						volatile uint32_t* addrPtr = (uint32_t*)addr;
						uint32_t data = *addrPtr;
						hardwareUART.SendMessage("0x");
						hardwareUART.WriteUint32AsText(data);
						hardwareUART.SendMessage("\r\n");
					}
					break;
					default:
					{
						hardwareUART.SendByte(readData);
					}
					break;
				}
			}
		}
	}
}
