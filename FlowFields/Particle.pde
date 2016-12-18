class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  PVector prev_pos;
  
  Particle(float x, float y) {
    pos = new PVector(x, y);
    prev_pos = new PVector(0, 0);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  
  void update_flow() {
    int posx = int((pos.x - block) / block);
    int posy = int((pos.y - block) / block);
    acc = flowfield.get(int(posy * width/block + posx));
  }
  
  void update() {
    prev_pos = pos;
    vel.add(acc);
    vel.limit(3);
    pos.add(vel);
    if (pos.x > width) {
      pos.x = 1;
      prev_pos = pos;
    }
    if (pos.x <= 0) {
      pos.x = width;
      prev_pos = pos;
    }
    if (pos.y > height) {
      pos.y = 1;
      prev_pos = pos;
    }
    if (pos.y <= 0) {
      pos.y = height;
      prev_pos = pos;
    }
  }
  
  void show() {
    int colorx = colors[min(int(pos.y), height-1)*width+min(int(pos.x), width-1)];
    stroke(colorx, 255, 180, 5);
    noFill();
    line(prev_pos.x, prev_pos.y, pos.x, pos.y);
  }
  
}