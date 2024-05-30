#include "AXISoCQuadCore.h"
#include <stdint.h>
#include <stdbool.h>
#include "soc.h"
namespace AXISoCQuadCore
{
	void CPU0::EntryPoint()
	{
		volatile uint8_t* uartBytes = ((volatile uint8_t*)0x90000000);
		uint32_t counter = 0;
		while(true)
		{
			(counter++);
			AXISoCQuadCore_SOC_Reg0 = counter;
			uint8_t hasData = uartBytes[1];
			if (hasData != 0)
			{
				uint8_t readData = uartBytes[0];
				uartBytes[0] = readData;
				//switch (readData)
				//{
				//	case '1':
				//	break;
				//}
			}
		}
	}
}
