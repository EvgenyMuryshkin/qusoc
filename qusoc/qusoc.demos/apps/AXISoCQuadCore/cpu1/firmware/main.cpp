#include <stdint.h>
#include <stdbool.h>

#include "soc.h"
#include "CPU1.h"

// main is called from start.S assembly file
int main() {
	AXISoCQuadCore::CPU1::EntryPoint();
	return 0;
}
