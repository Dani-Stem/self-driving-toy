#include <Servo.h>


#define echoPin1 4 
#define trigPin1 5 

#define echoPin0 2 
#define trigPin0 3 

#define echoPin2 8 
#define trigPin2 11 

Servo servo0;
Servo servo1;


// defines variables
long duration0; 
int distance0; 
long duration1; 
int distance1; 
long duration2; 
int distance2; 

long dir;


void setup() {

  servo0.attach(9);
  servo1.attach(6);

  Serial.println("Ultrasonic Sensor HC-SR04 Test"); // print some text in Serial Monitor
  Serial.println("with Arduino UNO R3");

  pinMode(trigPin0, OUTPUT); // Sets the trigPin as an OUTPUT
  pinMode(echoPin0, INPUT); // Sets the echoPin as an INPUT
  Serial.begin(9600); // // Serial Communication is starting with 9600 of baudrate speed


  pinMode(trigPin1, OUTPUT); // Sets the trigPin as an OUTPUT
  pinMode(echoPin1, INPUT); // Sets the echoPin as an INPUT
  Serial.begin(9600); // // Serial Communication is starting with 9600 of baudrate speed
    
  pinMode(trigPin2, OUTPUT); // Sets the trigPin as an OUTPUT
  pinMode(echoPin2, INPUT); // Sets the echoPin as an INPUT
  Serial.begin(9600); // // Serial Communication is starting with 9600 of baudrate speed
 
  randomSeed(analogRead(0));
  
}

void loop() {
  digitalWrite(trigPin0, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin0, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin0, LOW);
  duration0 = pulseIn(echoPin0, HIGH);
  distance0 = duration0 * 0.034 / 2; 

  digitalWrite(trigPin1, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin1, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin1, LOW);
  duration1 = pulseIn(echoPin1, HIGH);
  distance1 = duration1 * 0.034 / 2; 
  
  digitalWrite(trigPin2, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin2, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin2, LOW);
  duration2 = pulseIn(echoPin2, HIGH);
  distance2 = duration2 * 0.034 / 2; 

  

  Serial.print("Distance0: ");
  Serial.print(distance0);
  Serial.println(" cm");
  Serial.print("Distance1: ");
  Serial.print(distance1);
  Serial.println(" cm");
  Serial.print("Distance2: ");
  Serial.print(distance2);
  Serial.println(" cm");
  Serial.println("---");


      servo1.write(1650); 
      servo0.write(1350);

    if ((distance0 > 1000 or distance1 > 1000 or distance2 > 1000) or 
       (distance0 < 7  or distance1 < 4  or distance2 < 4 )){

      servo1.write(1350);
      servo0.write(1650);
      Serial.println("reverse");
                 
    }

    if (distance2 > distance1) {

      if (distance1 < 4 or distance1 > 1000){
        servo0.write(1500);    
        Serial.println("left");
                  delay(200);          
    }
    }
    if (distance1 > distance2){     
        if (distance2 < 4 or distance2 > 1000){
          servo1.write(1500);    
          Serial.println("right");
                    delay(200);          
      }
      }  
}
