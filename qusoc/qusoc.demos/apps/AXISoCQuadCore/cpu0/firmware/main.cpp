#include <stdint.h>
#include <stdbool.h>

#include "soc.h"
#include "CPU0.h"

// main is called from start.S assembly file
void main() {
	AXISoCQuadCore::CPU0::EntryPoint();
}
