#include <stdint.h>
#include <stdbool.h>
#include "Wait.h"
#include "soc.h"

namespace AXISoCQuadCore
{
	void Wait::Clocks(volatile uint32_t* autoDecrement, uint32_t clocks)
	{
		*autoDecrement = clocks;
		while (*autoDecrement != 0) {}
	}

	void CPU1Wait::Clocks(uint32_t clocks)
	{
		Wait::Clocks(AXISoCQuadCore_SOC_CPU1_AutoDecrement_Ptr, clocks);
	}
}
