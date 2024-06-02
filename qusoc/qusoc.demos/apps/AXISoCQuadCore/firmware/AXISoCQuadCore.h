#ifndef AXISoCQuadCore_H
#define AXISoCQuadCore_H
#include <stdint.h>
#include <stdbool.h>
#include "soc.h"
namespace AXISoCQuadCore
{
	class CPU0
	{
		public: 
			static void EntryPoint();
		private:
			static void SendByte(uint8_t byte);
			static void SendMessage(char* message);
			static bool HasData();
			static uint8_t ReadByte();
			static uint32_t ReadUint32();
			static uint32_t ReadUint32FromText();
			static void Write4BitAsText(uint8_t data);
			static void WriteByteAsText(uint8_t data);
			static void WriteUint32AsText(uint32_t data);
	};
}
#endif
