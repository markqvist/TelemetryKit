#include <TelemetryKit.h>

#define BUFFER_SIZE 256
#define TX_EVERY_N 2

int count = 0;
size_t readLength = 0;
unsigned long time = 0;
char buffer[BUFFER_SIZE];


void telemetryKitCallback(char *packet, size_t length) { }

void setup() {
  Serial.begin(38400); // Set this to baudrate of GPS
  TelemetryKitInit();
}

void loop() {
  
  while (Serial.available() && readLength < BUFFER_SIZE) {
    buffer[readLength++] = Serial.read();
    time = millis();
  }
  
  if (millis() - time > 4 && readLength > 0) {
    if (count+1 == TX_EVERY_N) {
      Serial.print("Transmitting "); Serial.print(readLength); Serial.println(" bytes");
      TelemetryKitTransmit(buffer, readLength);
      readLength = 0;
      count = 0;
    } else {
      count++;
      readLength = 0;
    }
  }
  
}