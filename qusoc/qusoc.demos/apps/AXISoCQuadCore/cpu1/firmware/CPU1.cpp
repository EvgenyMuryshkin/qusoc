#include "CPU1.h"
#include <stdint.h>
#include <stdbool.h>
#include "soc.h"

namespace AXISoCQuadCore
{
	void CPU1::EntryPoint()
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
			if (AXISoCQuadCore_SOC_CPU1_AutoDecrement == 0)
			{
				counter++;
				AXISoCQuadCore_SOC_Reg1 = counter >> 4;

				if (AXISoCQuadCore_SOC_Switch0 == 1)
				{
					AXISoCQuadCore_SOC_PWM0 = pwm0;
					AXISoCQuadCore_SOC_PWM1 = pwm1;

					PWMValue(&pwm0, &pwm0Delta, pwmMin, pwmMax);
					PWMValue(&pwm1, &pwm1Delta, pwmMin, pwmMax);
				}

				AXISoCQuadCore_SOC_CPU1_AutoDecrement = 1000000; // 20ms
			}
		}
	}

	void CPU1::PWMValue(uint32_t* pwmPtr, uint32_t* stepPtr, uint32_t min, uint32_t max)
	{
		uint32_t pwm = *pwmPtr;
		uint32_t step = *stepPtr;

		pwm += step;

		if (pwm < min)
		{
			pwm = min;
			*stepPtr = -step;
		}

		if (pwm > max)
		{
			pwm = max;
			*stepPtr = -step;
		}

		*pwmPtr = pwm;
	}
}
