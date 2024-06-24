#ifndef HardwareUART_H
#define HardwareUART_H
#include <stdint.h>
#include <stdbool.h>

namespace qusoc
{
	struct HardwareUART
	{
		private:
			volatile uint8_t* uartBytes = ((volatile uint8_t*)0x90000000);

		public:
			HardwareUART(/*uint32_t address*/);
			void SendByte(uint8_t byte);
			void SendMessage(char* message);
			bool HasData();
			uint8_t ReadByte();
			uint32_t ReadUint32();
			uint32_t ReadUint32FromText();
			void Write4BitAsText(uint8_t data);
			void WriteByteAsText(uint8_t data);
			void WriteUint32AsText(uint32_t data);
	};
}
#endif