#include <stdint.h>
#include <stdbool.h>

#include "soc.h"
#include "AXISoCQuadCore.h"

// main is called from start.S assembly file
void main() {
	AXISoCQuadCore::CPU0::EntryPoint();
}
