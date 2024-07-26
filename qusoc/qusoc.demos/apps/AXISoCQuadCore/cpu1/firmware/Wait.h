#ifndef WAIT_H
#define WAIT_H
#include <stdint.h>
#include <stdbool.h>

namespace AXISoCQuadCore
{
	class IWait
	{
		public:
			virtual void Clocks(uint32_t clocks) = 0;
	};

	class Wait
	{
		public:
			static void Clocks(volatile uint32_t* autoDecrement, uint32_t clocks);
	};

	class CPU1Wait : public IWait
	{
		public:
			 void Clocks(uint32_t clocks);
	};
}
#endif
