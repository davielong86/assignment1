ArrayList<Float> amaxtemp;
ArrayList<Float> amintemp;
ArrayList<Float> rain;
ArrayList<Float> gmintemp;
ArrayList<Float> sunhours;
int  mode = 0;

/*
ArrayList<Float> loadmaxtemp()
{
  String[] lines = loadStrings("maxtemp.csv"); // Load each line into a String array
  amaxtemp = new ArrayList<Float>(); // Create an arraylist
  for (String s : lines)
  {
    // Add each element from the string array to the arrraylist
    float f = Float.parseFloat(s);
    amaxtemp.add(f);
  } 
  return amaxtemp;
}// end load max air temp

ArrayList<Float> loadmintemp()
{
  String[] lines2 = loadStrings("mintemp.csv"); // Load each line into a String array
  amintemp = new ArrayList<Float>(); // Create an arraylist
  for (String s : lines2)
  {
    // Add each element from the string array to the arrraylist
    float f = Float.parseFloat(s);
    amintemp.add(f);
  }
  return amintemp;
}//end of load min air temp

ArrayList<Float> loadrain()
{
  String[] lines3 = loadStrings("rain.csv"); // Load each line into a String array
  rain = new ArrayList<Float>(); // Create an arraylist
  for (String s : lines3)
  {
    // Add each element from the string array to the arrraylist
    float f = Float.parseFloat(s);
    rain.add(f);
  }
  return rain;
}//end of load rain

ArrayList<Float> loadgmin()
{
  String[] lines4 = loadStrings("gmintemp.csv"); // Load each line into a String array
  gmintemp = new ArrayList<Float>(); // Create an arraylist
  for (String s : lines4)
  {
    // Add each element from the string array to the arrraylist
    float f = Float.parseFloat(s);
    gmintemp.add(f);
  }
  return gmintemp;
}// end of load grass min temp

ArrayList<Float> loadsunhours()
{
  String[] lines5 = loadStrings("sunhours.csv"); // Load each line into a String array
  sunhours = new ArrayList<Float>(); // Create an arraylist
  for (String s : lines5)
  {
    // Add each element from the string array to the arrraylist
    float f = Float.parseFloat(s);
    sunhours.add(f);
  }
  return sunhours;
}// end of load sunhours file
*/
void loadData()
{

  String[] strings = loadStrings("data.csv"); // Load each line into a String array
  amaxtemp = new ArrayList<Float>(); // Create an arraylist
  amintemp = new ArrayList<Float>(); // Create an arraylist
  rain = new ArrayList<Float>(); // Create an arraylist
  gmintemp = new ArrayList<Float>(); // Create an arraylist
  sunhours = new ArrayList<Float>(); // Create an arraylist

  for (String s : strings)
  {

    String[] line = s.split(",");

    amaxtemp.add(Float.parseFloat(line[0]));

    amintemp.add(Float.parseFloat(line[1]));

    rain.add(Float.parseFloat(line[2]));

    gmintemp.add(Float.parseFloat(line[3]));

    sunhours.add(Float.parseFloat(line[4]));
  }
}


void setup()
{
  size(1000, 1000);

  /*loadmaxtemp();
  loadmintemp();
  loadrain();
  loadgmin();
  loadsunhours();
*/
loadData();
  displaymintemp();
  displaymaxtemp();
  displayrainfall();
  displaygtemp();
}

void keyPressed()
{
  if (key > '0' && key <='5')
  {
    mode = key - '0';
  }
}

void drawsun()
{
  background(0);
  float border = width * 0.1f;
  // Print the text 
  textAlign(CENTER, CENTER);   
  float textY = (border * 0.5f);
  textSize(30);
  text("AVG numbers of sun in hours 1985 - 2014", width * 0.5f, textY);

  drawsunAxis( 15, 30, 200, border);   
  float windowRange = (width - (border * 2.0f));
  float dataRange = 200;      

  stroke(0, 0, 255);
  strokeWeight(4);
  for (int i = 1; i < sunhours.size(); i ++)
  {
    float x1 = map(i - 1, 0, sunhours.size(), border, border + windowRange);
    float x2 = map(i, 0, sunhours.size(), border, border + windowRange);
    float y1 = map(sunhours.get(i - 1), 0, dataRange, height - border, (height - border) - windowRange);
    float y2 = map(sunhours.get(i), 0, dataRange, height - border, (height - border) - windowRange);
    line(x1, y1, x2, y2);
  }
}

