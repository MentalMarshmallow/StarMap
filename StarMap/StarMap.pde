/*
Author:Vimal Jain
Student Number: C15309056
Date:8/11/16
Version 4
Lab Test 1
*/

ArrayList<Star> data=new ArrayList<Star>();//Creating an array list
float border;

void setup()
{
  size(800,800);
  loadData();
  printStars();
  border=50;
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
    float x = map(data.get(i).Xg,-5,5,border,width-border);
    float y = map(data.get(i).Yg,-5,5,border,height-border);
    line(x,y,x+2f,y+2f);
    line(x,y,x-2f,y-2f);
    line(x,y,x-2f,y+2f);
    line(x,y,x+2f,y-2f);
    noFill();
    stroke(255,0,0);
    ellipse(x,y,data.get(i).size,data.get(i).size);
  }
}

void draw()
{
  background(0);
  drawGraph();
}