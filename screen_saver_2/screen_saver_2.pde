// screen saver built in processing.
// licence: CC BY NC SA - Jackson servheen

int ax,ay,bx,by,cx,cy,dx,dy,last;
int q = 1;
float c = 0;
float h = 0;
float m = 0;

void setup() {
  size(displayWidth, displayHeight);
  background(0);
}

boolean sketchFullScreen() {
  return true;
}

void draw() {
  colorMode(HSB);
  fill(c,255,255,4);
  noStroke();
  rect(0,0,width,height);
  
  c+=0.4;
  if (c > 255) c = 0;
  
  colorMode(RGB);
  
  ax = int(random(displayWidth));
  ay = int(random(displayHeight));
  bx = ax + int(random(-50,50));
  by = ay + int(random(0,50));
  
  strokeWeight(1);
  
  if (random(0,1)>0.5) {
    fill(random(255),random(255),random(255));
    stroke(random(255),random(255),random(255));
  }
  else {
    noFill();
    stroke(random(255),random(255),random(255));
  }
    
  switch(int(random(6))) {
    case 0: // line
    line(ax,ay,bx,by);
    
    break;
    case 1: // bezier (arc)
    cx = int(random(ax-20,bx+20));
    cy = int(random(ay-20,by+20));
    dx = int(random(ax-20,bx+20));
    dy = int(random(ay-20,by+20));
    bezier(ax,ay,cx,cy,dx,dy,bx,by);
    
    break;
    case 2: // box
    quad(ax,ay,ax,by,bx,by,bx,ay);
    
    break;
    case 3: // ellipse
    ellipse(ax,ay,random(15,50),random(15,50));
    
    break;
    case 4: // triangle
    cx = int(random(ax-20,bx+20));
    cy = int(random(ay-20,by+20));
    dx = int(random(ax-20,bx+20));
    dy = int(random(ay-20,by+20));
    triangle(cx,cy,bx,by,dx,dy);
    
    break;
    case 5: // arc
    arc(ax,ay,random(15,50),random(15,50),random(2)*PI,random(2)*PI);
    
    break;  
  }

  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  cx = width/2;
  cy = height/2;
  
  // Draw the hands of the clock
  stroke(255);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * 500, cy + sin(s) * 500);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * 400, cy + sin(m) * 400);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * 300, cy + sin(h) * 300);
  
}
  
void mouseMoved() {
  exit();
}
void keyPressed() {
  background(0);
}
    
    
