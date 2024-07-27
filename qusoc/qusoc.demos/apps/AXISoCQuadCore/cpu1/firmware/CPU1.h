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
			static void Run();
			void PWMTest();
			void WS2812Test();
	};
}
#endif
