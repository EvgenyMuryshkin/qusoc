#ifndef Hardware_WS2812_H
#define Hardware_WS2812_H
#include <stdint.h>
#include <stdbool.h>
#include "wait.h"

namespace AXISoCQuadCore
{
	class HardwareWS2812
	{
		private:
			IWait* _wait;
			volatile uint32_t* _ptr;

			void Word(uint32_t value)
			{
				while (*_ptr != 1) {}
				*_ptr = value;
			}

		public:
			HardwareWS2812(IWait* wait, volatile uint32_t* ptr)
			{
				_wait = wait;
				_ptr = ptr;
			}

			void ByteArray(uint32_t color, uint32_t length, uint8_t buff[])
			{
				for (int i = 0; i < length; i++)
				{
					uint32_t s = buff[i];

					for (int p = 0; p < 8; p++)
					{
						if ((s & 0x80) == 0x80)
						{
							Word(color);
						}
						else
						{
							Word(0x000000);
						}

						s = s << 1;
					}
				}

				_wait->Clocks(500000);
			}
	};
}
#endif
