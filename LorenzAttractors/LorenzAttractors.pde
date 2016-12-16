import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

float x = 0.01;
float y = 0;
float z = 0;

float a = 8;
float b = 29;
float c = 7.0/3.0;

float dhue = 0.1;

PeasyCam camera;

ArrayList<PVector> points = new ArrayList<PVector>();

int total_timesteps = 30000;
int current_time = 0;

float rotateYdeg = 0.0;

void setup() {
  size(1000, 1000, P3D);
  colorMode(HSB);
  camera = new PeasyCam(this, 500);
}

void draw() {
  background(255);
  rotateY(radians(rotateYdeg));
  rotateYdeg += 0.5;
  scale(3);
  current_time += 1;
  if(current_time >= total_timesteps){
    return;
  }
  float hue = 80;
  float dt = 0.01;
  x = x + (a * (y - x)) * dt;
  y = y + (x * (b - z) - y) * dt;
  z = z + (x * y - c * z) * dt;
  noFill();
  points.add(new PVector(x,y,z));
  beginShape();
  for (PVector cur : points){
    stroke(hue, 255, 255);
    hue += dhue;
    if (hue >= 180) {
      dhue = -0.1;
    }
    if (hue <= 80) {
      dhue = 0.1;
    }
    vertex(cur.x, cur.y, cur.z);
  }
  endShape();
}