class DataInput
{
  int year;
  float maxTemp;
  float minTemp;
  float meanmaxTemp;
  float meanminTemp;
  float mingroundTemp;
  float rain;
  float sunhours;
  float windSpeed;

 
  DataInput(int year, float maxTemp, float minTemp, 
    float meanmaxTemp, float meanminTemp, float rain, 
    float mingroundTemp, float windSpeed, float sunhours)
  {
    this.year = year;
    this.maxTemp =  maxTemp;
    this.minTemp =  minTemp;
    this.meanmaxTemp = meanmaxTemp;
    this.meanminTemp =  meanminTemp;
    this.rain = rain;
    this.mingroundTemp = mingroundTemp;
    this.windSpeed =  windSpeed;
    this.sunhours = sunhours;
  }

  DataInput(String line)
  {
    String[] lines = line.split(",");
    year = (Integer.parseInt(lines[0]));
    maxTemp = (Float.parseFloat(lines[1]));
    minTemp = (Float.parseFloat(lines[2]));
    meanmaxTemp = (Float.parseFloat(lines[3]));
    meanminTemp = (Float.parseFloat(lines[4]));
    rain = (Float.parseFloat(lines[5]));
    mingroundTemp = (Float.parseFloat(lines[6]));
    windSpeed = (Float.parseFloat(lines[7]));
    sunhours = (Float.parseFloat(lines[8]));
  }
}