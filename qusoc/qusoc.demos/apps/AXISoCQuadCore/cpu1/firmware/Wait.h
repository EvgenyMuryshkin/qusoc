#ifndef WAIT_H
#define WAIT_H
#include <stdint.h>
#include <stdbool.h>
#include "soc.h"

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
			static void Clocks(volatile uint32_t* autoDecrement, uint32_t clocks)
			{
				*autoDecrement = clocks;
				while (*autoDecrement != 0) {}
			}
	};

	class CPUWait : public IWait
	{
		protected:
			volatile uint32_t* autoDecrement;
		public:
			CPUWait(volatile uint32_t* autoDecrement)
			{
				this->autoDecrement = autoDecrement;
			}
	};

	class CPU1Wait : public CPUWait
	{
		public:
			CPU1Wait() : CPUWait(AXISoCQuadCore_SOC_CPU1_AutoDecrement_Ptr)
			{

			}

			void Clocks(uint32_t clocks)
			{
				Wait::Clocks(autoDecrement, clocks);
			}
	};
}
#endif
