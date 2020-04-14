print_width = 0.4; 
stud_diameter = 4.7;
stud_height = 1.8;
base_height = 3.0;
base_width = 8;
stud_offset = 0.5 * base_width;
edge_offset = 0.2;
edge_width = 0.5*(base_width-stud_diameter-0.2);
ring_diameter_outer = 6.2;
ring_diameter_inner = stud_diameter+0.2;
z_offset = 0.2;


b1 = 24;
l1 = 27.15;
h1 = 8;

b2 = 20;
l2 = 28;
h2 = 2.7;

b3 = 12.50;
l3 = 28;
h3 = 5;

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

module boxOutside(l,b,h)
{
    cube([l,b,h],center = true);

}

module boxInside(l,b,h)
{
    translate([2,0,0])
    cube([l,b,h],center = true);

}

module boxTopLayer(l,b,h)
{
    translate([3,1.84,1.9])
    cube([l,b,h],center = true);

}

difference()
{
    boxOutside(l1, b1, h1);
    boxInside(l2, b2, h2);
    boxTopLayer(l3, b3, h3);
    
}

translate([0,0,-3.1])
rotate([180,0,0])
makeStandardLegoBrickBottom(3,3,1);
