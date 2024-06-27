#include "HardwareUART.h"
#include <stdint.h>
#include <stdbool.h>

namespace qusoc
{
	HardwareUART::HardwareUART(/*uint32_t address*/)
	{
		//uartBytes = ((volatile uint8_t*)address);
	}

	void HardwareUART::SendByte(uint8_t byte)
	{
		while (uartBytes[3] != 0);
		uartBytes[0] = byte;
	}

	void HardwareUART::SendMessage(char* message)
	{
		if (message == 0)
			return;

		while (message[0] != 0)
		{
			SendByte(message[0]);
			message++;
		}
	}

	bool HardwareUART::HasData()
	{
		uint8_t hasData = uartBytes[1];
		return hasData != 0;
	}

	uint8_t HardwareUART::ReadByte()
	{
		uint8_t readData = uartBytes[0];
		return readData;
	}

	uint32_t HardwareUART::ReadUint32()
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

	uint32_t HardwareUART::ReadUint32FromText()
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
				case 'a': 
				case 'A':
					hexPart = 10; break;
				case 'b': 
				case 'B': 
					hexPart = 11; break;
				case 'c': 
				case 'C': 
					hexPart = 12; break;
				case 'd': 
				case 'D': 
					hexPart = 13; break;
				case 'e': 
				case 'E': 
					hexPart = 14; break;
				case 'f': 
				case 'F': 
					hexPart = 15; break;
				case '\n': return result;
			}
			result = (result << 4) | hexPart;
			SendByte(byte);
		}

		SendMessage("\r\n");

		return result;
	}

	void HardwareUART::Write4BitAsText(uint8_t data)
	{
		switch (data & 0xF)
		{
			case 0: SendByte('0'); break;
			case 1: SendByte('1'); break;
			case 2: SendByte('2'); break;
			case 3: SendByte('3'); break;
			case 4: SendByte('4'); break;
			case 5: SendByte('5'); break;
			case 6: SendByte('6'); break;
			case 7: SendByte('7'); break;
			case 8: SendByte('8'); break;
			case 9: SendByte('9'); break;
			case 10: SendByte('A'); break;
			case 11: SendByte('B'); break;
			case 12: SendByte('C'); break;
			case 13: SendByte('D'); break;
			case 14: SendByte('E'); break;
			case 15: SendByte('F'); break;
		}
	}

	void HardwareUART::WriteByteAsText(uint8_t data)
	{
		Write4BitAsText(data >> 4);
		Write4BitAsText(data);
	}

	void HardwareUART::WriteUint32AsText(uint32_t data)
	{
		WriteByteAsText(data >> 24);
		WriteByteAsText(data >> 16);
		WriteByteAsText(data >> 8);
		WriteByteAsText(data);
	}
}