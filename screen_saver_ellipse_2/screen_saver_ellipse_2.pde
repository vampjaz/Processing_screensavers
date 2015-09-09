// screen saver built in processing.
// licence: CC BY NC SA - Jackson servheen
ArrayList<Arc> arcs;
float angle = 0;
int size = 100;

void setup() {
  size(displayWidth, displayHeight);
  background(0);
  arcs = new ArrayList<Arc>();
  for (int i = 0; i < size; i++) {
    arcs.add(new Arc(random(width),random(2*TWO_PI),random(2*TWO_PI),random(2,10),color(random(255),random(255),random(255),random(10,70))));
  }
}

boolean sketchFullScreen() {
  return true;
}

void draw() {
 // background(0);
 fill(0,10);
 noStroke();
 rect(0,0,width,height);
 
  translate(width/2,height/2);
  //rotate(angle);
  angle += radians(1);
  if (angle > TWO_PI) angle = 0;
  
  noFill();
  for (int i = 0; i < arcs.size(); i++) {
    arcs.get(i).draw(i % 2 == 0 ? true : false);
  }
}
  
void mouseMoved() {
  exit();
}

    
    
class Arc {
  float di, st, en, we;
  color cl;
  
  Arc(float d, float s, float e, float w, color c) {
    di = d;
    st = s;
    en = e;
    we = w;
    cl = c;
  }
  
  void draw(boolean a) {
    strokeWeight(we);
    stroke(cl);
    //rotate(an);
    float ca = (a ? angle : TWO_PI - angle);
    arc(0,0,di,di,st + ca,en + ca,OPEN);
  }
}
