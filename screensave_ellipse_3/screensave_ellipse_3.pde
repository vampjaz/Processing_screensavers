// screen saver built in processing.
// licence: CC BY NC SA - Jackson servheen
ArrayList<Arc> arcs;
float angle = 0;
int size = 100;
float mo = 0;
float mmo = 1;
float maxmo = 150;

void setup() {
  size(displayWidth, displayHeight,P3D);
  background(0);
  arcs = new ArrayList<Arc>();
  for (int i = 0; i < size; i++) {
    float a = random(2*TWO_PI);
    arcs.add(new Arc(random(width * 0.77),a,a+random(0.5*TWO_PI),random(2,10),color(random(255),random(255),random(255),128),random(-20,20)));
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
 rotateX(map(835,0,displayWidth,-PI,PI));
  rotateY(map(694,0,displayWidth,-PI,PI));
 // rotateX(3.581416);
 // rotateY(0.28);
  translate(width/2,height/2);
  //rotate(angle);
  angle += radians(1);
  if (angle > TWO_PI) angle = 0;
  
  noFill();
  for (int i = 0; i < arcs.size(); i++) {
    arcs.get(i).draw(i % 2 == 0 ? true : false);
  }
  
  mo += mmo;
  if (mo > maxmo || mo < -maxmo)
    mmo = -mmo;
}

void mouseMoved() {
  exit();
}
    
class Arc {
  float di, st, en, we, zi;
  color cl;
  
  Arc(float d, float s, float e, float w, color c, float z) {
    di = d;
    st = s;
    en = e;
    we = w;
    cl = c;
    zi = z;
  }
  
  void draw(boolean a) {
    strokeWeight(we);
    stroke(cl);
    //rotate(an);
    translate(0,0,zi * map(mo,-maxmo,maxmo,-2,2));
    float ca = (a ? angle : TWO_PI - angle);
    arc(0,0,di,di,st + ca,en + ca,OPEN);
  }
}
