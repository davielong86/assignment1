import controlP5.*;
ControlP5 controlP5;

ArrayList<DataInput> data = new ArrayList<DataInput>();
ArrayList<StatInput> stats = new ArrayList<StatInput>();
int  mode = 0;
PImage backImage;
void setup()
{
  backImage = loadImage("bg.jpg");
  background(backImage);
  size(1800, 800);
  loadData();
  loadData1();

  smooth();
  frameRate(30);
  controlP5 = new ControlP5(this);  
  ControlFont cf1 = new ControlFont(createFont("Times", 15));
  createButton("RAIN", 1, width - 110, 5, color(255, 0, 0), cf1);
  createButton("MIN TEMP", 2, width - 110, 55, color(255, 0, 0), cf1);
  createButton("MAX TEMP", 3, width - 110, 105, color(255, 0, 0), cf1);
  createButton("SUN", 4, width - 110, 155, color(255, 0, 0), cf1);
  createButton("MIN G TEMP", 5, width - 110, 205, color(255, 0, 0), cf1);
  createButton("MEAN MAX T", 6, width - 110, 255, color(255, 0, 0), cf1);
  createButton("MEAN MIN T", 7, width - 110, 305, color(255, 0, 0), cf1);
  createButton("WIND SPEED", 8, width - 110, 355, color(255, 0, 0), cf1);
  createButton("STATS", 9, width - 110, 405, color(255, 0, 0), cf1);
  createButton("RAIN V SUN", 10, width - 110, 455, color(255, 0, 0), cf1);
}

Button createButton(String theName, int theValue, int theX, int theY, color theColor, ControlFont font) 
{

  Button b = controlP5.addButton(theName, theValue, theX, theY, 100, 40);
  b.setColorActive(theColor); // color for mouse-over
  b.setColorBackground(color(0)); // default color
  b.getCaptionLabel().setFont(font);
  return b;
}

void controlEvent(ControlEvent theEvent)
{
  mode = (int)theEvent.getValue();
}

void loadData()
{

  String[] line = loadStrings("weatherData.csv");
  for (int i = 0; i < line.length; i ++)

  {
    DataInput dataInput = new DataInput(line[i]);
    data.add(dataInput);
  }
}

void loadData1()
{

  String[] line = loadStrings("mly532.csv");
  for (int i = 0; i < line.length; i ++)

  {
    StatInput statInput = new StatInput(line[i]);
    stats.add(statInput);
  }
}

