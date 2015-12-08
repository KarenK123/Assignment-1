/*Assignment1 OOP DT228
C14481598 
Karen Kilroy
Programme follows the fall of the CD sales and
the rise of the online sale. The rise of the online sales has
rendered interesting statistics about the popularity of
genres. This is representated in a bubble chart visualisation.
*/


// Declaring a variable of type PImage, for the home screen (0)
PImage img; 

//importing controlP5 colorpicker from libraries
import controlP5.*;
ControlP5 cp5;
ColorPicker cp;


//declaring arrays
//years array holds string years for bottom axis it is used in graph1 & 2
String[] years;

//graph 1 only
//online array holds data for online sales
float[] online;
//cd array holds data for cd sales
float[] cd;

//graph 2 only
//used to hold popularity of songs from genre purchased
//data found: The LastFM Million song dataset
float[] rock;
float[] pop;
float[] hiphop;
float[] edm;
float[] country;
float[] christian;



void setup()
{
  size(500, 500, P3D); 
  stroke(255);
  
  //loading image
  img = loadImage("wallpaper.jpeg");
  
  //adding color picker from ConrolP5
  cp5 = new ControlP5(this);
  cp = cp5.addColorPicker("picker")
          .setPosition(0, 0)
          .setColorValue(color(0, 0, 0, 128))
          ;
  
  
  
  //loading online txt file by comma
  String[] stuff = loadStrings("OnlineSales.txt");
  online = float(split(stuff[0],','));
  
  //loading cd txt file by comma
  String[] stuff2 = loadStrings("cdSales.txt");
  cd = float(split(stuff2[0],','));
  
  //loading years txt file by spaces
  String[] stuff3 = loadStrings("years.txt");
  years = split(stuff3[0], ',');
  
  //loading rock txt file by comma
  String[] stuff4 = loadStrings("rock.txt");
  rock = float(split(stuff4[0],','));
  
  //loading pop txt file by comma
  String[] stuff5 = loadStrings("pop.txt");
  pop = float(split(stuff5[0],','));
  
  //loading pop txt file by comma
  String[] stuff6 = loadStrings("hiphop.txt");
  hiphop = float(split(stuff6[0],','));
  
  //loading pop txt file by comma
  String[] stuff7 = loadStrings("edm.txt");
  edm = float(split(stuff7[0],','));
  
  //loading pop txt file by comma
  String[] stuff8 = loadStrings("country.txt");
  country = float(split(stuff8[0],','));
  
  //loading pop txt file by comma
  String[] stuff9 = loadStrings("christian.txt");
  christian = float(split(stuff9[0],','));
  
  //printing minimum sales and maximum CD sales
  int minSales = minIndex(cd);
  println(years[minSales] + " had the minimum CD sales of: " + cd[minSales]);
  int maxSales = maxIndex(cd);
  println(years[maxSales] + " had the maximum CD sales of: " + cd[maxSales]);
  
  //printing minimum sales and maximum Online music sales
  int minSales1 = minIndex(online);
  println(years[minSales1] + " had the minimum online sales of: " + online[minSales1]);
  int maxSales1 = maxIndex(online);
  println(years[maxSales1] + " had the maximum online sales of: " + online[maxSales1]);
  
}

//calculating minumum index
int minIndex(float[] r)
{
  float min = r[0];
  int minIndex = 0;
  for (int i = 1 ; i < r.length ; i ++)
  {
    if (r[i] < min)
    {
      min = r[i];
      minIndex = i;
    }
  }
  return minIndex;
}

//calculating maximum index
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

//rotation variables for the disco ball
float rotationX = 0;
float rotationY = 0;

//int mode for switch case
int mode = 0;

