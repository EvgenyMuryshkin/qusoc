#ifndef HARDARE_PWM_H
#define HARDARE_PWM_H
#include <stdint.h>
#include <stdbool.h>

namespace qusoc
{
	class HardwarePWM
	{
		public:
			static void Step(uint32_t* pwmPtr, uint32_t* stepPtr, uint32_t min, uint32_t max)
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
	};
}
#endif
