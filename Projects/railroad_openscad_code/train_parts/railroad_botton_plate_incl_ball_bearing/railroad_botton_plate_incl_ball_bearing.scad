//Settings for Plate
print_width = 0.4; 
stud_diameter = 4.84;
stud_height = 1.9;
base_height = 3.0;
base_width = 8;
stud_offset = 0.5 * base_width;
edge_offset = 0.2;
edge_width = 0.5*(base_width-stud_diameter-0.2);
ring_diameter_outer = 6.3;
ring_diameter_inner = stud_diameter+0.2;
z_offset = 0.2;

//Settings
height = 3.9;

//***********************************************************************
//***********************************************************************

// Lego Train Botton Plate

module makeStuds(x, y, dia = stud_diameter)
{
    for(xPos=[stud_offset:base_width:stud_offset + (x-1) * base_width])
        for(yPos = [stud_offset:base_width:stud_offset + (y-1) * base_width])
            translate([xPos, yPos, 0])
                cylinder(d = dia, h = stud_height+1, $fn=64);
}

module makeStandardLegoBrick(x,y,z,studs=true)
{
    translate([0,0,0.5*(z*base_height-z_offset)])
    cube([  x*base_width-2*edge_offset,
            y*base_width-2*edge_offset,
            z*base_height-z_offset],
            center=true             );
    if(studs)
    {
        translate([-0.5*x*base_width,-0.5*y*base_width,z*base_height-1])
        makeStuds(x,y);
    }
}

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

//***********************************************************************
//***********************************************************************

module wheelPlateAttachment(height)
{
    $fn = 256;
    translate([0,0,height+1])
    #cylinder(h = height*4, d = 5.5, center = true);
}

module breadBordMini()
{
    color("DarkGreen", 1.0)
    translate([-23,-17.3,4])
    cube([45.7,34.6,12]);
}

module kabelInput(height)
{
    #cube([12,12, height], center = true);
}

module quadrat()
{
        #cube([8,8,1.5], center = true);
}
//***********************************************************************
//***********************************************************************

// Kugellager

module ballbearing()
{
    $fn = 128;
    #cylinder( h = 10, d = 21.94, center = true);
}


//***********************************************************************
//***********************************************************************
module legoBrickBottom()
{
    translate([0,0,2])
    rotate([180,0,0])
    #makeStandardLegoBrickBottom(24,6,1);
}
//***********************************************************************
//***********************************************************************



module plate()
{
difference()
{
    
    makeStandardLegoBrick(24,6,height);
    breadBordMini();
    translate([24,0,6])
        kabelInput(height*5);
    translate([-23,0,6])
        kabelInput(height*5);
    translate([-56,0,0])
        wheelPlateAttachment(height);
    translate([72,0,3.4])
    ballbearing();
    legoBrickBottom();
}
    

}

//***********************************************************************
//***********************************************************************

    plate();












