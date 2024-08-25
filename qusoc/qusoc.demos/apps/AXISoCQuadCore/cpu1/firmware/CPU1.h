#ifndef CPU1_H
#define CPU1_H
#include <stdint.h>
#include <stdbool.h>
#include "soc.h"
#include "utils/wait.h"
using namespace qusoc;

namespace AXISoCQuadCore
{
	class CPU1
	{
		public: 
			static void EntryPoint();

		private:
			CPU1Wait _wait;

			void PWMTest();
			void WS2812Test();
			void HardcodedValues();
			void FPUTest();
			void TrigTest();
	};
}
#endif
