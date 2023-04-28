#include <AFMotor.h>
#include <ArduinoJson.h>

#define MAX_SPEED 255
#define BREAK_SEED 0

AF_DCMotor motor_right(3);
AF_DCMotor motor_left(4);
StaticJsonDocument<200> doc;

void setup()
{
Serial.begin(9600);
Serial3.begin(9600);
Serial.println("done");
}


void loop(){
  if (Serial3.available() > 0) {
    DeserializationError error =  deserializeJson(doc, Serial3);
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
  motor_left.run(FORWARD);
  motor_right.run(FORWARD);
}
//maybe i need inver the pins GRD and the positive of motors

void left(){
  motor_left.run(FORWARD);
  motor_right.run(BACKWARD);
}
void right(){
  motor_right.run(FORWARD);
  motor_left.run(BACKWARD);
}

void reverse(){
  motor_left.run(BACKWARD);
  motor_right.run(BACKWARD);
}

void setVelocity(long velocity){
  motor_left.setSpeed(velocity);
  motor_right.setSpeed(velocity);
}

void setBreakVelocity(){
  motor_left.setSpeed(0);
  motor_right.setSpeed(0);
}