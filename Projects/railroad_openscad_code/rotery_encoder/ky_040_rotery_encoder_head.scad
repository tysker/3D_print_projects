

module cylinderOutside(heights, diameter)
{
   cylinder(heights,d = diameter, center = true, $fn=128); 
}

module plate(l, b)
{
    translate([0,4.47,1.04])
    rotate([90,0,0])
    {
    cube([l, b , 6], center = true);
    }
}

module insideCube(heights, diameter, length, width)
{
    difference()
    {
        cylinderOutside(heights, diameter);
        plate(length, width);
    }
    
}

module cylinderSchachtel(heights, diameter)
{
    cylinder(heights, d = diameter, center = true, $fn=128); 
}


module ky_040_Rotery_Encoder_Head(heights, diameter, length, width, l, b)
{
    difference()
    {
        cylinderSchachtel(l, b);
        insideCube(heights, diameter, length, width);
    }
}

ky_040_Rotery_Encoder_Head(8.36, 6.4, 10, 6.28, 8.35, 8);