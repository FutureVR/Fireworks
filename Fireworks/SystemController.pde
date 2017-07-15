class SystemController
{
  ArrayList<ParticleSystem> particleSystems = new ArrayList<ParticleSystem>();
  
  void mainUpdate(boolean createNewSystem)
  {
    updateSystems();
    if(createNewSystem) createSystem();
  }
  
  void updateSystems()
  {
    for(int i = particleSystems.size() - 1; i >= 0; i--)
    {
      ParticleSystem ps = particleSystems.get(i);
      if(ps.isDead()) particleSystems.remove(i);
      
      ps.addForce(new PVector(0, .15));
      ps.update();
      if(!ps.bursted  &&  -.2 < ps.velocity.y && ps.velocity.y < .2) ps.burst();
      ps.displayParticles();
      if(!ps.bursted) ps.displaySystem();
    }
  }
  
  void createSystem()
  {
    PVector newLocation = new PVector(random(100, width - 100), height);
    PVector newVelocity = new PVector(random(-2, 2), random(-15, -5));
    println(newVelocity.x);
    color newColor = color(random(128, 255), random(128, 255), random(128, 255));
    
    particleSystems.add( new ParticleSystem(newLocation, newVelocity, newColor));
  }
  
  void addForce(PVector wind)
  {
    for(int i = particleSystems.size() - 1; i >= 0; i--)
    {
      ParticleSystem ps = particleSystems.get(i);
      ps.addForce(wind);
    }
  }
  
  void addSystem(ParticleSystem ps)
  {
    particleSystems.add(ps);
  }
}