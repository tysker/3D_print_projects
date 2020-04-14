
microsd_height = 0.0;

// do not need to modify anything below here
thickness = 2.0;
fudge = 0.1;

vemos_width = 38.5;
vemos_length = 30.50;
vemos_height = 10.5;
 
cavity_width = (vemos_width) - (2 * thickness);
cavity_length = (vemos_length) - (2 * thickness);
cavity_height = vemos_height - thickness + fudge;

hole_diameter = 7.0;

slit_width = 4.0;
slit_height = 23.0;

/*
Base
Min requirements. Values must not be less than the min reequirements.
width = 38.50 + a
length = 30.50 + b
heights = 10.5 + c
base(a, b, c)
*/
base(0, 0, 0);

/*
Lid
Min requirements. Values must not be less than the min reequirements.
width = 38.50 + a
length = 30.50 + b
heights = 2.0 + c (only change if absolute necessary)
base(a, b, c)
*/
//lid(0, 0, 0);

// lid
module lid(a, b, c) 
{
    difference() 
    {
        union () 
        {
             translate([12.95, 22.25, 3]) cube([4.0, cavity_length-0.3, 2.0]);
             translate([-(vemos_width / 2.0), 20, 0.0]) cube([vemos_width + a, vemos_length + b , 3]);
             translate([-(cavity_width / 2.0), 22+0.25, 2.0]) cube([cavity_width-0.3, cavity_length-0.3, 2.5 + c]);            
        }
         translate([1, 22 + (cavity_length / 2), 2.5 + (c/2)]) cylinder(h = 5 + fudge + c, r1 = hole_diameter, r2 =hole_diameter, center = true);
         rotate([0, 0, 90]) translate([21.9, -12.5, 0]) cube([slit_width, slit_height, 10 + c]);
         rotate([0, 0, 90]) translate([44.6, -12.5, 0]) cube([slit_width, slit_height, 10 + c]);
         translate([-20 ,30 , 0.75]) cube([10, 10, 4 + c]);
     }
}

// base
module base(a, b ,c)
{
    union() 
    {
        translate([13.5, -(cavity_length / 2.0), thickness]) cube([4.0, cavity_length, 4.0]);
        translate([-16, -((cavity_length/2) / 2.0), 2])cube([4.0, cavity_length/2, 2.0]);

        difference () 
        {
            translate([0, 0, vemos_height / 2.0]) cube([vemos_width + a, vemos_length + b, vemos_height + c], center = true); 
            translate([0, 0, ((cavity_height + c) / 2.0) + thickness]) cube([cavity_width, cavity_length, cavity_height +c], center = true);
            translate([1, 0, ((thickness - 1) - (c-1)) / 2.0]) cylinder(h = thickness + fudge + c, r1 = hole_diameter, r2 = hole_diameter, center = true);
            rotate([0, 0, 90]) translate([9, -12.5, -((1+c)/2)]) cube([slit_width, slit_height, 5 + c]);
            rotate([0, 0, 90]) translate([-13, -12.5, -((1+c)/2)]) cube([slit_width, slit_height, 5 + c]);
            translate([(-20 -a), -6, 1]) cube([3 + a, 12, 12 + c]);
            translate([-17.25, -16.0, 5]) cube([7, 4, 4]);        
        }
    }
}

// // base
// module base(a, b , c)
// {
//     union() 
//     {
//         translate([13.5, -(cavity_depth / 2.0), 2]) cube([4.0, cavity_depth, 4.0]);
//         translate([-16, -((cavity_depth/2) / 2.0), 2]) cube([4.0, cavity_depth/2, 2.0]);

//         difference () 
//         {
//             translate([0, 0, vemos_height / 2.0]) #cube([a, b, c], center = true); 
//             translate([0, 0, (cavity_height / 2.0) + thickness]) cube([cavity_width, cavity_depth, cavity_height], center = true);
//             translate([1, 0, thickness / 2.0]) cylinder(h = thickness + fudge, r1 = hole_diameter, r2 = hole_diameter, center = true);
//             rotate([0, 0, 90]) translate([9, -12.5, 0]) cube([slit_width, slit_height, 5]);
//             rotate([0, 0, 90]) translate([-13, -12.5, 0]) cube([slit_width, slit_height, 5]);
//             translate([-20, -6, 1]) cube([3, 12, 12]);
//             translate([-17.25, -16.0, 5]) cube([7, 4, 4]);        
//         }
//     }
// }
