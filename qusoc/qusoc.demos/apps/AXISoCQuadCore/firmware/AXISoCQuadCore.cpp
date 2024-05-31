#include "AXISoCQuadCore.h"
#include <stdint.h>
#include <stdbool.h>
#include "soc.h"
namespace AXISoCQuadCore
{
	volatile uint8_t* uartBytes = ((volatile uint8_t*)0x90000000);

	void CPU0::SendByte(uint8_t byte)
	{
		uartBytes[0] = byte;
		while (uartBytes[2] != 0);
	}

	void CPU0::SendMessage(char* message)
	{
		if (message == 0)
			return;

		while (message[0] != 0)
		{
			SendByte(message[0]);
			message++;
		}
	}

	bool CPU0::HasData()
	{
		uint8_t hasData = uartBytes[1];
		return hasData != 0;
	}

	uint8_t CPU0::ReadByte()
	{
		uint8_t readData = uartBytes[0];
		return readData;
	}

	void CPU0::EntryPoint()
	{
		uint32_t counter = 0;
		while (true)
		{
			(counter++);
			AXISoCQuadCore_SOC_Reg0 = counter;

			if (HasData())
			{
				uint8_t readData = ReadByte();

				switch (readData)
				{
					case '0':
					{
						SendMessage("Hello World!\r\n");
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
					default:
						SendByte(readData);
					break;
				}
			}
		}
	}
}
