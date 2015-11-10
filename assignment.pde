void setup()
{
  size(500, 500, P3D);  
 
  centX = width * 0.5f;
  centY = height * 0.5f;
  
  textMode(SHAPE);
  
}

float[] sums = {29, 17.2, 14.9, 11.2, 3.4, 4.8, 8, 2.2, 3.2, 6.1}; 
String[] years = {"Rock", "Popular", "Alternative", "Classical", "Rap", "Electronic", "Holiday", "Childrens", "R&B", "Blues"};


float centX, centY;


float sum(float[] array)
{
  float sum = 0;
  for (float r:array)
  {
    sum += r;
  }
  return sum;
}


int maxIndex(float[] r)
{
  float max = r[0];
  int maxIndex = 0;
  for (int i = 1 ; i < r.length ; i ++)
  {
    if (r[i] > max)
    {
      max = r[i];
      maxIndex = i;
    }
  }
  return maxIndex;
}

int mode = 0;


void draw()
{    
  background(0);
  float barWidth = width / (float) years.length;
 
     float sum = sum(sums);
     int maxIndex = maxIndex(sums);
     float max = sums[maxIndex];
     float thetaPrev = 0;
     for(int i = 0 ; i < sums.length ; i ++)
     {
       
       float theta = map(sums[i], 0, sum, 0, TWO_PI);
       textAlign(CENTER);
       float col = map(sums[i], 0, max, 255, 100);
       float thetaNext = thetaPrev + theta;
       float radius = centX * 0.6f;       
       float x = centX + sin(thetaPrev + (theta * 0.5f) + HALF_PI) * radius;      
       float y = centY - cos(thetaPrev + (theta * 0.5f) + HALF_PI) * radius;
       fill(255);//for text
       text(years[i], x, y);             
       stroke(0);
       fill(0, col, col);               
       arc(centX, centY, centX, centY, thetaPrev, thetaNext);
       thetaPrev = thetaNext;
     }
}