void findstats()
{
  background(0);
  stroke(255);
  int mxrain =0;
  int mirain  =0;
  int mxtemp =0;
  int mitemp =0;
  int mxwind =0;
  int miwind =0;
  int mxsun =0;
  int misun =0;
  float maxrain;
  float minrain;
  float maxtemp;
  float mintemp;
  float maxwind;
  float minwind;
  float maxsun;
  float minsun;
  maxrain = stats.get(0).rain;
  minrain = stats.get(0).rain;
  maxtemp = stats.get(0).maxT;
  mintemp = stats.get(0).minT;
  maxwind = stats.get(0).wind;
  minwind = stats.get(0).wind;
  maxsun = stats.get(0).sun;
  minsun = stats.get(0).sun;


  for ( int i = 1; i < stats.size(); i++)
  {

    if (maxrain < stats.get(i).rain)
    {
      mxrain = i;
      maxrain = stats.get(i).rain;
    }
    if (minrain > stats.get(i).rain)
    {
      mirain = i;
      minrain = stats.get(i).rain;
    }
    if (maxtemp < stats.get(i).maxT)
    {
      mxtemp = i;
      maxtemp = stats.get(i).maxT;
    }
    if (mintemp > stats.get(i).minT)
    {
      mitemp = i;
      mintemp = stats.get(i).minT;
    }
    if (maxwind < stats.get(i).wind)
    {
      mxwind = i;
      maxwind = stats.get(i).wind;
    }
    if (minwind > stats.get(i).wind)
    {
      miwind = i;
      minwind = stats.get(i).wind;
    }
    if (maxsun < stats.get(i).sun)
    {
      mxsun = i;
      maxsun = stats.get(i).sun;
    }
    if (minsun > stats.get(i).sun)
    {
      misun = i;
      minsun = stats.get(i).sun;
    }
  }
  fill(255);
  textAlign(LEFT);  
  textSize(40);
  text("The AVG max rainfall from 1985-2014 was: "+ (maxrain) + "mm it recrded in "+ (stats.get(mxrain).month) + " of the year " + (stats.get(mxrain).year), width * 0.01f, 100 * 1);
  text("The AVG min rainfall from 1985-2014 was: "+ (minrain) + "mm it recorded in "+ (stats.get(mirain).month) + " of the year " + (stats.get(mirain).year), width * 0.01f, 50 * 3);
  text("The AVG max temp from 1985-2014 was: "+(maxtemp) + " Degrees C it recorded in "+ (stats.get(mxtemp).month) + " of the year " + (stats.get(mxtemp).year), width * 0.01f, 50 * 4);
  text("The AVG min temp from 1985-2014 was: "+(mintemp) + " Degrees C it reocrded in "+ (stats.get(mitemp).month) + " of the year " + (stats.get(mitemp).year), width * 0.01f, 50 * 5);
  text("The AVG max windspeed from 1985-2014 was: "+(maxwind) + "kt it recorded in "+ (stats.get(mxwind).month) + " of the year " + (stats.get(mxwind).year), width * 0.01f, 50 * 6);
  text("The AVG min windspeed from 1985-2014 was: "+(minwind) + "kt it recorded in "+ (stats.get(miwind).month) + " of the year " + (stats.get(miwind).year), width * 0.01f, 50 * 7);
  text("The AVG max sun hours from 1985-2014 was: "+(maxsun) + "H it recorded in "+ (stats.get(mxsun).month) + " of the year " + (stats.get(mxsun).year), width * 0.01f, 50 * 8);
  text("The AVG min sun hours from 1985-2014 was: "+(minsun) + "H it recorded in "+ (stats.get(misun).month) + " of the year " + (stats.get(misun).year), width * 0.01f, 50 * 9);
  text("The final button shows that there is no link between the amount of sun we get and the rain fall,", width * 0.01f, 50 * 11);
  text("blue is for rain and red is for sun.", width * 0.01f, 50 * 12);
}

void keyPressed()
{
  if (key > '0' && key <='9')
  {
    mode = key - '0';
  }
}


void draw()
{
  switch (mode)
  {    
  case 1 : 
    drawrain();  
    break; 
  case 2 : 
    drawmintemp();
    break; 
  case 3 : 
    drawmaxtemp();
    break; 
  case 4 : 
    drawsun();
    break; 
  case 5 : 
    drawgtemp();
    break;
  case 6 : 
    drawmeanmax();
    break;
  case 7 : 
    drawmeanmin();
    break;
  case 8 : 
    drawWind();
    break;
  case 9 : 
    findstats();
    break;
  case 10 : 
    rainvsun();
    break;
  }
}// end of the draw method

void rainvsun()
{
  background(backImage);
  stroke(0);
  strokeWeight(0);
  float barWidth = (width - 120) / (float) stats.size();
  for (int i = 0; i < stats.size(); i ++)
  {
    float x = i * barWidth;
    fill(0, 0, 255);
    rect(x, height, barWidth, - map(stats.get(i).rain, 0, 500, height, 0));
    fill(255, 0, 0,125);
    stroke(255);
    rect(x, height, barWidth, - map(stats.get(i).sun, 0, 500, height, 0));
  }
}

