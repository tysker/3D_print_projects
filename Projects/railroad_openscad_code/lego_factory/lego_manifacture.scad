//Settings

// Studs
print_width = 0.4; 
stud_height_top = 2.3;
stud_height_bottom = 3.21;
ring_diameter_outer = 6.2;
ring_diameter_inner = 4.80;
// stud_gap is the gap between the studs in x and y direction
stud_gap = 8;

ring_diameter_top_stud = 4.88;
//========================

// Plate
lego_plate_outer_length_x = 8;
lego_plate_outer_length_y = 8;
lego_plate_inner_gap = 3;
plate_height = 3.35;


// Lego modules

/*
Info

build_lego_piece( x, y , layers, boolean)

layers can only be 1 or 2.
If x or y is less than 3, there will be no studs at the bottom
The range for x and y is from 1 to infinity

With the module "build_lego_piece_with_only_top_studs(a, b, c, boolean)", you have two choices:
boolean = true: The lego_plate_top is filled out
boolean = false: The lego_plate_top is hollow at the bottom
*/

//build_lego_piece_with_both_top_and_bottom_studs(10,10,2, false);
//build_lego_piece_with_only_top_studs(2,2,1, false);
//build_lego_piece_with_only_bottom_studs(4,4,1, true);

module build_lego_piece_with_both_top_and_bottom_studs(a, b, c, boolean)
{
    union()
    {
        lego_plate_top(a , b , c, boolean);
        translate([8, 8, 0]) {
            stud_bottom(a,b,c);
        }
        translate([4, 4, -stud_height_top]) {
            stud_top(a,b);
        }
    }
}

module build_lego_piece_with_only_top_studs(a, b, c, boolean)
{
    union()
    {
        lego_plate_top(a , b , c, boolean);
        translate([4, 4, -stud_height_top]) {
            stud_top(a,b);
        }
    }
}

module build_lego_piece_with_only_bottom_studs(a, b, c, boolean)
{
    union()
    {
        lego_plate_top(a , b , c, boolean);
        translate([8, 8, 0]) {
            stud_bottom(a,b,c);
        }
    }
}

module lego_plate_top(x, y, layers, boolean)
{
    layers = layers == 1 ? plate_height : plate_height * 3;

    if (boolean) {
    difference()
    {
        cube(size=[lego_plate_outer_length_x * x, lego_plate_outer_length_y * y, layers]);
        translate([lego_plate_inner_gap / 2, lego_plate_inner_gap / 2, 1.3])
        {
            cube(size=[(lego_plate_outer_length_x * x) - lego_plate_inner_gap , (lego_plate_outer_length_y * y) - lego_plate_inner_gap, layers]);
        }
    }     
    } else {
        cube(size=[lego_plate_outer_length_x * x, lego_plate_outer_length_y * y, layers]);
    }
}

module stud_top(x,y)
{

    for (xPos = [0 : x - 1])
    for (yPos = [0 : y - 1])
        translate([ (stud_gap * xPos), (stud_gap * yPos), 0 ])
        {
            cylinder( d=ring_diameter_top_stud, h=stud_height_top,$fn=128);
        }
}

module stud_bottom(x,y,layers) 
{
layers = layers == 1 ? stud_height_bottom : (stud_height_bottom * (layers+1));
//y = y == 2 ? 3 : y;
//x = x == 2 ? 3 : x;

if (x == 2 && y > 1) {
    for (xPos = [0 : 0])
    for (yPos = [0 : y - 2])
        translate([ (stud_gap * xPos), (stud_gap * yPos), 0 ])
        difference()
        {
            cylinder( d=ring_diameter_outer, h=layers,$fn=128);
            translate([0, 0, -1]) 
            {
                cylinder( d=ring_diameter_inner, h=layers+2,$fn=128);
            }              
        }
} else if (y == 2 && x > 1) {
    for (xPos = [0 : x - 2])
    for (yPos = [0 : 0])
        translate([ (stud_gap * xPos), (stud_gap * yPos), 0 ])
        difference()
        {
            cylinder( d=ring_diameter_outer, h=layers,$fn=128);
            translate([0, 0, -1]) 
            {
                cylinder( d=ring_diameter_inner, h=layers+2,$fn=128);
            }
                    
        }
} else if (x <= 1 || y <= 1) {

    echo(str("No Circle"));

} else {
    for (xPos = [0 : x-2])
    for (yPos = [0 : y-2])
        translate([ (stud_gap * xPos), (stud_gap * yPos), 0 ])
        difference()
        {
            cylinder( d=ring_diameter_outer, h=layers,$fn=128);
            translate([0, 0, -1]) 
            {
                cylinder( d=ring_diameter_inner, h=layers+2,$fn=128);
            }                
        }
    }
}





