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


b1 = 23;
l1 = 27.15;
h1 = 8;

b2 = 20;
l2 = 28;
h2 = 2.7;

b3 = 12.50;
l3 = 28;
h3 = 5;



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

module makeStuds(x, y, dia = stud_diameter)
{
    for(xPos=[stud_offset:base_width:stud_offset + (x-1) * base_width])
        for(yPos = [stud_offset:base_width:stud_offset + (y-1) * base_width])
            translate([xPos, yPos, 0])
                cylinder(d = dia, h = stud_height+1,center=true, $fn=64);
}


difference()
{
    boxOutside(l1, b1, h1);
    boxInside(l2, b2, h2);
    boxTopLayer(l3, b3, h3);
}

translate([-12,-8,-4.5])
makeStuds(3,2);
