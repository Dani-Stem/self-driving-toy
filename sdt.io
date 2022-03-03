// ---------------------------------------------------------------- //
// Arduino Ultrasoninc Sensor HC-SR04
// Re-writed by Arbi Abdul Jabbaar
// Using Arduino IDE 1.8.7
// Using HC-SR04 Module
// Tested on 17 September 2019
// ---------------------------------------------------------------- //

#include <Servo.h>


#define echoPin1 4 // attach pin D2 Arduino to pin Echo of HC-SR04
#define trigPin1 5 //attach pin D3 Arduino to pin Trig of HC-SR04

#define echoPin0 2 // attach pin D2 Arduino to pin Echo of HC-SR04
#define trigPin0 3 //attach pin D3 Arduino to pin Trig of HC-SR04

Servo servo0;
Servo servo1;


// defines variables
long duration0; // variable for the duration of sound wave travel
int distance0; // variable for the distance measurement
long duration1; // variable for the duration of sound wave travel
int distance1; // variable for the distance measurement

int pos0;
int pos1;


void setup() {

  servo0.attach(9);
  servo1.attach(6);

  pinMode(trigPin0, OUTPUT); // Sets the trigPin as an OUTPUT
  pinMode(echoPin0, INPUT); // Sets the echoPin as an INPUT
  Serial.begin(9600); // // Serial Communication is starting with 9600 of baudrate speed
  Serial.println("Ultrasonic Sensor HC-SR04 Test"); // print some text in Serial Monitor
  Serial.println("with Arduino UNO R3");  


  pinMode(trigPin1, OUTPUT); // Sets the trigPin as an OUTPUT
  pinMode(echoPin1, INPUT); // Sets the echoPin as an INPUT
  Serial.begin(9600); // // Serial Communication is starting with 9600 of baudrate speed
  Serial.println("Ultrasonic Sensor HC-SR04 Test"); // print some text in Serial Monitor
  Serial.println("with Arduino UNO R3");    
}

void loop() {
  // Clears the trigPin condition
  digitalWrite(trigPin0, LOW);
  delayMicroseconds(2);
  // Sets the trigPin HIGH (ACTIVE) for 10 microseconds
  digitalWrite(trigPin0, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin0, LOW);
  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration0 = pulseIn(echoPin0, HIGH);
  // Calculating the distance
  distance0 = duration0 * 0.034 / 2; // Speed of sound wave divided by 2 (go and back)
  // Displays the distance on the Serial Monitor
  Serial.print("Distance0: ");
  Serial.print(distance0);
  Serial.println(" cm");

// Clears the trigPin condition
  digitalWrite(trigPin1, LOW);
  delayMicroseconds(2);
  // Sets the trigPin HIGH (ACTIVE) for 10 microseconds
  digitalWrite(trigPin1, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin1, LOW);
  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration1 = pulseIn(echoPin1, HIGH);
  // Calculating the distance
  distance1 = duration1 * 0.034 / 2; // Speed of sound wave divided by 2 (go and back)
  
  
  // Displays the distance on the Serial Monitor
  Serial.print("Distance0: ");
  Serial.print(distance0);
  Serial.println(" cm");
    if (distance0 > 15) {

      for(pos0=180;pos0>=0;pos0--){
      servo0.write(pos0);
      delay(15);
      }

  }

  Serial.print("Distance1: ");
  Serial.print(distance1);
  Serial.println(" cm");
    if (distance1 > 15) {

      for(pos1=180;pos1>=0;pos1--){
      servo1.write(pos1);
      delay(15);
      }

  }  
  
}
