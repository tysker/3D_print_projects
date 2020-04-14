//Settings for Plate
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
    translate([-23,-17.3,2])
    cube([45.7,34.6,12]);
}

module kabelInput(height)
{
    #cube([16.15,16.15, height], center = true);
}

module quadrat()
{
        #cube([8,8,1.5], center = true);
}
//***********************************************************************
//***********************************************************************

module squareTop(size)
{
        cube([size, size, 13.30], center = true);     
}    

module slot()
{
        translate([0,11,2.3])
        #cube([12, 15.6, 3], center = true);
}   

module circleBottom()
{
    translate([0, -1, -1])
    #cylinder( h = 9.16, d = 16.8, center = true);
}

module circleBottom2()
{
    translate([0, -1, -1])
    #cylinder( h = 9.16, d = 11.5, center = true);
}

module circleTop()
{
    translate([0, -1,-2])
    #cylinder( h = 20, d = 7.5, center = true);
}

module smallCubeRight()
{
    translate([-8, -1, -3])
    #cube([4, 4, 13], center = true);
}

module smallCubeLeft()
{
    translate([8, -1, -3])
    #cube([3, 4, 13], center = true);
}

module collectSquareTop()
{
    rotate([0,0,90])
        difference()
        {
            translate([0,0,-3.3])
            squareTop(25);
            slot();
            circleBottom();
            circleTop();
            smallCubeRight();
            smallCubeLeft();
        }
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
    translate([-64,0,3.92])
        quadrat();
    translate([72,1,15])
        circleBottom();
    translate([72,1,13])
        circleBottom2();
    translate([62,-11,10])
        slot();
    translate([72,1,10])
        circleTop();
    translate([80,-6,8])
        smallCubeRight();
    translate([80,8,11])
        smallCubeRight();
}
}

//***********************************************************************
//***********************************************************************

    plate();