void draw(){
  
  //implementing ConrolP5 getting colour
  background(cp.getColorValue());
  fill(0, 80);
  
  
  //switch cases 0-3
  switch (mode)
  {    
    //MENU PAGE
    case 0:         
      //image as full width and height, therefore used as background
      image(img, 0, 0, width, height);
      //fill text
      fill(255);
      textAlign(LEFT);
      textSize(20);
      //welcome message and instructions
      text("Welcome!", 10, 100);
      textSize(12);
      text("The following graphs follow the \nbattle between CD sales & \nonline music Sales.", 10, 150);
      text("Press 1 on your key board to \nview: a line graph showing CD vs \nOnline sales in the last ten years.", 10, 210);
      text("Since the rise of Online sales \nhas brought new data,\nnow it is known, which genre is\nthe most popular.", 10, 270);
      text("Press 2 to see this in the form of a \nbubble chart!", 10, 350);
      text("Press 3 to see a cool minum vistualisation to dance to!", 10, 400);
      text("Press 4 to see the disco ball!", 10, 420);
      text("Change the background light in the colour picker to get the full disco experience", 10, 450);
      text("Press 0 to return here.", 10, 480);

  break;
  /*LINE GRAPH - showing the fall in CD sales and rise in 
  Online music sales in past 10 years*/
  case 1:
  {
    //calculating border and window size to display graph
    //border indented by 15% of width
    float border = width * 0.15f;
    //calling drawAxis function
    //15 indicates that bar goes up in 102000/17 meaning 6,000s, 102000 is the biggest result
    drawAxis(online, years, 17, 102000, border);
      
    //2 indicates the width of the line 
    float windowRange = (width - (border * 2.0f));
    float dataRange = 102000;     
    //minus 1 as it is minus 10% 
    float lineWidth =  windowRange / (float) (years.length - 1) ;
        
    float scale = windowRange / dataRange;
        
    //drawing the graph for the online sales
    for (int i = 1 ; i < online.length ; i ++)
    {
      float x1 = border + ((i - 1) * lineWidth);
      float x2 = border + (i * lineWidth);
      float y1 = (height - border) - (online[i - 1]) * scale;
      float y2 = (height - border) - (online[i]) * scale;
      stroke(0, 255, 255);
      line(x1, y1, x2, y2);
    }  
        
    //drawing the graph for the cd sales    
    for (int i = 1 ; i < cd.length ; i ++)
    {
      float x1 = border + ((i - 1) * lineWidth);
      float x2 = border + (i * lineWidth);
      float y1 = (height - border) - (cd[i - 1]) * scale;
      float y2 = (height - border) - (cd[i]) * scale;
      stroke(255, 0, 255);
      line(x1, y1, x2, y2);
    }  
        
    //writing the text key
    textAlign(LEFT);
    fill(255);
    text("04 = 2004 years", 300, 20);
    text("04 = 6800 = downloads per year", 300, 40);
    fill(0, 255, 255);
    text("---- online downloads per year", 300, 60);
    fill(255, 0, 255);
    text("---- cd sales per year", 300, 80);
  }
  break;
  //BUBBLE CHART showing popular genres, gotten for online music sales
  case 2:
  {
    //border indented by width - 15%
      float border = width * 0.15f;
      //window is width - border on two sides plus .3 so that the data can start one point over
      float windowSpace = (width - (border * 2.525));
      float dataRange = 30;     
     //data space is the window / the length of the bottom sting variable
      float dataSpace =  windowSpace / (float) (years.length-1) ;
      
      //calling function drawAxis
      //17 indicates that bar goes up in 102000/17 meaning 6,000s, 102000 is the largest result
      drawAxis1(rock, years, 15, 30, border, windowSpace);
      
      //drawing the bubbles
      //the scale is the windowSpace / by the range which is 30
      float scale = windowSpace / dataRange;
      for (int i = 0 ; i < rock.length ; i ++)
      {
        float x2 = border + (i * dataSpace+40);
        float y2 = (height - border) - (rock[i]) * scale;
        fill(0, 225, 255, 100);
        //the size of the bubbles are relative to 0.02% of the number of sales 
        ellipse(x2, y2, (rock[i]), (rock[i]));
      }  
      
      //drawing the graph for the pop sales    
      for (int i = 0 ; i < pop.length ; i ++)
      {
        float x2 = border + (i * dataSpace+40);
        float y2 = (height - border) - (pop[i]) * scale;
        fill(255, 0, 255, 100);
        //the size of the bubbles are relative to 0.02% of the number of sales 
        ellipse(x2, y2, (pop[i]), (pop[i]));
      }  
      
      //drawing the graph for the pop sales    
      for (int i = 0 ; i < hiphop.length ; i ++)
      {
        float x2 = border + (i * dataSpace+40);
        float y2 = (height - border) - (hiphop[i]) * scale;
        fill(255, 0, 0, 100);
        //the size of the bubbles are relative to 0.02% of the number of sales 
        ellipse(x2, y2, (hiphop[i]), (hiphop[i]));
      }  
      
      //drawing the graph for the pop sales    
      for (int i = 0 ; i < edm.length ; i ++)
      {
        float x2 = border + (i * dataSpace+40);
        float y2 = (height - border) - (edm[i]) * scale;
        fill(0, 255, 0, 200);
        //the size of the bubbles are relative to 0.02% of the number of sales 
        ellipse(x2, y2, (edm[i]), (edm[i]));
      } 
      
      //drawing the graph for the pop sales    
      for (int i = 0 ; i < country.length ; i ++)
      {
        float x2 = border + (i * dataSpace+40);
        float y2 = (height - border) - (country[i]) * scale;
        fill(255, 255, 0, 100);
        //the size of the bubbles are relative to 0.02% of the number of sales 
        ellipse(x2, y2, (country[i]), (country[i]));
      }  
      
      //drawing the graph for the pop sales    
      for (int i = 0 ; i < christian.length ; i ++)
      {
        float x2 = border + (i * dataSpace+40);
        float y2 = (height - border) - (christian[i]) * scale;
        fill(0, 0, 255, 255);
        //the size of the bubbles are relative to 0.02% of the number of sales 
        ellipse(x2, y2, (christian[i]), (christian[i]));
      }  
      
      
    //writing the text key       
    textAlign(LEFT);
    fill(0, 255, 255);
    
    //coloumn2
    float z = width/4;
    text("--- Rock", z*3, 20);
    fill(255, 0, 255);
    text("--- Pop", z*3, 40);
    fill(255, 255, 0);
    text("--- Country", z*3, 60);
    fill(255, 0, 0);
    
    //column3
    float m = width/2;
    text("--- Hip Hop", m, 20);
    fill(0, 255, 0);
    text("--- EDM", m, 40);
    fill(0, 0, 255);
    text("--- Christian/Religious", m, 60);
  }
  break;
  case 3:
      //COOL MINUM VISUALISATION
      //random stroke with random opaque
      stroke(random(255), random(255),random(255),random(255));
      //calling note function
      note((int)random(455),(int)random(455));    
  break;
  case 4:
    //light coming from direction
    directionalLight(150, 150, 150, 0, 0, -150);
    //random lights like disco ball
    ambientLight(random(255), random(255), random(255));
     
    //rotating the sphere 
    rotationX += 0.1;
    rotationY += 0.2;
     
    //fill sphere and stroke 
    fill(random(255), random(255), random(255), random(255));
    stroke(255,100);
    
     //push 3d sphere
    pushMatrix();
    //set sphere size and depth
    translate(width/2, height/2, -150);
    //rotate using sina nd cos
    rotateX(sin(rotationX)/2);
    rotateY(cos(rotationY)/2);
    sphere(280);
    popMatrix();
  break;
}
}



//for case function, if key is pressed, go to that case.
void keyPressed()
{
  if (key >= '0' && key <='9')
  {
    mode = key - '0';
  }
  println(mode);
}
  
