#ifndef __MIRF_SPI_DRIVER
#define __MIRF_SPI_DRIVER

extern "C" {
	#include <string.h>
	#include <inttypes.h>
}

class MirfSpiDriver {
	public:
		uint8_t transfer(uint8_t data);

		void begin();
		void end();
};

#endif
