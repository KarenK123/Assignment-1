//drawAxis function for line graph
void drawAxis(float[] data, String[] bottomText, int verticalIntervals, float vertDataRange, float border)
{
  stroke(255);
  fill(255);
  
  // Draw the horizontal azis  
  line(border, height - border, width - border, height - border);
  
  float windowRange = (width - (border * 2.0f));  
  float horizInterval =  windowRange / (data.length - 1);
  float tickSize = border * 0.1f;
  
    
  for (int i = 0 ; i < data.length ; i ++)
  {   
   // Drawing the ticks
   float x = border + (i * horizInterval);
   line(x, height - (border - tickSize), x, (height - border));
   float textY = height - (border * 0.5f);
   
   // Print the text 
   textAlign(CENTER, CENTER);
   text(bottomText[i].substring(2), x, textY);
   
  }
  
  // Drawing the vertical axis
  line(border, border , border, height - border);
  
  float verticalDataGap = vertDataRange / verticalIntervals;
  float verticalWindowRange = height - (border * 2.0f);
  float verticalWindowGap = verticalWindowRange / verticalIntervals; 
  for (int i = 0 ; i <= verticalIntervals ; i ++)
  {
    float y = (height - border) - (i * verticalWindowGap);
    line(border - tickSize, y, border, y);
    float hAxisLabel = verticalDataGap * i;
      
    //vertical text
    textAlign(RIGHT, CENTER);  
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
}






//drawing the axis foe bubble graph
void drawAxis1(float[] data, String[] bottomValues, int verticalGaps, float vertDataRange, float border, float windowSpace)
{
  //colours for the axis
  stroke(200, 200, 200);
  fill(200, 200, 200);  
  
  
  // Drawing the horizontal axis  around the windowSpace using border 
  line(border, height - border, width - border, height - border);
  float bottomGaps =  windowSpace / (data.length-1);
  float tickSize = border * 0.1f;
  
    
  for (int i = 0 ; i < data.length ; i ++)
  {   
   // Drawing the ticks
   float x = border + (i * bottomGaps);
   line(x+40, height - (border - tickSize), x+40, (height - border));
   // text is height-40% of border
   float textY = height - (border * 0.5f);
   
   // Print the text 
   textAlign(CENTER, CENTER);
   text(bottomValues[i].substring(2), x+40, textY);
   
  }
  
  // Draw the vertical axis
  line(border, border , border, height - border);
  
  float verticalDataGap = vertDataRange / verticalGaps;
  float verticalwindowSpace = height - (border * 2.0f);
  float verticalWindowGap = verticalwindowSpace / verticalGaps; 
  for (int i = 0 ; i <= verticalGaps ; i ++)
  {
    float y = (height - border) - (i * verticalWindowGap);
    line(border - tickSize, y, border, y);
    float hAxisLabel = verticalDataGap * i;
        
    textAlign(RIGHT, CENTER);  
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
  
  
  
}






//cool visualisation function that draws minum

void note (int x, int y){                    
  fill(random(255),random(255),random(255)); 
  //top line
  rect(37+x,5+y,37,1);                       
  //left line
  rect(37+x,5+y,1,50);                     
  //right line
  rect(75+x,5+y,1,50);                     
  //left circle
  ellipse(30+x,50+y,25,25);                  
  //right circle
  ellipse(65+x,50+y,25,25);                
}
   