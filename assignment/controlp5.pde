// controlP5 function to change colour of background
public void controlEvent(ControlEvent c) {
  // value from the controlP5 picker is got from the 
  //array value RGBA
  if(c.isFrom(cp)) {
    int r = int(c.getArrayValue(0));
    int g = int(c.getArrayValue(1));
    int b = int(c.getArrayValue(2));
    int a = int(c.getArrayValue(3));
    color col = color(r,g,b,a);
  }
}
