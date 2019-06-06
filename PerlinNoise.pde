int rows, cols;
int scl = 20;
int w = 3000;
int h = 3500;
float[][] terrain;
float offIncr = 0.1;
float flying = 0;
boolean running = true;
Hero myHero;


class Hero
{
 float x, y, z; 
  public Hero(float startX, float startY, float startZ){
    x = startX;
    y = startY;
    z = startZ; 
  }
  
  public void Show()
  {
    sphere(100);
  }
}


void setup(){
  myHero = new Hero(0,0,0);
  cols = w / scl;
  rows = h / scl;
  //frameRate(40);
  size(1000, 600, P3D);
  terrain = new float[cols][rows];
  
}

void draw(){
  if(running == true){
     flying -= 0.1;
  }

  float yoff = flying;
  for(int y = 0; y < rows; y++){
    float xoff = 0;
    for(int x = 0; x < cols; x++){
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -255, 255);
      xoff += offIncr;
    }
    yoff += offIncr;
  }

  
  
  
  
  background(0);
  translate(width / 2, height / 2);
  rotateX(PI/3.6);


  translate(-w / 2, -h / 2 );

  noStroke();
  for(int y = 0; y < rows-1; y++){
    
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++){
      float theColor = map(terrain[x][y], -256/2, 255/2, -40, 150);
      //if(theColor < 0){
      //  fill(20, theColor + 60, 30);
      //}
      //else{
      //   fill(20, theColor + 20, 30);
      //}
      fill(theColor);
      
      vertex(x * scl, y * scl, terrain[x][y]);
      vertex(x * scl, (y+1) * scl, terrain[x][y+1]);
      
    }
    endShape();
  }  
  fill(255);
  lights();
  translate(1677, 1690, 219);
  //myHero.Show(); 
  
}

void keyPressed(){
  if (key == CODED) {
    if (keyCode == UP) {
      running = !running;
      
    }
  }
}
