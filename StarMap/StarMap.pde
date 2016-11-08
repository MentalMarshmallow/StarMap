/*
Author:Vimal Jain
Student Number: C15309056
Date:8/11/16
Version 4
Lab Test 1
*/

ArrayList<Star> data=new ArrayList<Star>();//Creating an array list
float border;
float x[];//array of x coordinates for the stars
float y[];//array of y coordinates for the stars
int click1=-1;
int click2=-1;
float distance;

void setup()
{
  size(800,800);
  loadData();
  x=new float[data.size()];
  y=new float[data.size()];
  printStars();
  border=50;
  noFill();
}

//This loads the data from the .csv file
void loadData()
{
  data.clear();
  
  Table t=loadTable("Text.csv");
  for(int i=0;i<t.getRowCount();i++)//incrementing through the file
  {
    TableRow row=t.getRow(i);
    Star star=new Star(row);
    data.add(star);
  }
}

//This prints the data as a string on the console
void printStars()
{
  for(Star star:data)
  {
    println(star);
  }
}

//This draws the graph for the data
void drawGraph()
{
  stroke(255);
  for(int i=0;i<data.size()-1;i++)
  {
    line(border + i*border,border,border  + i* border , height-border);
    line(border, border+ i*border , width-border, border +i*border);
  }
  
  for(int i=0;i<data.size()-1;i++)
  {
    stroke(255,255,0);
    x[i] = map(data.get(i).Xg,-5,5,border,width-border);
    y[i] = map(data.get(i).Yg,-5,5,border,height-border);
    line(x[i],y[i],x[i]+2f,y[i]+2f);
    line(x[i],y[i],x[i]-2f,y[i]-2f);
    line(x[i],y[i],x[i]-2f,y[i]+2f);
    line(x[i],y[i],x[i]+2f,y[i]-2f);
    
    //Creating a red circle with a diameter of stars size
    stroke(255,0,0);
    ellipse(x[i],y[i],data.get(i).size,data.get(i).size);
    
    //Name of star is left aligned horizontally and centered vertically
    textAlign(LEFT,CENTER);
    text(data.get(i).name,x[i],y[i]);
  }
}

void mousePressed()
{
  float x1=mouseX;//The x coordinate of the mouse
  float y1=mouseY;//the y coordinate of the mouse
  float radius;
  
  println(x1,y1);
  
  for(int i=0;i<data.size()-1;i++)
  {
    radius=data.get(i).size;
    //check if the x and y coordinates are in the circle
    if(x1>x[i]-radius && x1<x[i]+radius)
    {
      if(y1>y[i]-radius && y1<y[i]+radius)
      {
        //first star clicked
        if(click1==-1)
         {
           click1=i;
         }
         else
         {
           click2=click1;
           click1=i;
         }
        println(i);
      }
    }
  }
}

void starClicked()
{
  String name;
  
  stroke(255,255,0);
  //if the second star has not been clicked yet
  if(click1!=-1 && click2==-1)
  {
    line(x[click1],y[click1],mouseX,mouseY);
  }
  //if no star has been clicked
  else if(click1==-1 && click2==-1)
  {
    //do nothing
  }
  //if the second star has been clicked
  else
  {
    line(x[click1],y[click1],x[click2],y[click2]);
    
    distance=dist(x[click1],y[click1],x[click2],y[click2]);
    
    println("Distance from STAR1 to STAR2 is ". distance ."parcescs");
  }
}
  
  
  

void draw()
{
  background(0);
  drawGraph();
  starClicked();
}