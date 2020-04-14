print_width = 0.4; 
stud_diameter = 4.84;
stud_height = 2.4;
base_height = 3.5;
base_width = 8;
stud_offset = 0.5 * base_width;
edge_offset = 0.2;
edge_width = 0.5*(base_width-stud_diameter-0.2);
ring_diameter_outer = 6.2;
ring_diameter_inner = stud_diameter+0.2;
z_offset = 0.2;

heights = 8.36;
diameter = 6.2;

length = 10;
width = 6.28;

module makeStandardLegoBrickBottom(x,y,z)
{
    
    difference()
    {
        translate([0,0,0.5*(z*base_height-z_offset)])
        cube([  x*base_width-2*edge_offset,
                y*base_width-2*edge_offset,
                z*base_height-z_offset],
                center=true             );
        translate([0,0,0.5*(base_height) + z*base_height - stud_height - 0.2])
        cube([  x*base_width-2*edge_width,
                y*base_width-2*edge_width,
                base_height],
                center=true             );
    }
    
    translate([-0.5*x*base_width,-0.5*y*base_width,(z-1)*base_height-z_offset])
    makeLegoBottomRings(x, y);
}

module makeLegoBottomRings(x, y, dia_outer = ring_diameter_outer, dia_inner = ring_diameter_inner)
{
    for(xPos=[base_width:base_width:base_width + (x-2) * base_width])
        for(yPos = [base_width:base_width:base_width + (y-2) * base_width])
            translate([xPos, yPos, 0.5])
            difference()
            {
                cylinder(d = dia_outer, h = base_height-0.5, $fn=64);
                translate([0,0,-1.5])
                cylinder(d = dia_inner, h = base_height+2, $fn=64);
            }   
}

module cylinderOutside(hei, dia)
{
   cylinder(hei,d=dia, center = true, $fn=128); 
}


module plate(l, b)
{
    translate([0,4.47,1.04])
    rotate([90,0,0])
    {
    cube([l, b , 6], center = true);
    }
}

module insideCube(h, d, l, w)
{
    difference()
    {
        cylinderOutside(h, d);
        plate(l, w);
    }
    
}

module cylinderSchachtel(hei, dia)
{
    cylinder(hei,d=dia, center = true, $fn=128); 
}

rotate([180,0,0])
makeStandardLegoBrickBottom(6,4,1);

translate([0,0,4.2])
difference()
{
cylinderSchachtel(8.35, 8.6);
insideCube(heights, diameter, length, width);
}



