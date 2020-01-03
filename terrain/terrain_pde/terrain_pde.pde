int cols, rows;
int scl = 20;
int w = 2000;
int h = 1600;

float[][] terrain;
float flying = 0;
int cx, cy = 500;
void setup() {
    size(600, 600, P3D);
  
    cols = w / scl;
    rows = h / scl;
    terrain = new float[cols][rows];
    float yoff = 0;
    for(int y = 0; y < rows; y++){
      float xoff = 0;
      for (int x = 0;x < cols; x++) {
        terrain[x][y] = map(noise(xoff,yoff), 0, 1, 0, 200);
        xoff +=0.2;
        }
        yoff +=0.2;
    }
}


void draw() {
  fill(0, 10);
  rect(0,0, width, height);

  flying-=0.005;
  float yoff = flying;
   for(int y = 0; y < rows; y++){
      float xoff = 0;
      for (int x = 0;x < cols; x++) {
        terrain[x][y] = map(noise(xoff,yoff), 0, 1, 0, 200);
        xoff +=0.1;
        }
        yoff +=0.1;
    }
   

     stroke(255,255,255,100);
       noFill();
       translate(width/2, height/2 + 50);
       rotateX(PI/3);
       translate(-w/2, -h/2);
      for(int y = 0; y < rows - 1; y++){
        beginShape(TRIANGLE_STRIP);
   for (int x = 0;x < cols; x++) {
       vertex(x*scl, y*scl , terrain[x][y]);
       vertex(x*scl, (y+1)*scl ,terrain[x][y+1]);
     }
     endShape();
  }
 
}
