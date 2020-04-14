//Settings
print_width = 0.4; 
stud_diameter = 4.84;
stud_height = 1.9;
base_height = 3.0;
base_width = 8;
stud_offset = 0.5 * base_width;
edge_offset = 0.2;
edge_width = 0.5*(base_width-stud_diameter-0.2);
ring_diameter_outer = 6.2;
ring_diameter_inner = stud_diameter+0.2;
z_offset = 0.2;

module makeStuds(x, y, dia = stud_diameter)
{
    for(xPos=[stud_offset:base_width:stud_offset + (x-1) * base_width])
        for(yPos = [stud_offset:base_width:stud_offset + (y-1) * base_width])
            translate([xPos, yPos, 0])
                cylinder(d = dia, h = stud_height+1,center=true, $fn=64);
}

module makeStandardLegoBrickBottom(x,y,z)
{
    squareBotton(33);
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

$fn = 128;
module squareBotton(size)
{
    
        translate([0,0,-3])
        cube([size, size, 7], center = true);
}

module circleTop()
{
    translate([0,3, -0.3])
        #cylinder( h = 6.5, d = 17, center = true);
}

module slot()
{
        translate([0,10,1.9])
        #cube([15.6, 20, 2], center = true);
}   

module collectSquareBotton()
{
    difference()
    {
    squareBotton(33);
    smallCube();
    slot();
    }
}    

     
difference()
{

    makeStandardLegoBrickBottom(5,5,1);  
    circleTop();
    slot();
}

    
translate([-16,-16,-7.8])
makeStuds(4,4);




















