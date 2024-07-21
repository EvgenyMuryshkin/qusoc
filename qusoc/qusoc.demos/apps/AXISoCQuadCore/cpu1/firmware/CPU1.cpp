#include "CPU1.h"
#include <stdint.h>
#include <stdbool.h>
#include "soc.h"

namespace AXISoCQuadCore
{
	void CPU1::EntryPoint()
	{
		uint32_t counter = 0;
		uint8_t data[] = 
		{
			0x18,
			0x18,
			0x18,
			0x18,
			0x18,
			0x18,
			0x7E,
			0x7E
		};

		while (true)
		{
			for (int i = 0; i < 8; i++)
			{
				uint8_t s = data[i];
				for (int p = 0; p < 8; p++)
				{
					if (s & 1 == 1)
					{
						Word(0x000001);
					}
					else
					{
						Word(0x000000);
					}
					s = s >> 1;
				}
			}
			//while (AXISoCQuadCore_SOC_WS2812 != 1) {}
			//AXISoCQuadCore_SOC_WS2812 = 1;//(uint8_t)counter;//0xA;

			counter += 16;
			//continue;

			AXISoCQuadCore_SOC_CPU1_AutoDecrement = 25000000; // 1ms
			while (AXISoCQuadCore_SOC_CPU1_AutoDecrement != 0) {}

			//counter++;
			AXISoCQuadCore_SOC_Reg1 = counter >> 4;
		}

		while (true)
		{
			if (AXISoCQuadCore_SOC_CPU1_AutoDecrement == 0)
			{
				while (AXISoCQuadCore_SOC_WS2812 != 1)
				{

				}

				AXISoCQuadCore_SOC_WS2812 = 0xA5A5A5A5;
				counter++;
				AXISoCQuadCore_SOC_Reg1 = counter >> 4;

				//if (AXISoCQuadCore_SOC_Switch0 == 1)
				//{
				//	AXISoCQuadCore_SOC_PWM0 = pwm0;
				//	AXISoCQuadCore_SOC_PWM1 = pwm1;
				//
				//	PWMValue(&pwm0, &pwm0Delta, pwmMin, pwmMax);
				//	PWMValue(&pwm1, &pwm1Delta, pwmMin, pwmMax);
				//}

				AXISoCQuadCore_SOC_CPU1_AutoDecrement = 1000000; // 20ms
				//uint32_t m = pwm0 * pwm1;
				//float f = 1.5;
				//float d = f * pwm0;
			}
		}

		/*
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
			//Word(0);
		}
		*/

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
	
		/*
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
				//uint32_t m = pwm0 * pwm1;
				//float f = 1.5;
				//float d = f * pwm0;
			}
		}
		*/
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

	void CPU1::HoldValue(bool value, uint32_t clocks)
	{
		AXISoCQuadCore_SOC_CPU1_AutoDecrement = clocks;
		AXISoCQuadCore_SOC_PWM0 = value;
		//AXISoCQuadCore_SOC_PWM2 = value;
		while (AXISoCQuadCore_SOC_CPU1_AutoDecrement != 0) {}
	}

	void CPU1::Bit(bool value)
	{
		if (value)
		{
			HoldValue(true, 40); // 800 ns is 40 clocks
			HoldValue(false, 12); // 450 ns is 12 clocks
		}
		else
		{
			HoldValue(true, 20); // 400 ns
			HoldValue(false, 43); // 850 ns
		}
	}

	void CPU1::Byte(uint8_t value)
	{
		for (int i = 0; i < 8; i++)
		{
			Bit(value & 0x80);
			value = value << 1;
		}
	}

	void CPU1::Word(uint32_t value)
	{
		while (AXISoCQuadCore_SOC_WS2812 != 1) {}
		AXISoCQuadCore_SOC_WS2812 = value;//(uint8_t)counter;//0xA;

		// send in GRB order
		//Byte(value >> 8);
		//Byte(value >> 16);
		//Byte(value >> 16);
	}

	void CPU1::EndTX()
	{
		HoldValue(false, 300000);
	}
}
