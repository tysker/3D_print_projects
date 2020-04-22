include <D:\3D_prints\Projects\openscad_libaries\gears_library_openscad\files\Getriebe.scad>
$fn=128;
/*
mdpart = middel_part
x = x axis
y = y axis
z = z axis
*/
mdpart_z = 14.34;
mdpart_x = 8.30;
mdpart_y = 8.5;
/*
rtpart = right_part
*/
rtpart_diameter = 8;
rtpart_z = 13.5;
/*
ltpart = left_part
*/
ltpart_diameter = rtpart_diameter;
ltpart_z = 10.5;
ltpart_cutter_height = 6;

build_pulley();
//collect_pulley_parts();
//build_middel_part();
//build_right_part();
//build_left_part();
//right_part_cutter_1();
//right_part_cutter_2();
//left_part_cutter();


module build_pulley() 
{
  difference()
  {
      collect_pulley_parts();
      translate([mdpart_z, 0, -0.5]) 
      {
         right_part_cutter_1();
      }
      translate([0, 0, -(ltpart_z - mdpart_x ) - 0.2]) 
      {
        left_part_cutter();    
      }
      translate([mdpart_z, 0, 9.6]) 
      {
        stirnrad(0.17,30,4,1);    
      }
  }  
  translate([mdpart_z, 0, 7.5]) 
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
    cylinder(d=4.5, h=rtpart_z + 1);
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

module left_part_cutter()
{
    cylinder(d=3.5, h=ltpart_cutter_height);
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


