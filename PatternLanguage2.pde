boolean saving = false;//variable for controlling the recording

int growing = height/2;
int shrinking = height/2;
float a = 0.0;
float inc = TWO_PI/50.0;

void setup(){
  size(1280,720);//size has to be 1280 x 720
  background(#372550);
}

void draw(){  
  for (int i = 0; i <= width+200; i += 14) {
    pushStyle();
    fill(i/2-30,i/7,60+i/10);
    noStroke();
    ellipseMode(CENTER);
    rotate(radians(random(190,200)));
    rect(tan(a)+i, 0, 10, 3);
    popStyle();
    a = a + inc;
  }
  for(int k=0; k<=width; k+= 200){
    fill(200+k,200+k/3,60+k/3);
    for(int l=0; l<=height; l+=80){
      pushStyle();
      rotate(radians(random(10)));
      noStroke();
      ellipse(k,l,5,5);
      popStyle();
    }
  }
  
  if(saving == true){
    saveFrame("output/######.jpg");
  }
}

void keyPressed(){
  if((key == 's') || (key =='S')){
    saving = !saving;
    //when you press "s" key the first time, 
    //images start saving
    //when you press "s" key the second time,
    //images stop saving
  }
}
