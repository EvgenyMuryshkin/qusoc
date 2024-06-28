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
	};
}
#endif
