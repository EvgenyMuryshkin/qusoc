#ifndef HARDARE_PWM_H
#define HARDARE_PWM_H
#include <stdint.h>
#include <stdbool.h>

namespace qusoc
{
	class HardwarePWM
	{
		volatile uint32_t* _ptr;
		uint32_t _value;
		uint32_t _min;
		uint32_t _max;

		private:
			void UpdatePtr()
			{
				*_ptr = _value;
			}

		public:
			HardwarePWM(volatile uint32_t* ptr, uint32_t min, uint32_t max)
			{
				_ptr = ptr;
				_min = min;
				_max = max;
				_value = _min;	
				UpdatePtr();
			}

			void SetRatio(float value)
			{
				uint32_t range = _max - _min;
				uint32_t delta = (uint32_t)(value * range);
				_value = _min + delta;
				UpdatePtr();
			}

			void SetExact(uint32_t value)
			{
				_value = value;
				UpdatePtr();
			}

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
