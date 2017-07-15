import controlP5.*;

PVector wind = new PVector(0, 0);
SystemController sysCon = new SystemController();
PVector mousePosition;

ControlP5 cp5;
boolean paused;

PFont font;
Button pauseButton;
Button timeButton;
Slider windSlider;
Slider frequencySlider;
int maxFrequency = 100;

color textColor;
color backgroundColor;

color nightBackground = color(0);
color dayBackground = color(255);
color nightText = color(255);
color dayText = color(0);

boolean nightTheme = true;

void setup()
{
  size(1600, 900);
  background(backgroundColor);
  
  cp5 = new ControlP5(this);
  
  pauseButton = cp5.addButton("PAUSE")
    .setValue(0)
    .setPosition(width - 210, 20)
    .setSize(200, 40);
  
  pauseButton
    .getCaptionLabel()
    .setSize(20);
    
  timeButton = cp5.addButton("TIME")
    .setValue(0)
    .setPosition(width - 210, 70)
    .setSize(200, 40);
  
  timeButton
    .getCaptionLabel()
    .setSize(20);
    
  windSlider = cp5.addSlider("WIND")
    .setCaptionLabel("")
    .setPosition(230, 14)
    .setColorCaptionLabel(color(0,0,0))
    .setSize(200, 27)
    .setRange(-10, 10)
    .setValue(4)
    .setDecimalPrecision(0)
    .setNumberOfTickMarks(21);
    
  frequencySlider = cp5.addSlider("FREQUENCY")
    .setCaptionLabel("")
    .setPosition(230, 50)
    .setColorCaptionLabel(color(0,0,0))
    .setSize(200, 27)
    .setRange(0, maxFrequency-1)
    .setValue(20)
    .setDecimalPrecision(0)
    .setNumberOfTickMarks(21);
    
  font = createFont("Arial", 30, true);
    
  nightTheme = false;
  paused = false;
}


void draw()
{
  if (nightTheme)
  {
    backgroundColor = nightBackground;
    textColor = nightText;
  }
  else
  {
    backgroundColor = dayBackground;
    textColor = dayText;
  }
  
  textFont(font);
  textAlign(LEFT);
  fill(textColor);
  text("WIND FORCE", 15, 40);
  text("FREQUENCY", 20, 74);
  
  if (!paused)
  {
    fill(backgroundColor, 16);
    rect(0, 0, width, height);
    
    float sliderValue = frequencySlider.getValue();
    sliderValue = maxFrequency - sliderValue;
    int randomResult = (int) log(random(0, sliderValue));
    sysCon.mainUpdate( randomResult == 0);
    
    wind = new PVector(windSlider.getValue(), 0);
    wind.mult(.01);
    
    sysCon.addForce(wind);  

  }
}

public void PAUSE()
{
  paused = !paused;
}

public void TIME()
{
  nightTheme = !nightTheme;
}
