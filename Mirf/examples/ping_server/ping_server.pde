/**
 * An Mirf example which copies back the data it recives.
 *
 * Pins:
 * Hardware SPI:
 * MISO -> 12
 * MOSI -> 11
 * SCK -> 13
 *
 * Configurable:
 * CE -> 8
 * CSN -> 7
 *
 */

#include <Spi.h>
#include <mirf.h>
#include <nRF24L01.h>

void setup(){
  Serial.begin(9600);
  
  /*
   * Setup pins / SPI.
   */
   
  Mirf.init();
  
  /*
   * Configure reciving address.
   */
   
  Mirf.setRADDR((byte *)"serv1");
  
  /*
   * Set the payload length to sizeof(unsigned long) the
   * return type of millis().
   *
   * NB: payload on client and server must be the same.
   */
   
  Mirf.payload = sizeof(unsigned long);
  
  /*
   * Write channel and payload config then power up reciver.
   */
   
  Mirf.config();
  
  Serial.println("Listening..."); 
}

void loop(){
  /*
   * A buffer to store the data.
   */
   
  byte data[Mirf.payload];
  
  /*
   * If a packet has been recived.
   */
  if(Mirf.dataReady()){
    
    do{
      Serial.println("Got packet");
    
      /*
       * Get load the packet into the buffer.
       */
     
      Mirf.getData(data);
    
      /*
       * Set the send address.
       */
     
     
      Mirf.setTADDR((byte *)"clie1");
    
      /*
       * Send the data back to the client.
       */
     
      Mirf.send(data);
    
      /*
       * Wait untill sending has finished
       *
       * NB: isSending returns the chip to receving after returning true.
       */
     
      while(Mirf.isSending()){
        delay(100);
      }
      
      Serial.println("Reply sent.");
    }while(!Mirf.rxFifoEmpty());
  }
}
