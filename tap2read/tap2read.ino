#include "ST25DVSensor.h"

#define SerialPort      Serial

#if defined(ARDUINO_B_L4S5I_IOT01A)
// Pin definitions for board B-L4S5I_IOT01A
  #define GPO_PIN PE4
  #define LPD_PIN PE2
  #define SDA_PIN PB11
  #define SCL_PIN PB10
  #define WireNFC MyWire
  TwoWire MyWire(SDA_PIN, SCL_PIN);
  ST25DV st25dv(12, -1, &MyWire);
#else
  #define DEV_I2C         Wire
  ST25DV st25dv(12, -1, &DEV_I2C);
#endif

void setup() {
  st25dv.begin();
  const char uri_write_message[] = "10.1.0.250/tap2read"; //faild 2 read php wtf
  String uri_write = String(uri_write_message);
  st25dv.writeURI(uri_write, "", "");
}
// self hosted: see it works on my machine
// had to make the php file into an index.ph in the tap2read folder to get it to work. derp
void loop() {} 
