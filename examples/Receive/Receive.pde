#include <TelemetryKit.h>

void telemetryKitCallback(char *packet, size_t length) {
  packet[length] = 0; // Null terminate string for println

  Serial.print("Received "); Serial.print(length); Serial.println(" bytes: ");
  Serial.println(packet);
}

void setup() {
  Serial.begin(9600);
  TelemetryKitInit();
}

void loop() {
  while (true) {
    TelemetryKitPoll();
  }
}