#ifndef WS2812_PATTERNS_H
#define WS2812_PATTERNS_H
#include <stdint.h>
#include <stdbool.h>

namespace qusoc
{
	class LED8x8
	{
		public:
			static uint8_t StopSign[];
			static uint8_t RightArrow[];
			static uint8_t LeftArrow[];
	};
}
#endif
