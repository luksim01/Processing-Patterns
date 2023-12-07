boolean saving = false;//variable for controlling the recording

PShape circle;
int x = 200;
int y = 200;
int speedY = 1;
int speedX = 10;
int offset = 0;

void setup(){
  background(#FFC981);
  size(1280,720);//size has to be 1280 x 720
  circle = createShape(ELLIPSE, 0, 0, 5, 10);
  circle.setFill(color(255));
  circle.setStroke(false);
}

void draw(){
  circle.setFill(color(255*y/720,0,255*x/1280));
  x += speedX;
  y += speedY;
  
  if(x > width || x < 200){
    speedX = -speedX;
  }
  if(y > height || y < 200){
    speedY = -speedY;
  }
  
  pushMatrix();
  for(int i=0;i<width;i+=190){
    for(int j=0; j<height;j+=1){
      pushStyle();
      fill(j-i+100, j-100, (i+j)/400);
      stroke(j-i+150, i-80, 80);
      strokeWeight(random(x/110, x/100));
      translate(0,0);
      rotate(radians(5));
      ellipse(i+x, j, 20+x-y/100, x/random(9,10));
      popStyle();
    }
  }
  popMatrix();
  
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
