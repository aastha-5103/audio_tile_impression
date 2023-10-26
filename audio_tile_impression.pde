import processing.sound.*;
SoundFile file;
Amplitude rms;
float smoothingFactor = 0.25;
float sum;

PImage img;

void setup() {
   size(1280,720);
   img=loadImage("turnBackTime.jpg");
   img.resize(1280,720);
   
  
   file = new SoundFile(this, "turnBackTime.mp3");
   file.loop();
   
   rms = new Amplitude(this);
   rms.input(file);
}

void draw() {
  background(0);
  
  fill(0);
  noStroke();
  
  sum += (rms.analyze() - sum) * smoothingFactor;
  
  float rms_scaled = sum * (height/2) * 5;
  float tiles=rms_scaled/8;
  float tilesize=width/tiles;
  translate(tilesize/2,tilesize/2) ;
  
  for(int x=0;x<tiles;x++){
    for(int y=0;y<tiles;y++){
      color c=img.get(int(x*tilesize),int(y*tilesize));
      float size=map(brightness(c),0,255,255,0);
      fill(c,255);
      rect(x*tilesize, y*tilesize, 30, 30);
    }
  }
  
  
}
