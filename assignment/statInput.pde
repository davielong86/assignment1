class StatInput
{
  int year;
  String month;
  float maxT;
  float minT;
  float rain;
  float sun;
  float wind;

  StatInput(int year,String month, float maxT, float minT, float rain,float wind, float sun)
  {
    this.year = year;
    this.month = month;
    this.maxT =  maxT;
    this.minT =  minT;
    this.rain = rain;
    this.wind =  wind;
    this.sun = sun;
  }

  StatInput(String line)
  {
    String[] lines = line.split(",");
    year = (Integer.parseInt(lines[0]));
    month = (lines[1]);
    maxT = (Float.parseFloat(lines[2]));
    minT = (Float.parseFloat(lines[3]));
    rain = (Float.parseFloat(lines[6]));
    wind = (Float.parseFloat(lines[8]));
    sun = (Float.parseFloat(lines[9]));
  }
  
  
}