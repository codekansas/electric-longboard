#include <Servo.h>

const int CTRL_PIN = 2;

const int SLOW_FACTOR = 5;
const int DELAY = 50;
const int DELTA = 1;
int level = 90;

Servo servo;

void setup() {
  Serial.begin(9600);
  servo.attach(CTRL_PIN);
}

void loop() {
  int rd;

  // Read the input level
  rd = max(900, analogRead(0));
  rd = map(rd, 900, 1023, 90, 130);
  delay(DELAY);

  // Move toward or away from the target value
  if (level > rd) level = max(rd, level - DELTA * SLOW_FACTOR);
  else level = min(rd, level + DELTA);

  Serial.print("LEVEL: ");
  Serial.println(rd, DEC);
  
  servo.write(level);
}
