//------------------- Déclaration des bibliothéques---------------
#include "amine.h"

//----------------- Déclaration des variables---------------------
int led=13;
int capteur=12;
int val;
int b;
boolean p;
int prinTempSensor=A6;

//---------------INSTANCES--------------------------------------
lumiere lumiere;
temperature temperature;
porte porte;

//---------------Configuration sortie/entrée------------------
void setup() {
  
  Serial.begin(9600);
  pinMode(13, OUTPUT);
}

//------------------Programme en boucle-----------------------
void loop() {

  b= analogRead(prinTempSensor);
  p=digitalRead(capteur);

  if ( Serial.available() > 0) {  
    val = Serial.read(); 
 
 switch (val) {
  case 1:
    lumiere.on(led);
    break;
  case 2:
    lumiere.off(led);
    break;
  case 3:
 // Serial.write(b);
   temperature.envoie(b);
    break;
  case 4:
     
     if(p==1){porte.fermee();}
     if(p==0){porte.ouverte();}
  break;
}  
  
  } 
}

 

  
       
