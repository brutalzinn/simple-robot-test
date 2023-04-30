#include <ArduinoJson.h>

#define MAX_SPEED 255
#define BREAK_SEED 0

//MOTOR A
int IN1 = 11;
int IN2 = 10;

//MOTOR B

int IN3 = 9;
int IN4 = 8;

int velocityMotorA = 7;
int velocityMotorB = 6;

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
    move(doc["direction"], doc["velocity"], doc["time"]);
  }
}
void move(String direction, long velocity, long time){
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
    delay(time);
    setBreakVelocity();
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

  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW);
}
void right(){
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);

  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW);
}

void reverse(){
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);

  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW);
}

void setVelocity(long velocity){
  analogWrite(velocityMotorA, velocity);
  analogWrite(velocityMotorB, velocity);
}

void setBreakVelocity(){

}
