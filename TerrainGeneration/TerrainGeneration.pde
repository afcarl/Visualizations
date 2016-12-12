int rows;
int cols;
int scalex = 15;
int widthx = 1200;
int heightx = 800;
int terrainHeight = 80;
float[][] terrain;
float moveY = 0.0;

void setup() {
  size(800, 800, P3D);
  cols = widthx/scalex;
  rows = heightx/scalex;
  terrain = new float[rows][cols];
  for(int y=0;y<rows;y++){
    for(int x=0;x<cols;x++){
      // Perlin noise gives us random values based on the parameters passed in. If the parameters are close
      // to each other then the noise returned is similar in both the cases.
      terrain[y][x] = map(noise(float(x)/10.0, float(y)/10.0), 0, 1, -terrainHeight, terrainHeight);
    }
  }
}

void draw() {
  // lights();
  moveY += 0.02;
  background(0, 120, 160);
  for(int y=0;y<rows;y++){
    for(int x=0;x<cols;x++){
      // Perlin noise gives us random values based on the parameters passed in. If the parameters are close
      // to each other then the noise returned is similar in both the cases.
      terrain[y][x] = map(noise(float(x)/10.0, float(y)/10.0 - moveY), 0, 1, -terrainHeight, terrainHeight);
    }
  }
  translate(widthx/2-100, heightx/2);
  rotateX(PI/2.7);
  translate(-widthx/2-100, -heightx/2+100);
  for(int y=0;y<rows-1;y++){
    beginShape(TRIANGLE_STRIP);
    for (int x=0;x<cols;x++){
      stroke(0, 66, 33);
      fill(0, 120, 90);
      vertex(x*scalex, y*scalex, terrain[y][x]);
      vertex(x*scalex, (y+1)*scalex, terrain[y+1][x]);
    }
    endShape();
  }
}