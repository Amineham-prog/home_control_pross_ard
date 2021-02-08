import processing.serial.*; //importer la bibliothéque processing
Serial Port;  // instance port serie

//----------------------Instance des classes--------------------------------------
lumiere malumiere=new lumiere();
porte maporte=new porte();
temperature matemperature = new temperature();

//--------------------------------------Déclaration des images------------------------------------
PImage maison;PImage soleil;PImage porte;
int B=4275;
int R0=100000;
float temp;
int val;
int valcapteur;


void setup() {
  size(600,600);
  background(0);
  Port = new Serial(this, Serial.list()[0], 9600);
 //--------------------------Telechargement des images-----------------------------------------
  maison = loadImage("A.PNG"); soleil = loadImage("L.PNG"); porte = loadImage("P.PNG");

//--------------- DRAW Maison----------------------------
  image(maison,100,100,400,400);

//--------------BOUTON TEMPERATURE-----------------------
stroke(255);fill(255,0,0);rect(50,50,160,50);
textSize(20);fill(0,255,0);text("TEMPERATURE",60,80);

//--------------BOUTON LUMIERE 0N-------------------------------
stroke(255); fill(255,0,0); rect(400,50,160,50);
textSize(20);fill(0,255,0);text("LUMIERE ON",420,80);

//--------------BOUTON LUMIERE 0FF-------------------------------
stroke(255); fill(255,0,0); rect(400,500,160,50);
textSize(20);fill(0,255,0);text("LUMIERE OFF",420,530);

//------------------BOUTON PORTE-----------------------
fill(255,0,0);rect(50,500,160,50);
textSize(20);fill(0,255,0);text("CHECK PORTE",65,530);
}

void draw() { 
  
  if ( Port.available() > 0) {  
    val = Port.read();

if(val==1){maporte.fermee();}
if (val==3 ){maporte.ouverte();}
if(val>3){ valcapteur=val; }
  }
}

//--------------------------------------------------les boutons--------------------------------------------------------------------

void mousePressed() {
  //-------------------------ZONE LUMIERE OFF----------------------------------------------
 if (mousePressed && mouseX<560 && mouseX>400 && mouseY<550 && mouseY>500) {malumiere.limiereOFF();}
 
 //--------------------------ZONE LUMIERE ON-------------------------------------------------
 if (mousePressed && mouseX<560 && mouseX>400 && mouseY<100 && mouseY>50) {malumiere.lumiereON();}

//------------------------------ZONE PORTE-----------------------------------------------------
if (mousePressed && mouseX<210 && mouseX>50 && mouseY<550 && mouseY>500) {maporte.check();}

//------------------------------TEMPERATURE-----------------------------------------------------
if (mousePressed && mouseX<210 && mouseX>50 && mouseY<100 && mouseY>50) {matemperature.check(); if(valcapteur>0){matemperature.affiche();}}

}




