#include "CPU1.h"
#include <stdint.h>
#include <stdbool.h>
#include <math.h>
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
		//instance.WS2812Test();
		//instance.PWMTest();
		//instance.TrigTest();
		instance.CounterTest();
	}

	void CPU1::CounterTest()
	{
		uint32_t counter = 0;
		while (true)
		{
			counter++;
			AXISoCQuadCore_SOC_Reg1 = counter;
			_wait.Clocks(50000000);
		}
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

	void CPU1::TrigTest()
	{
		//uint32_t counter = 0;
		//float s = 3.14;
		//float delta = 0.1;
		//
		//while (true)
		//{
		//	uint32_t operation = AXISoCQuadCore_SOC_PWM0;
		//	if (operation) 
		//	{
		//		float result = 0;
		//		float op1 = *((volatile float*)AXISoCQuadCore_SOC_PWM1_Ptr);
		//		float op2 = *((volatile float*)AXISoCQuadCore_SOC_PWM2_Ptr);
		//
		//		switch (operation)
		//		{
		//			case 1:
		//				result = op1 + op2;
		//				break;
		//			case 2:
		//				result = op1 - op2;
		//				break;
		//			case 3:
		//				result = op1 * op2;
		//				break;
		//			case 4:
		//				result = op1 / op2;
		//				break;
		//			case 5:
		//				result = sin(op1);
		//				break;
		//			case 6:
		//				result = cos(op1);
		//				break;
		//		}
		//
		//		AXISoCQuadCore_SOC_PWM3 = *((uint32_t*)&result);
		//		AXISoCQuadCore_SOC_PWM0 = 0;
		//	}
		//
		//	//float sinValue = sin(s);
		//	//float cosValue = cos(s);
		//	//
		//	//AXISoCQuadCore_SOC_PWM3 = *((uint32_t*)&result);
		//	//AXISoCQuadCore_SOC_PWM1 = *((uint32_t*)&sinValue);
		//	//AXISoCQuadCore_SOC_PWM2 = *((uint32_t*)&cosValue);
		//
		//
		//	counter++;
		//	AXISoCQuadCore_SOC_Reg1 = counter >> 14;
		//
		//	//_wait.Clocks(500000000);
		//}
	}

	void CPU1::PWMTest()
	{
		uint32_t counter = 0;
		/*
		uint32_t min = 50000;
		uint32_t max = 100000;
		uint32_t delta = max - min;

		uint8_t t[] = {
			1,2,3,4,5,6,7,8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,22,23,24,25,26,27, 28, 29, 30,
			1,2,3,4,5,6,7,8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19//, 20, 21,22,23,24,25,26,27, 28, 29, 30
		};
		while (true)
		{
			for (int i = 0; i < sizeof(t); i++)
			{
				counter++;
				AXISoCQuadCore_SOC_Reg1 = counter;

				float v = 1.0;
				float dv = v * delta;
				//float dv1 = dv * 1.3;
				//float dv2 = dv1 * 1.3;
				_wait.Clocks(10000000 + i);
			}
		}

		return;

		//AXISoCQuadCore_SOC_Reg1 = 1;
		//float v = 1.0;
		//float dv = v * delta;
		//uint32_t cast = (uint32_t)(dv);

		//HardwarePWM pwm0(AXISoCQuadCore_SOC_PWM0_Ptr, 50000, 100000);
		

		//pwm0.SetExact(100000);
		//pwm0.SetRatio(1.0);
		float v = 1.3;
		float dv = v * delta;
		//AXISoCQuadCore_SOC_Reg0_Float = dv; // works
		//AXISoCQuadCore_SOC_Reg0 = dv; // works
		uint32_t cast = (uint32_t)(dv);
		AXISoCQuadCore_SOC_PWM0 = cast;

		return;
		*/

		//while (true)
		//{
		//	_wait.Clocks(1000000); // 20ms
		//	counter++;
		//	AXISoCQuadCore_SOC_Reg1 = counter >> 4;
		//	AXISoCQuadCore_SOC_PWM0 = cast;
		//	//pwm0.SetExact(100000);
		//	//pwm0.SetRatio(1.0);
		//}

		//HardwarePWM pwm0(AXISoCQuadCore_SOC_PWM0_Ptr, 50000, 100000);
		//
		//float step = 0.1;
		//float value = 0;
		//
		////value += step;
		////AXISoCQuadCore_SOC_Reg0_Float = value;
		////value += step;
		////AXISoCQuadCore_SOC_Reg0_Float = value;
		////value += step;
		////AXISoCQuadCore_SOC_Reg0_Float = value;
		////
		////return;
		//
		//uint32_t min = 50000;
		//uint32_t max = 100000;
		//uint32_t delta = max - min;
		//
		//float values[] = { 0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1 };
		//
		//while (true)
		//{
		//	//for (uint32_t i = 65; i < 80; i++)
		//	//{
		//	//	_wait.Clocks(50000001);
		//	//	*AXISoCQuadCore_SOC_UART_Ptr = i;
		//	//}
		//	for (int i = 0; i < 11; i++)
		//	{
		//		_wait.Clocks(2000000); // 40ms	
		//		pwm0.SetRatio(values[i]);
		//		//float s = 0.8;
		//		//float r = s/*values[8]*/ * delta;//0.9 * delta;
		//		//uint32_t ur = (uint32_t)r;
		//		//uint32_t f = min + ur;
		//		//pwm0.SetExact(f);
		//		////pwm0.SetRatio(0.9/*values[8]*/);
		//		//AXISoCQuadCore_SOC_Reg1 = ur; 
		//		//AXISoCQuadCore_SOC_PWM0 = delta;// correct
		//		//AXISoCQuadCore_SOC_PWM1 = ur;//23616, wrong
		//		//AXISoCQuadCore_SOC_PWM2 = f;//73616
		//		//AXISoCQuadCore_SOC_PWM3 = *((uint32_t*)&r);
		//		//AXISoCQuadCore_SOC_PWM4 = *((uint32_t*)&s);
		//		//float s = 0.1;
		//		//float d = 50000;
		//		//float m = s * d;
		//		////AXISoCQuadCore_SOC_PWM2 = *((uint32_t*)&s);
		//		////AXISoCQuadCore_SOC_PWM3 = *((uint32_t*)&d);
		//		//AXISoCQuadCore_SOC_PWM4 = *((uint32_t*)&m);
		//		//AXISoCQuadCore_SOC_Reg0_Float = m;
		//		//return;
		//	}
		//}
		return;

		/*
		//while (true)
		for (int i = 0; i < 30; i++)
		{
			//_wait.Clocks(1000000); // 20ms
		
			value += step;
			
			if (value <= 0.0)
			{
				value = 0;
				step = -step;
			}
			
			if (value >= 1.0) 
			{
				value = 1.0;
				step = -step;
			}

			AXISoCQuadCore_SOC_Reg0_Float = value;
			//AXISoCQuadCore_SOC_Reg0_Float = step;
			//pwm0.SetRatio(value);
			
			/*
			value = 0.5;
			value += step;
			
			uint32_t rigth = min + (uint32_t)(delta * value);

			//uint32_t r = min + t;
			//pwm0.SetRatio(1.0);
			//pwm0.SetExact(min);
			pwm0.SetExact(rigth);
			* /

			//uint32_t r = 50000 * value;
			//AXISoCQuadCore_SOC_PWM0 = r;
		
			//counter++;
			//AXISoCQuadCore_SOC_Reg1 = counter >> 4;
		}
		*/
		/*
		uint32_t pwmMin = 50000;
		uint32_t pwmMax = 100000;
		uint32_t pwm0 = pwmMin;
		uint32_t pwm1 = pwmMin;


		uint32_t pwm0Delta = 2000;
		uint32_t pwm1Delta = 1000;

		while (true)
		{
			counter++;
			AXISoCQuadCore_SOC_Reg1 = counter >> 4;

			//if (AXISoCQuadCore_SOC_Switch0 == 1)
			{
				AXISoCQuadCore_SOC_PWM0 = pwm0;
				AXISoCQuadCore_SOC_PWM1 = pwm1;

				HardwarePWM::Step(&pwm0, &pwm0Delta, pwmMin, pwmMax);
				HardwarePWM::Step(&pwm1, &pwm1Delta, pwmMin, pwmMax);
			}

			_wait.Clocks(1000000); // 20ms
		}		
		*/
	}
}
