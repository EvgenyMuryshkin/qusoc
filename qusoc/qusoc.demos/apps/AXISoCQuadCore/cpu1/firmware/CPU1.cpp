#include "CPU1.h"
#include <stdint.h>
#include <stdbool.h>
#include "soc.h"
#include "utils/wait.h"
#include "drivers/hardware/pwm.h"
#include "drivers/hardware/ws2812.h"
#include "utils/ws2812patterns.h"
using namespace qusoc;

namespace AXISoCQuadCore
{
	void CPU1::EntryPoint()
	{
		CPU1 instance;
		instance.WS2812Test();
	}

	void CPU1::HardcodedValues()
	{
		while(true)
		{
			AXISoCQuadCore_SOC_PWM0 = 1;
			AXISoCQuadCore_SOC_Reg1 = true;
			AXISoCQuadCore_SOC_Reg1 = false;
			AXISoCQuadCore_SOC_Reg1 = true;
			AXISoCQuadCore_SOC_Reg1 = false;
			AXISoCQuadCore_SOC_Reg1 = true;
			AXISoCQuadCore_SOC_Reg1 = false;
			AXISoCQuadCore_SOC_Reg1 = false;
			AXISoCQuadCore_SOC_Reg1 = false;
			AXISoCQuadCore_SOC_Reg1 = false;
		}
	}

	void CPU1::FPUTest()
	{
		//uint32_t c = 2546;
		//float f = 1.5763;

		//float r = f * c;
		//AXISoCQuadCore_SOC_Reg0_Float = r;
		//for (uint32_t i = 0; i < 5; i++)
		//{
		//	f = f + i;
		//	AXISoCQuadCore_SOC_Reg0 = f;//c;
		//	//c += i;
		//	//AXISoCQuadCore_SOC_Reg0 = c;
		//}
	}

	void CPU1::WS2812Test()
	{
		HardwareWS2812 ws2812(&_wait, AXISoCQuadCore_SOC_WS2812_Ptr);

		uint32_t counter = 0;
		constexpr uint8_t* data[] = { LED8x8::StopSign, LED8x8::RightArrow, LED8x8::LeftArrow };
		uint32_t colors[] = { 0x010000, 0x000100, 0x000100 };

		while (true)
		{
			for (uint8_t s = 0; s < 3; s++)
			{
				ws2812.ByteArray(colors[s], 8, data[s]);
				_wait.Clocks(50000000);
			}

			counter++;
			AXISoCQuadCore_SOC_Reg1 = counter;
			//_wait.Clocks(50000000);
		}
	}

	void CPU1::PWMTest()
	{
		uint32_t counter = 0;
		uint32_t pwmMin = 50000;
		uint32_t pwmMax = 100000;
		uint32_t pwm0 = pwmMin;
		uint32_t pwm1 = pwmMin;


		uint32_t pwm0Delta = 2000;
		uint32_t pwm1Delta = 1000;

		while (true)
		{
			_wait.Clocks(1000000); // 20ms

			counter++;
			AXISoCQuadCore_SOC_Reg1 = counter >> 4;

			if (AXISoCQuadCore_SOC_Switch0 == 1)
			{
				AXISoCQuadCore_SOC_PWM0 = pwm0;
				AXISoCQuadCore_SOC_PWM1 = pwm1;

				HardwarePWM::Step(&pwm0, &pwm0Delta, pwmMin, pwmMax);
				HardwarePWM::Step(&pwm1, &pwm1Delta, pwmMin, pwmMax);
			}
		}
	}
}
