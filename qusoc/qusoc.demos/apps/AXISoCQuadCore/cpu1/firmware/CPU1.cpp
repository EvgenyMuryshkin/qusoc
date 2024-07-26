#include "CPU1.h"
#include <stdint.h>
#include <stdbool.h>
#include "soc.h"
#include "Wait.h"

namespace AXISoCQuadCore
{
	uint8_t CPU1::stopSign[] = {
		0x3C,
		0x42,
		0x89,
		0x9D,
		0xB9,
		0x91,
		0x42,
		0x3C
	};

	uint8_t CPU1::rightArrow[] = {
		0x3F,
		0x3F,
		0x0F,
		0x1F,
		0x3B,
		0x73,
		0xE0,
		0xC0
	};

	uint8_t CPU1::leftArrow[] = {
		0x03,
		0x07,
		0xCE,
		0xDC,
		0xF8,
		0xF0,
		0xFC,
		0xFC
	};
	

	void CPU1::EntryPoint()
	{
		uint32_t counter = 0;

		uint8_t* data[] = { stopSign, rightArrow, leftArrow };
		uint32_t colors[] = { 0x010000, 0x000100, 0x000100 };

		while (true)
		{
			for (uint8_t s = 0; s < 3; s++)
			{
				WS2812_ByteArray(colors[s], 8, data[s]);
				Wait::Clocks(AXISoCQuadCore_SOC_CPU1_AutoDecrement_Ptr, 25000000);
			}

			WS2812_ByteArray(0x010000, 8, stopSign);
			//WS2812_ByteArray(0x000100, 8, rightArrow);
			Wait::Clocks(AXISoCQuadCore_SOC_CPU1_AutoDecrement_Ptr, 25000000);
			//WS2812_ByteArray(0x000100, 8, leftArrow);
			//Wait(25000000);
			//WS2812_ByteArray(0x000000, 8, leftArrow);
			//Wait(25000000);
			/*
			for (int i = 0; i < 8; i++)
			{
				uint32_t s = stopSign[i];

				for (int p = 0; p < 8; p++)
				{
					if ((s & 0x80) == 0x80)
					{
						Word(0x010000);
					}
					else
					{
						Word(0x000000);
					}

					s = s << 1;
				}
			}
			*/

			counter++;
			AXISoCQuadCore_SOC_Reg1 = counter;
			//AXISoCQuadCore_SOC_CPU1_AutoDecrement = 50000000; // 1ms
			//while (AXISoCQuadCore_SOC_CPU1_AutoDecrement != 0) {}
		}

		//
		//uint8_t data[] = 
		//{
		//	0x10,
		//	0x10,
		//	0x10,
		//	0x10,
		//	0x10,
		//	0x28,
		//	0x44,
		//	0x82
		//};
		//
		//while (true)
		//{
		//	counter++;
		//
		//	uint8_t row = (counter >> 3) & 0x7;
		//	uint8_t col = counter & 0x7;
		//	for (int r = 0; r < 8; r++)
		//	{
		//		for (int c = 0; c < 8; c++)
		//		{
		//			if (row == r && col == c)
		//			{
		//				Word(0x003000);
		//			}
		//			else
		//			{
		//				Word(0x000000);
		//			}
		//		}
		//	}
		//	
		//	AXISoCQuadCore_SOC_CPU1_AutoDecrement = 5000000; // 1ms
		//	while (AXISoCQuadCore_SOC_CPU1_AutoDecrement != 0) {}
		//
		//	/*
		//	for (int i = 0; i < 8; i++)
		//	{
		//		uint8_t s = data[i];
		//		for (int p = 0; p < 8; p++)
		//		{
		//			if (s & 1 == 1)
		//			{
		//				Word(0x000001);
		//			}
		//			else
		//			{
		//				Word(0x000000);
		//			}
		//			s = s >> 1;
		//		}
		//	}
		//	*/
		//	/*
		//	//while (AXISoCQuadCore_SOC_WS2812 != 1) {}
		//	//AXISoCQuadCore_SOC_WS2812 = 1;//(uint8_t)counter;//0xA;
		//
		//	counter += 16;
		//	//continue;
		//
		//	AXISoCQuadCore_SOC_CPU1_AutoDecrement = 25000000; // 1ms
		//	while (AXISoCQuadCore_SOC_CPU1_AutoDecrement != 0) {}
		//	*/
		//
		//	//counter++;
		//	AXISoCQuadCore_SOC_Reg1 = counter >> 4;
		//}

		//while (true)
		//{
		//	if (AXISoCQuadCore_SOC_CPU1_AutoDecrement == 0)
		//	{
		//		while (AXISoCQuadCore_SOC_WS2812 != 1)
		//		{
		//
		//		}
		//
		//		AXISoCQuadCore_SOC_WS2812 = 0xA5A5A5A5;
		//		counter++;
		//		AXISoCQuadCore_SOC_Reg1 = counter >> 4;
		//
		//		//if (AXISoCQuadCore_SOC_Switch0 == 1)
		//		//{
		//		//	AXISoCQuadCore_SOC_PWM0 = pwm0;
		//		//	AXISoCQuadCore_SOC_PWM1 = pwm1;
		//		//
		//		//	PWMValue(&pwm0, &pwm0Delta, pwmMin, pwmMax);
		//		//	PWMValue(&pwm1, &pwm1Delta, pwmMin, pwmMax);
		//		//}
		//
		//		AXISoCQuadCore_SOC_CPU1_AutoDecrement = 1000000; // 20ms
		//		//uint32_t m = pwm0 * pwm1;
		//		//float f = 1.5;
		//		//float d = f * pwm0;
		//	}
		//}

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

	void CPU1::WS2812_ByteArray(uint32_t color, uint32_t length, uint8_t buff[])
	{
		for (int i = 0; i < length; i++)
		{
			uint32_t s = buff[i];

			for (int p = 0; p < 8; p++)
			{
				if ((s & 0x80) == 0x80)
				{
					Word(color);
				}
				else
				{
					Word(0x000000);
				}

				s = s << 1;
			}
		}

		Wait::Clocks(AXISoCQuadCore_SOC_CPU1_AutoDecrement_Ptr, 500000);

		//AXISoCQuadCore_SOC_CPU1_AutoDecrement = 50000000; // 1ms
		//while (AXISoCQuadCore_SOC_CPU1_AutoDecrement != 0) {}
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
