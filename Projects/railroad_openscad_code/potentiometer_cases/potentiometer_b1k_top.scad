$fn = 128;

module squareTop(size)
{
        cube([size, size, 7], center = true);     
}    

module slot()
{
        translate([0,11,2.3])
        #cube([15.6, 12, 2.5], center = true);
}   

module circleBottom()
{
    translate([0, 3, 3.1])
    cylinder( h = 6, d = 18, center = true);
}

module circleTop()
{
    translate([0, 3, 2.9])
    cylinder( h = 20, d = 7.5, center = true);
}

module skrueHoles(diameter)
{
        translate([-13, -13, 0])
        cylinder( h = 8, d = diameter, center = true);
        translate([13, -13, 0])
        cylinder( h = 8, d = diameter, center = true);
    
        translate([13, 13, 0])
        cylinder( h = 8, d = diameter, center = true);
        translate([-13, 13, 0])
        cylinder( h = 8, d = diameter, center = true);    
}

module skrueHolesTop(diameter, heights)
{
        translate([-13, -13, -2.5])
        #cylinder( h = heights, d = diameter, center = true);
        translate([13, -13, -2.5])
        #cylinder( h = heights, d = diameter, center = true);
    
        translate([13, 13, -2.5])
        #cylinder( h = heights, d = diameter, center = true);
        translate([-13, 13, -2.5])
        #cylinder( h = heights, d = diameter, center = true);    
}

//module smallCubeRight()
//{
//    translate([-7, 3, 2.9])
//    cube([4, 3, 6], center = true);
//}
//
//module smallCubeLeft()
//{
//    translate([7, 3, 2.9])
//    cube([3, 3, 6], center = true);
//}

module collectSquareTop()
{
    rotate([0,180,0])
        difference()
        {
            squareTop(33);
            skrueHoles(3.5);
            skrueHolesTop(6, 2);
            slot();
            circleBottom();
            circleTop();
//            smallCubeRight();
//            smallCubeLeft();
        }
}    

collectSquareTop();