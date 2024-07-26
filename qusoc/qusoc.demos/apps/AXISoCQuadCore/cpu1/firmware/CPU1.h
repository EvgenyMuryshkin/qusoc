#ifndef CPU1_H
#define CPU1_H
#include <stdint.h>
#include <stdbool.h>
#include "soc.h"
namespace AXISoCQuadCore
{
	class CPU1
	{
		public: 
			static void EntryPoint();

		private:
			static uint8_t stopSign[];
			static uint8_t rightArrow[];
			static uint8_t leftArrow[];
			static void PWMValue(uint32_t* pwmPtr, uint32_t* stepPtr, uint32_t min, uint32_t max);
			static void HoldValue(bool value, uint32_t clocks);
			static void Bit(bool value);
			static void Byte(uint8_t value);
			static void Word(uint32_t value);
			static void EndTX();
			static void WS2812_ByteArray(uint32_t color, uint32_t length, uint8_t buff[]);
	};
}
#endif
