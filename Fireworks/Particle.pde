class Particle
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  color myColor;
  float alpha;
  
  Particle(PVector l, PVector v, color c)
  {
    location = l.copy();
    velocity = v.copy();
    acceleration = new PVector(0, 0.4);
    
    myColor = c;
    alpha = 255;
  }
  
  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    alpha -= 2; 
  }
  
  void display()
  {
    fill(myColor, alpha);
    noStroke();
    //stroke(0, alpha);
    ellipse(location.x, location.y, 3, 3);  
  }
  
  void addForce(PVector force)
  {
    acceleration.add(force);  
  }
  
  boolean isDead()
  {
    if(alpha <= 0) return true;
    else return false;
  }
}