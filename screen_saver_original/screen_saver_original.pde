// screen saver built in processing.
// licence: CC BY NC SA - Jackson servheen


int ax,ay,bx,by,cx,cy,dx,dy,last;
int q = 1;
float c = 0;
void setup() {
size(displayWidth, displayHeight);
background(0);
}

boolean sketchFullScreen() {
  return true;
}

void draw() {

  
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
  
 
 // delay(100);
}
  
void mouseMoved() {
  exit();
}
void keyPressed() {
  background(0);
}
    
    
