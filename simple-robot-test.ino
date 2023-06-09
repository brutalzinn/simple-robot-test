#include <ArduinoJson.h>

#define MAX_SPEED 255
//MOTOR A
#define IN1 11
#define IN2 10
//MOTOR B
#define IN3 9
#define IN4 8

#define velocityMotorA  7
#define velocityMotorB  6
#define batteryAnalog  A0

#define batteryVerifyTime = 10000

unsigned long movimentEvent = millis();
unsigned long verifyBatteryEvent = millis();

StaticJsonDocument<200> doc;

void setup()
{
Serial.begin(9600);
// MOTOR A
pinMode(IN1, OUTPUT);
pinMode(IN2, OUTPUT);
pinMode(velocityMotorA, OUTPUT);

// MOTOR B
pinMode(IN3, OUTPUT);
pinMode(IN4, OUTPUT);
pinMode(velocityMotorB, OUTPUT);

}


void loop(){
  if (Serial.available() > 0) {
    DeserializationError error =  deserializeJson(doc, Serial);
    if (error) {
    Serial.print(F("deserializeJson() failed: "));
    Serial.println(error.f_str());
    return;
    }
    if((millis() - verifyBatteryEvent) > batteryVerifyTime){
      verifyBattery();
    }
    move(doc["direction"], doc["velocity"], doc["time"]);
  }
}
void move(String direction, int velocity, long time){
    setVelocity(velocity);
    Serial.println(direction);
    Serial.println(velocity);
    Serial.println(time);
    if (direction == "forward") {
        forward();
    }
    else if (direction == "left") {
        left();
    }
    else if (direction == "right") {
        right();
    }
    else if (direction == "reverse") {
        reverse();
    }
   if((millis() - movimentEvent) > time){
      setBreakVelocity();
   }
}

void forward(){
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);

  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW);
}
//maybe i need inver the pins GRD and the positive of motors

void left(){
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);

  digitalWrite(IN3, LOW);
  digitalWrite(IN4, HIGH);
}
void right(){
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, HIGH);

  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW);
}

void reverse(){
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, HIGH);

  digitalWrite(IN3, LOW);
  digitalWrite(IN4, HIGH);
}

void setVelocity(int velocity){
  analogWrite(velocityMotorA, velocity);
  analogWrite(velocityMotorB, velocity);
}

void setBreakVelocity(){
  setVelocity(0);
}

void verifyBattery()
{
  //i will use the divisor to verify the battery level
  int sensorValue = analogRead(batteryAnalog);
  float voltage = sensorValue * (5.00 / 1023.00) * 2;
  Serial.println(voltage);
}
