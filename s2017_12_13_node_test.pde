int prevPinState = 0;
int pinState = 0; 
int pressTime = 0;
int releaseTime = 0;

Interpreter mc;

void setup(){
  
  size(1100, 700);
  
  Node.setProcessing(this);
  
  mc = new Interpreter();
  
}

void draw(){
  background(0);
  checkInput(); 
  mc.draw();
  mc.displayCurrent();
}


void checkInput(){
  
  if (pinState != prevPinState && pinState == 1){ 
    pressTime = millis();
  }
  
  if (pinState != prevPinState && pinState == 0){ 
    releaseTime = millis();
    processInput();
  }
  
  prevPinState = pinState; 
}

void processInput(){
  int pressedTime = releaseTime - pressTime;
  if (pressedTime < 300){
    println("DOT");
    mc.insert('.');
  }else{
    println("DASH");
    mc.insert('-');
  }
}

void keyPressed(){
  pinState = 1;
}

void keyReleased(){
  pinState = 0;
}