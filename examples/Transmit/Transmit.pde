#include <TelemetryKit.h>

void telemetryKitCallback(char *packet, size_t length) { }

void setup() {
  Serial.begin(9600);
  
  TelemetryKitInit();
}

void loop() {
  while (true) {
      char msg[] = "Hello world! This is a string to be transmitted.\n";
      TelemetryKitTransmit(msg, sizeof(msg));
      delay(1000);
  }
  
}