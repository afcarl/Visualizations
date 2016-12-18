int height = 800;
int width = 1200;

int particles_cnt = 5000;
int time = 0;
int block = 20;

ArrayList<Particle> particles;

ArrayList<PVector> flowfield;
int[] colors;

void setup() {
  size(1200, 800);
  background(255);
  colorMode(HSB);
  particles = new ArrayList<Particle>();
  for(int i=0;i<particles_cnt;i++){
    particles.add(new Particle(random(width), random(height)));
  }
  flowfield = new ArrayList<PVector>();
  colors = new int[height*width];
  for(int i=0;i<height*width/(block*block);i++){
    flowfield.add(new PVector(0,0));
  }
  for(int i=0;i<height;i++){
    for(int j=0;j<width;j++){
      colors[i*width+j] = int(noise(i/300.0,j/300.0)*255);
    }
  }
}

void draw() {
  time += 1;
  for(int i=0;i<particles_cnt;i++){
    particles.get(i).update_flow();
    particles.get(i).update();
    particles.get(i).show();
  }
  for(int i=0;i<height/block;i++){
    for(int j=0;j<width/block;j++){
      stroke(0);
      float angle = noise(i/10.0, j/10.0, time/500.0) * PI * 2 * 4;
      PVector flow_cur = new PVector(cos(angle) * block, sin(angle) * block);
      flow_cur.mult(0.01);
      flowfield.set(i*width/block+j, flow_cur);
    }
  }
}