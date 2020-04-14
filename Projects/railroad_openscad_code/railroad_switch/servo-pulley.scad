$fn=128;
/*
mdpart = middel_part
x = x axis
y = y axis
z = z axis
*/
mdpart_z = 21.34;
mdpart_x = 8.30;
mdpart_y = 7.45;
/*
rtpart = right_part
*/
rtpart_diameter = 7.85;
rtpart_z = 14.98;
/*
ltpart = left_part
*/
ltpart_diameter = rtpart_diameter;
ltpart_z = 9.20;

build_pulley();
//collect_pulley_parts();
//build_middel_part();
//build_right_part();
//build_left_part();

module build_pulley() 
{
  difference()
  {
      collect_pulley_parts();
      translate([mdpart_z, 0, -0.5]) 
      {
         right_part_cutter_1();
      }
  }  
  translate([mdpart_z, 0, 9]) 
    {
        right_part_cutter_2();
    }  
}

module collect_pulley_parts() 
{
    build_middel_part();
    build_right_part();
    build_left_part();
}

/*
 Right part of the pulley
*/
module build_right_part() 
{
    difference()
    {
        translate([mdpart_z, 0, 0]) 
        {
            cylinder(d=rtpart_diameter, h=rtpart_z);
        }
    }
}

module right_part_cutter_1()
{
    cylinder(d=rtpart_diameter - 1.67, h=rtpart_z + 1);
}

module right_part_cutter_2()
{
    difference()
    {
        cylinder(d=rtpart_diameter, h=3);
        translate([0, 0, -0.5]) 
        {
            #cylinder(d=1.85, h=4);       
        }
    }
}

/*
 Left part of the pulley
*/
module build_left_part() 
{
    translate([0, 0, -(ltpart_z - mdpart_x )]) 
    {
        cylinder(d= ltpart_diameter, h=ltpart_z);
    }
}

/*
 Middel part of the pulley
*/
module build_middel_part() 
{
    hull()
    {
        cylinder(d=mdpart_y, h=mdpart_x);
        translate([mdpart_z, 0, 0]) 
        {
        cylinder(d=mdpart_y, h=mdpart_x);   
        }
    }
}


