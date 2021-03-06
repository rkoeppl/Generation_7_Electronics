/*
  Generation 7 Electronics Setup Test

  This small application turns on the power supply,
  blinks the LED of HEATER1 ten times, then turns off
  power again. If it works, your firmware has good chances
  to work as well.

  All activities are commented over the serial line, so if
  listen there at 9600 baud and can read clear text, your
  serial line works as well.
 
  This example code is in the public domain.
*/

#define PSU_Pin 15
#define HEATER_Pin 4

void setup() {
  int i;

  Serial.begin(9600);
  pinMode(PSU_Pin, OUTPUT);
  pinMode(HEATER_Pin, OUTPUT);     
  digitalWrite(PSU_Pin, HIGH);   // initial value, off
  digitalWrite(HEATER_Pin, LOW); // intiial value, off

  // test procedure
  delay(5000);
  Serial.print("turning PSU on\n");
  digitalWrite(PSU_Pin, LOW);

  for (i = 0; i < 10; i++) {
    Serial.print("LED on\n");
    digitalWrite(HEATER_Pin, HIGH);
    delay(600);
    Serial.print("LED off\n");
    digitalWrite(HEATER_Pin, LOW);
    delay(600);
  }

  Serial.print("turning PSU off\n");
  digitalWrite(PSU_Pin, HIGH);
}

void loop() {
  Serial.print("ATmega is idle\n");
  delay(1000);
}