void drawsun()
{
  background(0); 
  float border = height * 0.1f; 
  // Print the text 
  textAlign(CENTER, CENTER); 
  float textY = (border * 0.5f); 
  textSize(30); 
  text("AVG sun in hours per year 1985 - 2014", width * 0.5f, textY); 

  drawsunAxis( 29, 15, 150, border); 
  float xRange = (width - (border * 2.0f)); 
  // float dataRange = 200; 
  stroke(0, 0, 255); 
  strokeWeight(4); 
  for (int i = 1; i < data.size(); i ++)
  {
    float x1 = map(i - 1, 0, data.size(), border, border + xRange); 
    float x2 = map(i, 0, data.size(), border, border + xRange); 
    float y1 = map(data.get(i - 1).sunhours, 100, 150, height - border, border); 
    float y2 = map(data.get(i).sunhours, 100, 150, height - border, border);
    line(x1, y1, x2, y2);
  }
  for (int i = 0; i < data.size(); i ++)
  {
    stroke(0, 255, 0); 
    strokeWeight(10);
    float x = map(i, 0, data.size(), border, border + xRange); 
    float y = map(data.get(i).sunhours, 100, 150, height - border, border); 
    point(x, y);
  }
}

void drawsunAxis(int xIntervals, int yIntervals, float yRange, float border)
{
  stroke(255, 0, 0); 
  strokeWeight(2); 
  fill(200, 200, 200); 

  // Draw the horizontal azis  
  line(border, height - border, width - border, height - border); 

  float xRange = (width - (border * 2.0f)); 
  float tickSize = border * 0.1f; 

  for (int i = 0; i <= xIntervals; i ++)
  {   
    // Draw the ticks
    float x = map(i, 0, xIntervals, border, border + xRange); 
    line(x, height - (border - tickSize), x, (height - border)); 

    textAlign(CENTER, CENTER); 
    fill(0, 255, 0); 
    textSize(15); 
    float textY = height - (border * 0.5f); 
    text((int) map(i, 0, xIntervals, 1985, 2014), x, textY);
  } 

  // Draw the vertical axis
  line(border, border, border, height - border); 
  stroke(255, 0, 0); 
  strokeWeight(2); 
  for (int i = 0; i <= yIntervals; i ++)
  {
    float y = map(i, 0, yIntervals, height - border, border); 
    line(border - tickSize, y, border, y); 
    float hAxisLabel = map(i, 0, yIntervals, 100, yRange); 

    textAlign(RIGHT, CENTER); 
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
}


void drawgtemp()
{
  background(0); 
  float border = height * 0.1f; 
  // Print the text 
  textAlign(CENTER, CENTER); 
  float textY = (border * 0.5f); 
  textSize(30); 
  text("AVG minium ground temp in C' per year 1985 - 2014", width * 0.5f, textY); 

  drawgTAxis( 29, 6, 0, border); 
  float xRange = (width - (border * 2.0f));  

  stroke(0, 0, 255); 
  strokeWeight(4); 
  for (int i = 1; i < data.size(); i ++)
  {
    float x1 = map(i - 1, 0, data.size(), border, border + xRange); 
    float x2 = map(i, 0, data.size(), border, border + xRange); 
    float y1 = map(data.get(i - 1).mingroundTemp, -6, 0, height - border, border); 
    float y2 = map(data.get(i).mingroundTemp, -6, 0, height - border, border); 
    line(x1, y1, x2, y2);
  }
  for (int i = 0; i < data.size(); i ++)
  {
    stroke(0, 255, 0); 
    strokeWeight(10);
    float x = map(i, 0, data.size(), border, border + xRange); 
    float y = map(data.get(i).mingroundTemp, -6, 0, height - border, border); 
    point(x, y);
  }
}

void drawgTAxis(int xIntervals, int yIntervals, float yRange, float border)
{
  stroke(255, 0, 0); 
  strokeWeight(2); 
  fill(200, 200, 200); 

  // Draw the horizontal azis  
  line(border, height - border, width - border, height - border); 

  float xRange = (width - (border * 2.0f)); 
  float tickSize = border * 0.1f; 

  for (int i = 0; i <= xIntervals; i ++)
  {   
    // Draw the ticks
    float x = map(i, 0, xIntervals, border, border + xRange); 
    line(x, height - (border - tickSize), x, (height - border)); 

    textAlign(CENTER, CENTER); 
    fill(0, 255, 0); 
    textSize(15); 
    float textY = height - (border * 0.5f); 
    text((int) map(i, 0, xIntervals, 1985, 2014), x, textY);
  } 

  // Draw the vertical axis
  line(border, border, border, height - border); 
  stroke(255, 0, 0); 
  strokeWeight(2); 
  for (int i = 0; i <= yIntervals; i ++)
  {
    float y = map(i, 0, yIntervals, height - border, border); 
    line(border - tickSize, y, border, y); 
    float hAxisLabel = map(i, 0, yIntervals, -6, yRange); 

    textAlign(RIGHT, CENTER); 
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
}


void drawmintemp()
{
  background(0); 
  float border = height * 0.1f; 
  // Print the text 
  textAlign(CENTER, CENTER); 
  float textY = (border * 0.5f); 
  textSize(30); 
  text("AVG minium temp in C' per year 1985 - 2014", width * 0.5f, textY); 

  drawminTAxis( 29, 8, 4, border); 
  float xRange = (width - (border * 2.0f));  


  for (int i = 1; i < data.size(); i ++)
  {

    float x1 = map(i - 1, 0, data.size(), border, border + xRange); 
    float x2 = map(i, 0, data.size(), border, border + xRange); 
    float y1 = map(data.get(i - 1).minTemp, -4, 4, height - border, border); 
    float y2 = map(data.get(i).minTemp, -4, 4, height-border, border);     
    stroke(0, 0, 255);
    strokeWeight(4);
    line(x1, y1, x2, y2);
  }
  for (int i = 0; i < data.size(); i++)
  {

    float x= map(i, 0, data.size(), border, border + xRange); 
    float y = map(data.get(i).minTemp, -4, 4, height-border, border);     
    stroke(0, 255, 0); 
    strokeWeight(10);
    point(x, y);
  }
}

void drawminTAxis(int xIntervals, int yIntervals, float yRange, float border)
{
  stroke(255, 0, 0); 
  strokeWeight(2); 
  fill(200, 200, 200); 

  // Draw the horizontal azis  
  line(border, height - border, width - border, height - border); 

  float xRange = (width - (border * 2.0f)); 
  float tickSize = border * 0.1f; 

  for (int i = 0; i <= xIntervals; i ++)
  {   
    // Draw the ticks
    float x = map(i, 0, xIntervals, border, border + xRange); 
    line(x, height - (border - tickSize), x, (height - border)); 

    textAlign(CENTER, CENTER); 
    fill(0, 255, 0); 
    textSize(15); 
    float textY = height - (border * 0.5f); 
    text((int) map(i, 0, xIntervals, 1985, 2014), x, textY);
  } 

  // Draw the vertical axis
  line(border, border, border, height - border); 
  stroke(255, 0, 0); 
  strokeWeight(2); 
  for (int i = 0; i <= yIntervals; i ++)
  {
    float y = map(i, 0, yIntervals, height - border, border); 
    line(border - tickSize, y, border, y); 
    float hAxisLabel = map(i, 0, yIntervals, -4, yRange); 

    textAlign(RIGHT, CENTER); 
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
}



void drawmaxtemp()
{
  background(0); 
  float border = height * 0.1f; 
  // Print the text 
  textAlign(CENTER, CENTER); 
  float textY = (border * 0.5f); 
  textSize(30); 
  text("AVG maxium temp in C' per year 1985 - 2014", width * 0.5f, textY); 

  drawmtAxis( 29, 5, 20, border); 
  float xRange = (width - (border * 2.0f)); 

  stroke(0, 0, 255); 
  strokeWeight(4); 
  for (int i = 1; i < data.size(); i ++)
  {
    float x1 = map(i - 1, 0, data.size(), border, border + xRange); 
    float x2 = map(i, 0, data.size(), border, border + xRange); 
    float y1 = map(data.get(i - 1).maxTemp, 15, 20, height - border, border); 
    float y2 = map(data.get(i).maxTemp, 15, 20, height - border, border); 
    line(x1, y1, x2, y2);
  }
  for (int i = 0; i < data.size(); i ++)
  {
    stroke(0, 255, 0); 
    strokeWeight(10);
    float x = map(i, 0, data.size(), border, border + xRange); 
    float y = map(data.get(i).maxTemp, 15, 20, height - border, border); 
    point(x, y);
  }
}

void drawmtAxis(int xIntervals, int yIntervals, float yRange, float border)
{
  stroke(255, 0, 0); 
  strokeWeight(2); 
  fill(200, 200, 200); 

  // Draw the horizontal azis  
  line(border, height - border, width - border, height - border); 

  float xRange = (width - (border * 2.0f)); 
  float tickSize = border * 0.1f; 

  for (int i = 0; i <= xIntervals; i ++)
  {   
    // Draw the ticks
    float x = map(i, 0, xIntervals, border, border + xRange); 
    line(x, height - (border - tickSize)
      , x, (height - border)); 

    textAlign(CENTER, CENTER); 
    fill(0, 255, 0); 
    textSize(15); 
    float textY = height - (border * 0.5f); 
    text((int) map(i, 0, xIntervals, 1985, 2014), x, textY);
  } 

  // Draw the vertical axis
  line(border, border, border, height - border); 
  stroke(255, 0, 0); 
  strokeWeight(2); 
  for (int i = 0; i <= yIntervals; i ++)
  {
    float y = map(i, 0, yIntervals, height - border, border); 
    line(border - tickSize, y, border, y); 
    float hAxisLabel = map(i, 0, yIntervals, 15, yRange); 

    textAlign(RIGHT, CENTER); 
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
}



void drawrain()
{
  background(0); 
  float border = height * 0.1f; 
  // Print the text 
  textAlign(CENTER, CENTER); 
  float textY = (border * 0.5f); 
  textSize(30); 
  text("Rainfall avg in mm per year 1985 - 2014", width * 0.5f, textY); 

  drawrainAxis( 29, 15, 110, border); 
  float xRange = (width - (border * 2.0f)); 
  float dataRange = 110; 

  stroke(0, 0, 255); 
  strokeWeight(4); 
  for (int i = 1; i < data.size(); i ++)
  {
    float x1 = map(i - 1, 0, data.size(), border, border + xRange); 
    float x2 = map(i, 0, data.size(), border, border + xRange); 
    float y1 = map(data.get(i - 1).rain, 20, dataRange, height - border, border); 
    float y2 = map(data.get(i).rain, 20, dataRange, height - border, border); 
    line(x1, y1, x2, y2);
  }
  for (int i = 0; i < data.size(); i ++)
  {
    stroke(0, 255, 0); 
    strokeWeight(8);
    float x = map(i, 0, data.size(), border, border + xRange); 
    float y = map(data.get(i).rain, 20, 110, height - border, border); 
    point(x, y);
  }
}

void drawrainAxis(int xIntervals, int yIntervals, float yRange, float border)
{
  stroke(255, 0, 0); 
  strokeWeight(2); 
  fill(200, 200, 200); 

  // Draw the horizontal azis  
  line(border, height - border, width - border, height - border); 

  float xRange = (width - (border * 2.0f)); 
  float tickSize = border * 0.1f; 

  for (int i = 0; i <= xIntervals; i ++)
  {   
    // Draw the ticks
    float x = map(i, 0, xIntervals, border, border + xRange); 
    line(x, height - (border - tickSize), x, (height - border)); 
    textAlign(CENTER, CENTER); 
    fill(0, 255, 0); 
    textSize(15); 
    float textY = height - (border * 0.5f); 
    text((int) map(i, 0, xIntervals, 1985, 2014), x, textY);
  } 

  // Draw the vertical axis
  line(border, border, border, height - border); 
  stroke(255, 0, 0); 
  strokeWeight(2); 
  for (int i = 0; i <= yIntervals; i ++)
  {
    float y = map(i, 0, yIntervals, height - border, border); 
    line(border - tickSize, y, border, y); 
    float hAxisLabel = map(i, 0, yIntervals, 20, yRange); 

    textAlign(RIGHT, CENTER); 
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
}

void drawWind()
{
  background(0); 
  float border = height * 0.1f; 
  // Print the text 
  textAlign(CENTER, CENTER); 
  float textY = (border * 0.5f); 
  textSize(30); 
  text("AVG wind speed per year in Knots 1985 - 2014", width * 0.5f, textY); 

  drawWindAxis( 29, 6, 14, border); 
  float xRange = (width - (border * 2.0f)); 
  float dataRange = 14; 

  stroke(0, 0, 255); 
  strokeWeight(4); 
  for (int i = 1; i < data.size(); i ++)
  {
    float x1 = map(i - 1, 0, data.size(), border, border + xRange); 
    float x2 = map(i, 0, data.size(), border, border + xRange); 
    float y1 = map(data.get(i - 1).windSpeed, 8, dataRange, height - border, border); 
    float y2 = map(data.get(i).windSpeed, 8, dataRange, height - border, border); 
    line(x1, y1, x2, y2);
  }
  for (int i = 0; i < data.size(); i ++)
  {
    stroke(0, 255, 0); 
    strokeWeight(10); 
    float x = map(i, 0, data.size(), border, border + xRange); 
    float y = map(data.get(i).windSpeed, 8, dataRange, height - border, border); 
    point(x, y);
  }
}

void drawWindAxis(int xIntervals, int yIntervals, float yRange, float border)
{
  stroke(255, 0, 0); 
  strokeWeight(2); 
  fill(200, 200, 200); 

  // Draw the horizontal azis  
  line(border, height - border, width - border, height - border); 

  float xRange = (width - (border * 2.0f)); 
  float tickSize = border * 0.1f; 

  for (int i = 0; i <= xIntervals; i ++)
  {   
    // Draw the ticks
    float x = map(i, 0, xIntervals, border, border + xRange); 
    line(x, height - (border - tickSize), x, (height - border)); 

    textAlign(CENTER, CENTER); 
    fill(0, 255, 0); 
    textSize(15); 
    float textY = height - (border * 0.5f); 
    text((int) map(i, 0, xIntervals, 1985, 2014), x, textY);
  } 

  // Draw the vertical axis
  line(border, border, border, height - border); 
  stroke(255, 0, 0); 
  strokeWeight(2); 
  for (int i = 0; i <= yIntervals; i ++)
  {
    float y = map(i, 0, yIntervals, height - border, border); 
    line(border - tickSize, y, border, y); 
    float hAxisLabel = map(i, 0, yIntervals, 8, yRange); 

    textAlign(RIGHT, CENTER); 
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
}

void drawmeanmin()
{
  background(0); 
  float border = height * 0.1f; 
  // Print the text 
  textAlign(CENTER, CENTER); 
  float textY = (border * 0.5f); 
  textSize(30); 
  text("Mean AVG min Temp in C'per year 1985 - 2014", width * 0.5f, textY); 

  drawmminAxis( 15, 4, 8, border); 
  float xRange = (width - (border * 2.0f)); 
  float dataRange = 8; 

  stroke(0, 0, 255); 
  strokeWeight(4); 
  for (int i = 1; i < data.size(); i ++)
  {
    float x1 = map(i - 1, 0, data.size(), border, border + xRange); 
    float x2 = map(i, 0, data.size(), border, border + xRange); 
    float y1 = map(data.get(i - 1).meanminTemp, 4, dataRange, height - border, border); 
    float y2 = map(data.get(i).meanminTemp, 4, dataRange, height - border, border); 
    line(x1, y1, x2, y2);
  }
  for (int i = 0; i < data.size(); i ++)
  {
    stroke(0, 255, 0); 
    strokeWeight(10); 
    float x = map(i, 0, data.size(), border, border + xRange); 
    float y = map(data.get(i).meanminTemp, 4, dataRange, height - border, border); 
    point(x, y);
  }
}

void drawmminAxis(int xIntervals, int yIntervals, float yRange, float border)
{
  stroke(255, 0, 0); 
  strokeWeight(2); 
  fill(200, 200, 200); 

  // Draw the horizontal azis  
  line(border, height - border, width - border, height - border); 

  float xRange = (width - (border * 2.0f)); 
  float tickSize = border * 0.1f; 

  for (int i = 0; i <= xIntervals; i ++)
  {   
    // Draw the ticks
    float x = map(i, 0, xIntervals, border, border + xRange); 
    line(x, height - (border - tickSize)
      , x, (height - border)); 

    textAlign(CENTER, CENTER); 
    fill(0, 255, 0); 
    textSize(15); 
    float textY = height - (border * 0.5f); 
    text((int) map(i, 0, xIntervals, 1985, 2014), x, textY);
  } 

  // Draw the vertical axis
  line(border, border, border, height - border); 
  stroke(255, 0, 0); 
  strokeWeight(2); 
  for (int i = 0; i <= yIntervals; i ++)
  {
    float y = map(i, 0, yIntervals, height - border, border); 
    line(border - tickSize, y, border, y); 
    float hAxisLabel = map(i, 0, yIntervals, 4, yRange); 

    textAlign(RIGHT, CENTER); 
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
}

void drawmeanmax()
{
  background(0); 
  float border = height * 0.1f; 
  // Print the text 
  textAlign(CENTER, CENTER); 
  float textY = (border * 0.5f); 
  textSize(30); 
  text("Mean AVG max Temp in C'per year 1985 - 2014", width * 0.5f, textY); 

  drawmmaxAxis( 29, 5, 15, border); 
  float xRange = (width - (border * 2.0f)); 
  float dataRange = 15; 

  stroke(0, 0, 255); 
  strokeWeight(4); 
  for (int i = 1; i < data.size(); i ++)
  {
    float x1 = map(i - 1, 0, data.size(), border, border + xRange); 
    float x2 = map(i, 0, data.size(), border, border + xRange); 
    float y1 = map(data.get(i - 1).meanmaxTemp, 10, dataRange, height - border, border); 
    float y2 = map(data.get(i).meanmaxTemp, 10, dataRange, height - border, border); 
    line(x1, y1, x2, y2);
  }
  for (int i = 0; i < data.size(); i ++)
  {
    stroke(0, 255, 0); 
    strokeWeight(10); 
    float x = map(i, 0, data.size(), border, border + xRange); 
    float y = map(data.get(i).meanmaxTemp, 10, dataRange, height - border, border); 
    point(x, y);
  }
}

void drawmmaxAxis(int xIntervals, int yIntervals, float yRange, float border)
{
  stroke(255, 0, 0); 
  strokeWeight(2); 
  fill(200, 200, 200); 

  // Draw the horizontal azis  
  line(border, height - border, width - border, height - border); 

  float xRange = (width - (border * 2.0f)); 
  float tickSize = border * 0.1f; 

  for (int i = 0; i <= xIntervals; i ++)
  {   
    // Draw the ticks
    float x = map(i, 0, xIntervals, border, border + xRange); 
    line(x, height - (border - tickSize), x, (height - border)); 

    textAlign(CENTER, CENTER); 
    fill(0, 255, 0); 
    textSize(15); 
    float textY = height - (border * 0.5f); 
    text((int) map(i, 0, xIntervals, 1985, 2014), x, textY);
  } 

  // Draw the vertical axis
  line(border, border, border, height - border); 
  stroke(255, 0, 0); 
  strokeWeight(2); 
  for (int i = 0; i <= yIntervals; i ++)
  {
    float y = map(i, 0, yIntervals, height - border, border); 
    line(border - tickSize, y, border, y); 
    float hAxisLabel = map(i, 0, yIntervals, 10, yRange); 

    textAlign(RIGHT, CENTER); 
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
}