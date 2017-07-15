class ParticleSystem extends Particle
{
  ArrayList<Particle> particles = new ArrayList<Particle>();
  int totalParticles = 40;
  boolean bursted = false;
  
  ParticleSystem(PVector l, PVector v, color c)
  {
    super(l, v, c); 
  }
  
  void burst()
  {
    bursted = true;
    
    PVector particleVelocity = new PVector(4, 0);
    float angleStep = 1080f / (float)totalParticles;
    
    for(int i = 0; i <= totalParticles; i++)
    {
      particles.add( new Particle(location, particleVelocity, myColor));
      particleVelocity.rotate(radians(angleStep + random(-5, 5)));
    }
    
    for(int i = particles.size() - 1; i >= 0; i--)
    {
      Particle p = particles.get(i);
      if(p.isDead()) particles.remove(i);
    }
  }
  
  void displayParticles()
  {
    for(Particle p : particles)
    {
      p.update();
      p.display();
    }
  }
  
  void displaySystem()
  {
    fill(255, 0, 0);
    ellipse(location.x, location.y, 2, 2);
  }
  
  void addForce(PVector force)
  {
    acceleration.add(force);
    
    for(Particle p : particles)
    {
      p.addForce(force);  
    }
  }
  
  boolean isDead()
  {
    boolean allGone = true;
    
    for(Particle p : particles)
    {
      if(p.location.x > 0 && p.location.x < width && 
          p.location.y < height && p.location.y > 0)  
      {
        allGone = false;
      }
    }
    
    if(allGone && location.y > height + 10) return true;
    else return false;
  }
}