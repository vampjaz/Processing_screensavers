// screen saver built in processing.
// licence: CC BY NC SA - Jackson servheen

void setup() {
size(displayWidth, displayHeight);
background(0);
}

boolean sketchFullScreen() {
  return true;
}

void draw() {
  fill(0,4);
  noStroke();
  rect(0,0,width,height);
  
  stroke(random(255),random(255),random(255));//,random(105));
  if (random(1) < 1) {
    noFill();
  } else {
    fill(random(255),random(255),random(255));//,random(105));
  }
  strokeWeight(random(2,60));
  float x = random(height);
  arc(width/2,height/2,x,x,random(TWO_PI),random(TWO_PI) + PI + HALF_PI,OPEN);
}
  
void mouseMoved() {
  exit();
}
void keyPressed() {
  background(0);
}
    
    
