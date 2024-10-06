#ifndef CPU0_H
#define CPU0_H
#include <stdint.h>
#include <stdbool.h>
#include "soc.h"
namespace AXISoCQuadCore
{
	class CPU0
	{
		public: 
			static void EntryPoint();
			static void Counter(uint32_t delay);
			static void Increment(uint32_t* counter);
	};
}
#endif
