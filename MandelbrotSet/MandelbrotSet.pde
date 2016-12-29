int height = 500;
int width = 500;
int iter = 200;
float time = 1.0;
float timedecay = 0.9995;
float timedelt = 0.004;
float offset = 0.0;

void setup() {
  size(500, 500);
  background(255, 255, 255);
}

void draw() {
  time -= timedelt;
  if (time < 0.05 || time > 1.0){
    timedelt *= -1;
  }
  offset += timedelt * 0.4;
  timedelt *= timedecay;
  float minlim = -time * 5.0 + offset;
  float maxlim = time * 5.0 + offset;
  print(minlim,maxlim);
  loadPixels();
  // Gives us access to the pixels array
  for(int i=0;i<width;i++){
    for(int j=0;j<height;j++){
      float a = map(i, 0, width, minlim, maxlim);
      float b = map(j, 0, height, minlim, maxlim);
      float ain = a;
      float bin = b;
      int state = 0;
      int k = 0;
      for(k=0;k<iter;k++){
        float aa = a * a - b * b + ain;
        float bb = 2.0 * a * b + bin;
        a = aa;
        b = bb;
        if (a * a + b * b > 16){
          state = 1;
          break;
        }
      }
      color set_col = color(k*255/iter, k*255/iter, k*255/iter);
      if (state == 0){
        set_col = color(0, 0, 0);
      }
      pixels[i + j*width] = set_col;
    }
  }
  updatePixels();
}