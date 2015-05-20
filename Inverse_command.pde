/**
Program: Inverse Command
Author: Abdulnasir Mohammed
Class: Computer Graphics
Date: 05/18/15
Credits: http://www.johndcook.com/blog/2009/08/24/algorithms-convert-color-grayscale/
**/

PImage construction;
PImage original;
int[] lightnessValues;

void setup() {

  String[] lines = loadStrings("data.txt");
  //println ("there are " + lines.length + " lines");
  construction = loadImage(lines[0]);
  original = loadImage("sun.jpg");
  
  int height = construction.height;
  int width = construction.width;
  size(width, height);
  lightnessValues = int(split(lines[1], ','));
  //println(lightnessValues);
}


void draw(){
  int loc;
  int redValue, greenValue, blueValue;
   // image(original, 0, 0 );
  Boolean doCalc = true;
   if (mousePressed & (mouseButton == RIGHT))
  {
      image(original, 0, 0 );
  }


 if (mousePressed && doCalc && (mouseButton == LEFT )){
    //println("mouse pressed");
    
    doCalc = false;
    for (int i =0; i < lightnessValues.length-1; i++)
    {
      image(original, 0, 0);
      loadPixels();
      for (int y = 0; y < height; y++)
        for (int x = 0; x < width; x++){
          loc = x +y * width;
          
          redValue = int(red(pixels[loc]));
          blueValue = int (blue(pixels[loc]));
          greenValue = int (green(pixels[loc]));
 
         int newRed = (255 - redValue);
         int newBlue = (255 - blueValue);
         int newGreen = (255 - greenValue);
   
         pixels[loc] = color(newRed, newGreen, newBlue);

        }  
        updatePixels();
        saveFrame("inverse.jpg");
    } 
  }
}


    

