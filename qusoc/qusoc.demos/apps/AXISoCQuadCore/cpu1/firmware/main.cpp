#include <stdint.h>
#include <stdbool.h>

#include "soc.h"
#include "CPU1.h"

// main is called from start.S assembly file
void main() {
	AXISoCQuadCore::CPU1::EntryPoint();
}
