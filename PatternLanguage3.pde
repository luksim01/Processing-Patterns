boolean saving = false;//variable for controlling the recording

int middleX, middleY;
int distFromMiddleX, distFromMiddleY;
int sizeX, sizeY;

void setup(){
  size(1280,720);//size has to be 1280 x 720
  middleX = width/2;
  middleY = height/2;
}

void draw(){  
  background(255);
  sizeX = middleX/8;
  sizeY = middleY/8;
  
  distFromMiddleX = abs(middleX-mouseX);
  distFromMiddleY = abs(middleY-mouseY);
  
  for (int y=-50; y<height+100; y+=28){
    for (int x=-55; x<width+100; x+=28){
      if(x%6 == 0 || y%6 == 0){
        pushMatrix();
        translate(x+random(2),y+random(2));
        rectMode(CENTER);
        rotate(radians(distFromMiddleX)+y);
        pushStyle();
        noStroke();
        //fill(distFromMiddleY,distFromMiddleX-y/2,x/3);
        fill(80+mouseX+y/10,100+x/5,30);
        rect(0,0,sizeX+distFromMiddleX/50,sizeY+distFromMiddleY/30,100-(distFromMiddleX/90));
        popStyle();
        popMatrix();
      }
      else{
        pushMatrix();
        translate(x,y);
        rectMode(CENTER);
        rotate(radians(-distFromMiddleY)-x);
        pushStyle();
        noStroke();
        fill(distFromMiddleY-x/2,y/2,distFromMiddleX/2);
        rect((abs(mouseY-y)/20),(abs(mouseX-x)/20),(abs(mouseX-x)/2)+sizeY+distFromMiddleX/50,(abs(mouseY-y)/2)+sizeX+distFromMiddleY/30,100-(distFromMiddleY/60));
        popStyle();
        popMatrix();
      }
    }
  }
  //popDots();
    
  if(saving == true){
    saveFrame("output/######.jpg");
  }
}

void popDots(){
  for (int i=0; i<width; i+=50){
    for (int j=0; j<height; j+=50){
      if(i%15==0 || j%15==0){
        pushStyle();
        stroke(80+mouseX+j/10,100+i/5,30);
        strokeWeight(random(0,5));
        noFill();
        ellipse(i, j+random(abs(mouseX-i),abs(mouseY-j))/5, 3, 3);
        popStyle();
      }
    }
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