void drawsunAxis(int horizIntervals, int verticalIntervals, float vertsumsumDataRange, float border)
{
  stroke(255, 0, 0);
  strokeWeight(2);
  fill(200, 200, 200);  

  // Draw the horizontal azis  
  line(border, height - border, width - border, height - border);

  float windowRange = (width - (border * 2.0f));  
  float tickSize = border * 0.1f;

  for (int i = 0; i <= horizIntervals; i ++)
  {   
    // Draw the ticks
    float x = map(i, 0, horizIntervals, border, border + windowRange);
    line(x, height - (border - tickSize)
      , x, (height - border));    

    textAlign(CENTER, CENTER);
    fill(0, 255, 0);
    textSize(15);
    float textY = height - (border * 0.5f); 
    text((int) map(i, 0, horizIntervals, 1985, 2014), x, textY);
  } 

  // Draw the vertical axis
  line(border, border, border, height - border);
  stroke(255, 0, 0);
  strokeWeight(2);
  for (int i = 0; i <= verticalIntervals; i ++)
  {
    float y = map(i, 0, verticalIntervals, height - border, border);
    line(border - tickSize, y, border, y);
    float hAxisLabel = map(i, 0, verticalIntervals, 0, vertsumsumDataRange);

    textAlign(RIGHT, CENTER);  
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
}


void drawgtemp()
{
  background(0);
  float border = width * 0.1f;
  // Print the text 
  textAlign(CENTER, CENTER);   
  float textY = (border * 0.5f);
  textSize(30);
  text("AVG minium ground temp in C' 1985 - 2014", width * 0.5f, textY);

  drawgTAxis( 15, 10, 5, border);   
  float windowRange = (width - (border * 2.0f));
  float dataRange = 10;      

  stroke(0, 0, 255);
  strokeWeight(4);
  for (int i = 1; i < rain.size(); i ++)
  {
    float x1 = map(i - 1, 0, gmintemp.size(), border, border + windowRange);
    float x2 = map(i, 0, gmintemp.size(), border, border + windowRange);
    float y1 = map(gmintemp.get(i - 1), -5, 5, height - border, (height - border) - windowRange);
    float y2 = map(gmintemp.get(i), -5, 5, height - border, (height - border) - windowRange);
    line(x1, y1, x2, y2);
  }
}

void drawgTAxis(int horizIntervals, int verticalIntervals, float vertsumsumDataRange, float border)
{
  stroke(255, 0, 0);
  strokeWeight(2);
  fill(200, 200, 200);  

  // Draw the horizontal azis  
  line(border, height - border, width - border, height - border);

  float windowRange = (width - (border * 2.0f));  
  float tickSize = border * 0.1f;

  for (int i = 0; i <= horizIntervals; i ++)
  {   
    // Draw the ticks
    float x = map(i, 0, horizIntervals, border, border + windowRange);
    line(x, height - (border - tickSize)
      , x, (height - border));    

    textAlign(CENTER, CENTER);
    fill(0, 255, 0);
    textSize(15);
    float textY = height - (border * 0.5f); 
    text((int) map(i, 0, horizIntervals, 1985, 2014), x, textY);
  } 

  // Draw the vertical axis
  line(border, border, border, height - border);
  stroke(255, 0, 0);
  strokeWeight(2);
  for (int i = 0; i <= verticalIntervals; i ++)
  {
    float y = map(i, 0, verticalIntervals, height - border, border);
    line(border - tickSize, y, border, y);
    float hAxisLabel = map(i, 0, verticalIntervals, -5, vertsumsumDataRange);

    textAlign(RIGHT, CENTER);  
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
}


void drawmintemp()
{
  background(0);
  float border = width * 0.1f;
  // Print the text 
  textAlign(CENTER, CENTER);   
  float textY = (border * 0.5f);
  textSize(30);
  text("AVG minium temp in C' 1985 - 2014", width * 0.5f, textY);

  drawminTAxis( 15, 10, 10, border);   
  float windowRange = (width - (border * 2.0f));
  float dataRange = 10;      

  stroke(0, 0, 255);
  strokeWeight(4);
  for (int i = 1; i < rain.size(); i ++)
  {
    float x1 = map(i - 1, 0, amintemp.size(), border, border + windowRange);
    float x2 = map(i, 0, amintemp.size(), border, border + windowRange);
    float y1 = map(amintemp.get(i - 1), 0, dataRange, height - border, (height - border) - windowRange);
    float y2 = map(amintemp.get(i), 0, dataRange, height - border, (height - border) - windowRange);
    line(x1, y1, x2, y2);
  }
}

void drawminTAxis(int horizIntervals, int verticalIntervals, float vertsumsumDataRange, float border)
{
  stroke(255, 0, 0);
  strokeWeight(2);
  fill(200, 200, 200);  

  // Draw the horizontal azis  
  line(border, height - border, width - border, height - border);

  float windowRange = (width - (border * 2.0f));  
  float tickSize = border * 0.1f;

  for (int i = 0; i <= horizIntervals; i ++)
  {   
    // Draw the ticks
    float x = map(i, 0, horizIntervals, border, border + windowRange);
    line(x, height - (border - tickSize)
      , x, (height - border));    

    textAlign(CENTER, CENTER);
    fill(0, 255, 0);
    textSize(15);
    float textY = height - (border * 0.5f); 
    text((int) map(i, 0, horizIntervals, 1985, 2014), x, textY);
  } 

  // Draw the vertical axis
  line(border, border, border, height - border);
  stroke(255, 0, 0);
  strokeWeight(2);
  for (int i = 0; i <= verticalIntervals; i ++)
  {
    float y = map(i, 0, verticalIntervals, height - border, border);
    line(border - tickSize, y, border, y);
    float hAxisLabel = map(i, 0, verticalIntervals, 0, vertsumsumDataRange);

    textAlign(RIGHT, CENTER);  
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
}



void drawmaxtemp()
{
  background(0);
  float border = width * 0.1f;
  // Print the text 
  textAlign(CENTER, CENTER);   
  float textY = (border * 0.5f);
  textSize(30);
  text("AVG maxium temp in C' 1985 - 2014", width * 0.5f, textY);

  drawmtAxis( 15, 30, 20, border);   
  float windowRange = (width - (border * 2.0f));
  float dataRange = 20;      

  stroke(0, 0, 255);
  strokeWeight(4);
  for (int i = 1; i < rain.size(); i ++)
  {
    float x1 = map(i - 1, 0, amaxtemp.size(), border, border + windowRange);
    float x2 = map(i, 0, amaxtemp.size(), border, border + windowRange);
    float y1 = map(amaxtemp.get(i - 1), 0, dataRange, height - border, (height - border) - windowRange);
    float y2 = map(amaxtemp.get(i), 0, dataRange, height - border, (height - border) - windowRange);
    line(x1, y1, x2, y2);
  }
}

void drawmtAxis(int horizIntervals, int verticalIntervals, float vertsumsumDataRange, float border)
{
  stroke(255, 0, 0);
  strokeWeight(2);
  fill(200, 200, 200);  

  // Draw the horizontal azis  
  line(border, height - border, width - border, height - border);

  float windowRange = (width - (border * 2.0f));  
  float tickSize = border * 0.1f;

  for (int i = 0; i <= horizIntervals; i ++)
  {   
    // Draw the ticks
    float x = map(i, 0, horizIntervals, border, border + windowRange);
    line(x, height - (border - tickSize)
      , x, (height - border));    

    textAlign(CENTER, CENTER);
    fill(0, 255, 0);
    textSize(15);
    float textY = height - (border * 0.5f); 
    text((int) map(i, 0, horizIntervals, 1985, 2014), x, textY);
  } 

  // Draw the vertical axis
  line(border, border, border, height - border);
  stroke(255, 0, 0);
  strokeWeight(2);
  for (int i = 0; i <= verticalIntervals; i ++)
  {
    float y = map(i, 0, verticalIntervals, height - border, border);
    line(border - tickSize, y, border, y);
    float hAxisLabel = map(i, 0, verticalIntervals, 0, vertsumsumDataRange);

    textAlign(RIGHT, CENTER);  
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
}



void drawrain()
{
  background(0);
  float border = width * 0.1f;
  // Print the text 
  textAlign(CENTER, CENTER);   
  float textY = (border * 0.5f);
  textSize(30);
  text("Rainfall avg in mm 1985 - 2014", width * 0.5f, textY);

  drawrainAxis( 15, 30, 100, border);   
  float windowRange = (width - (border * 2.0f));
  float dataRange = 100;      

  stroke(0, 0, 255);
  strokeWeight(4);
  for (int i = 1; i < rain.size(); i ++)
  {
    float x1 = map(i - 1, 0, rain.size(), border, border + windowRange);
    float x2 = map(i, 0, rain.size(), border, border + windowRange);
    float y1 = map(rain.get(i - 1), 0, dataRange, height - border, (height - border) - windowRange);
    float y2 = map(rain.get(i), 0, dataRange, height - border, (height - border) - windowRange);
    line(x1, y1, x2, y2);
  }
}

void drawrainAxis(int horizIntervals, int verticalIntervals, float vertsumsumDataRange, float border)
{
  stroke(255, 0, 0);
  strokeWeight(2);
  fill(200, 200, 200);  

  // Draw the horizontal azis  
  line(border, height - border, width - border, height - border);

  float windowRange = (width - (border * 2.0f));  
  float tickSize = border * 0.1f;

  for (int i = 0; i <= horizIntervals; i ++)
  {   
    // Draw the ticks
    float x = map(i, 0, horizIntervals, border, border + windowRange);
    line(x, height - (border - tickSize)
      , x, (height - border));    

    textAlign(CENTER, CENTER);
    fill(0, 255, 0);
    textSize(15);
    float textY = height - (border * 0.5f); 
    text((int) map(i, 0, horizIntervals, 1985, 2014), x, textY);
  } 

  // Draw the vertical axis
  line(border, border, border, height - border);
  stroke(255, 0, 0);
  strokeWeight(2);
  for (int i = 0; i <= verticalIntervals; i ++)
  {
    float y = map(i, 0, verticalIntervals, height - border, border);
    line(border - tickSize, y, border, y);
    float hAxisLabel = map(i, 0, verticalIntervals, 0, vertsumsumDataRange);

    textAlign(RIGHT, CENTER);  
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
}

void draw()
{
  switch (mode)
  {    
  case 1:

    drawrain();  
    break;

  case 2:
    drawmintemp();
    break;

  case 3:

    drawmaxtemp();
    break;

  case 4:

    drawsun();
    break;

  case 5:

    drawgtemp();

    break;
  }
}// end of the draw method


void displaymintemp()
{ 
  int year;
  year = 1985;
  for (int i = 0; i < amintemp.size(); i ++)
  {
    println( "The avg min temp for " + (year+i) + " was "  + amintemp.get(i));
  }
}
void displaymaxtemp()
{ 
  int year;
  year = 1985;
  for (int i = 0; i < amaxtemp.size(); i ++)
  {
    println( "The avg max temp for " + (year+i) + " was "  + amaxtemp.get(i));
  }
}
void displayrainfall()
{ 
  int year;
  year = 1985;
  for (int i = 0; i < rain.size(); i ++)
  {
    println( "The avg rainfall for " + (year+i) + " was "  + rain.get(i));
  }
}
void displaygtemp()
{ 
  int year;
  year = 1985;
  for (int i = 0; i < gmintemp.size(); i ++)
  {
    println( "The avg min ground temp for " + (year+i) + " was "  + gmintemp.get(i));
  }
}
void displaysun()
{ 
  int year;
  year = 1985;
  for (int i = 0; i < sunhours.size(); i ++)
  {
    println( "The avg number of sunhours for " + (year+i) + " was "  + sunhours.get(i));
  }
}