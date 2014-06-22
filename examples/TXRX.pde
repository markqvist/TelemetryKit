#include <TelemetryKit.h>

void telemetryKitCallback(char *packet, size_t length) {
  Serial.print("Received packet: ");
  Serial.println(packet);
}

void setup() {
  extern Afsk modem;
  Serial.begin(9600);
  
  TelemetryKitInit();
}

void loop() {
  char msg[] = "Hello world! This is a string to be transmitted.\n";
  TelemetryKitTransmit(msg, sizeof(msg));
  
  while (true) {
    TelemetryKitPoll();
  } 
}