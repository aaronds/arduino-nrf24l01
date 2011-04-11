#include "MirfHardwareSpiDriver.h"
#include <HardwareSerial.h>

uint8_t MirfHardwareSpiDriver::transfer(uint8_t data){
	return SPI.transfer(data);
}

void MirfHardwareSpiDriver::begin(){
	Serial.println("Begining SPI");
	SPI.begin();
	SPI.setBitOrder(SPI_MODE1);
	SPI.setClockDivider(SPI_CLOCK_DIV2);
	SPI.setClockDivider(SPI_2XCLOCK_MASK);
}

void MirfHardwareSpiDriver::end(){
}

MirfHardwareSpiDriver MirfHardwareSpi;
