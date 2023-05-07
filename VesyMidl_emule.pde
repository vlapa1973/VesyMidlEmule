//**********************************************
//
//  Эмулятор весового терминала MIDL
//
//**********************************************

import processing.serial.*;

Serial myPort;

int port = 1;

int i = 0;  
boolean flagOff = false;
int[] data = {0, 90, 670, 1540, 20000, 37850};

void setup() {
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[port], 9600);
}

void draw() {
  if (flagOff) {
    myPort.write("ww0" + nf(data[i], 5) + " kg\r\n");
    println("ww0" + nf(data[i], 5) + " kg");
  } else print("\r\nTablo OFF !!!  " + data[i]);
  delay(200);                              
}

void keyPressed() {
  if (key == ' ') {
    i++;
    if (i >= data.length) i = 0;  
  }
  if (key == 9) {
    flagOff = !flagOff;
    if (flagOff) {
      print("\n");
      myPort.write("ww000000 kg\r\n");
    }
  }
}
