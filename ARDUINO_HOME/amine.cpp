//-----------------Programmation des classes-------------------
//-----------------------BIBLIOTHEQUES UTILES-----------------------
#include "amine.h"
#include "Arduino.h"

//----------------------------------------------
void lumiere::on(int led){
  digitalWrite(led,HIGH);
  }
//-------------------------------------
void lumiere::off(int led){
 digitalWrite(led,LOW); 
  }
//---------------------------------------------------------
void temperature::envoie(int t) {
  const int B=4275;
    float R=1023.0/((float)t)-1.0;
  R=100000.0*R;
  int temperatureC=1.0/(log(R/100000.0)/B+1/298.15)-273.15;
  char*p;
  p = (char*) &temperatureC;

Serial.write(p,2); 
delay(500);

 }
//---------------------------------------------------------
 void porte::fermee(){Serial.write(1);}
//----------------------------------------------------
 void porte::ouverte(){Serial.write(3);}
