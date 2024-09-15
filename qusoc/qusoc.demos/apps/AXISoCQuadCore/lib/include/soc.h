#ifndef SOC_H
#define SOC_H

#define AXISoCQuadCore_SOC_Reg0 (*(volatile uint32_t*)0x80000004)
#define AXISoCQuadCore_SOC_Reg0_Float (*(volatile float*)0x80000004)
#define AXISoCQuadCore_SOC_Reg1 (*(volatile uint32_t*)0x80000008)
#define AXISoCQuadCore_SOC_Reg2 (*(volatile uint32_t*)0x8000000C)
#define AXISoCQuadCore_SOC_Reg3 (*(volatile uint32_t*)0x80000010)

#define AXISoCQuadCore_SOC_CPU_AutoDecrement_Ptr ((volatile uint32_t*)0x10000004)
#define AXISoCQuadCore_SOC_CPU_AutoDecrement (*AXISoCQuadCore_SOC_CPU_AutoDecrement_Ptr)

#define AXISoCQuadCore_SOC_UART_Ptr ((volatile uint32_t*)0x90000000)

#define AXISoCQuadCore_SOC_Switch0 (*(volatile uint32_t*)0x80000100)
#define AXISoCQuadCore_SOC_Switch1 (*(volatile uint32_t*)0x80000104)

#define AXISoCQuadCore_SOC_PWM0_Ptr ((volatile uint32_t*)0x90000100)
#define AXISoCQuadCore_SOC_PWM0 (*AXISoCQuadCore_SOC_PWM0_Ptr)

#define AXISoCQuadCore_SOC_PWM1_Ptr ((volatile uint32_t*)0x90000104)
#define AXISoCQuadCore_SOC_PWM1 (*AXISoCQuadCore_SOC_PWM1_Ptr)

#define AXISoCQuadCore_SOC_PWM2_Ptr ((volatile uint32_t*)0x90000108)
#define AXISoCQuadCore_SOC_PWM2 (*AXISoCQuadCore_SOC_PWM2_Ptr)

#define AXISoCQuadCore_SOC_PWM3_Ptr ((volatile uint32_t*)0x9000010C)
#define AXISoCQuadCore_SOC_PWM3 (*AXISoCQuadCore_SOC_PWM3_Ptr)

#define AXISoCQuadCore_SOC_PWM4_Ptr ((volatile uint32_t*)0x90000110)
#define AXISoCQuadCore_SOC_PWM4 (*AXISoCQuadCore_SOC_PWM4_Ptr)

#define AXISoCQuadCore_SOC_WS2812_Ptr ((volatile uint32_t*)0x90000200)
#define AXISoCQuadCore_SOC_WS2812 (*AXISoCQuadCore_SOC_WS2812_Ptr)

#endif