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

	uint32_t CPU0::ReadUint32()
	{
		uint32_t result = 0;
		for (int i = 0; i < 4; i++)
		{
			while(!HasData());

			uint8_t byte = ReadByte();
			result = (result << 8) | byte;
		}

		return result;
	}

	uint32_t CPU0::ReadUint32FromText()
	{
		uint32_t result = 0;
		for (int i = 0; i < 8; i++)
		{
			while(!HasData());

			uint8_t byte = ReadByte();
			uint8_t hexPart = 0;
			switch (byte)
			{
				case '0': hexPart = 0; break;
				case '1': hexPart = 1; break;
				case '2': hexPart = 2; break;
				case '3': hexPart = 3; break;
				case '4': hexPart = 4; break;
				case '5': hexPart = 5; break;
				case '6': hexPart = 6; break;
				case '7': hexPart = 7; break;
				case '8': hexPart = 8; break;
				case '9': hexPart = 9; break;
				case 'a': hexPart = 10; break;
				case 'b': hexPart = 11; break;
				case 'c': hexPart = 12; break;
				case 'd': hexPart = 13; break;
				case 'e': hexPart = 14; break;
				case 'f': hexPart = 15; break;
				case '\n': return result;
			}
			result = (result << 4) | hexPart;
			SendByte(byte);
		}

		SendMessage("\r\n");

		return result;
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
					case '2':
					{
						SendMessage("Enter address in 8-symbol hex:\r\n");
						uint32_t addr = ReadUint32FromText();
						if ((addr & 0x3) != 0)
						{
							SendMessage("Address is not 4 byte aligned:\r\n");
							break;
						}

						SendMessage("Enter data in 8-symbol hex:\r\n");
						uint32_t data = ReadUint32FromText();

						volatile uint32_t* addrPtr = (uint32_t*)addr;
						*addrPtr = data;
						SendMessage("Done!\r\n");
					}
					break;
					default:
					{
						SendByte(readData);
					}
					break;
				}
			}
		}
	}
}
