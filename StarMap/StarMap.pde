/*
Author:Vimal Jain
Student Number: C15309056
Date:8/11/16
Version 3
Lab Test 1
*/

ArrayList<Star> data=new ArrayList<Star>();
float Wborder;
float Hborder;

void setup()
{
  size(800,800);
  loadData();
  printStars();
  Wborder=width * 0.25f;
  Hborder=height * 0.1f;
}

void loadData()
{
  data.clear();
  
  Table t=loadTable("Text.csv");
  for(int i=0;i<t.getRowCount();i++)
  {
    TableRow row=t.getRow(i);
    Star star=new Star(row);
    data.add(star);
  }
}

void printStars()
{
  for(Star star:data)
  {
    println(star);
  }
}
  

void draw()
{
  
}