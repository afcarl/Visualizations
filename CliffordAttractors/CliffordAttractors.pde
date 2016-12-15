float startx = 0.5;
float starty = 0.5;
float prevx, prev2x;
float prevy, prev2y;
float a = -1.7;
float b = 1.8;
float c = -1.9;
float d = -0.4;
int scl = 1000/6;
int center = 1000/2;

int total_timesteps = 30000;
int current_time = 0;
int color_init_r = 200;
int color_init_g = 200;
int color_init_b = 150;
int color_init_a = 30;
int color_final_r = 40;
int color_final_g = 40;
int color_final_b = 20;
int color_final_a = 5;

void setup() {
  size(1000, 1000, P3D);
  background(255);
  // Initialization
  startx = sin(a*starty) + c*cos(a*startx);
  starty = sin(b*startx) + d*cos(b*starty);
}

void draw() {
  current_time += 1;
  if(current_time >= total_timesteps){
    return;
  }
  prev2x = prevx;
  prev2y = prevy;
  prevx = startx;
  prevy = starty;
  startx = sin((random(0.05)-0.025+a)*starty) + (random(0.05)-0.025+c)*cos((random(0.05)-0.025+a)*startx);
  starty = sin((random(0.05)-0.025+b)*startx) + (random(0.05)-0.025+d)*cos((random(0.05)-0.025+b)*starty);
  println((center+startx*scl) + " " + (center+starty*scl));
  int current_r = (color_init_r * (total_timesteps - current_time) + color_final_r * current_time ) / total_timesteps;
  int current_g = (color_init_g * (total_timesteps - current_time) + color_final_g * current_time ) / total_timesteps;
  int current_b = (color_init_b * (total_timesteps - current_time) + color_final_b * current_time ) / total_timesteps;
  int current_a = (color_init_a * (total_timesteps - current_time) + color_final_a * current_time ) / total_timesteps;
  noFill();
  println(current_r + " " + current_g + " " + current_b + " " + current_a);
  stroke(current_r,current_g, current_b, current_a);
  bezier(center+scl*prev2x, center+scl*prev2y, center+scl*prevx, center+scl*prevy, center+scl*prevx, center+scl*prevy, center+scl*startx, center+scl*starty);

}