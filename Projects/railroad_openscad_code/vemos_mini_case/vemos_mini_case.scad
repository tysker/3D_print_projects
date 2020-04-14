
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

//base();
//lid();

// lid
module lid() 
{
    difference() 
    {
        union () 
        {
             translate([(vemos_length-4)/2, 22 , 3]) cube([4.0, cavity_length, 3]);
             translate([-(vemos_width / 2.0), 20, 0.0]) cube([vemos_width, vemos_length, 3]);
             translate([-((cavity_width) / 2.0), (22), 2.0]) cube([cavity_width, cavity_length, 2.5]);            
        }
         translate([1, 22 + (cavity_length / 2), 2.5]) cylinder(h = 5 + fudge, r1 = hole_diameter, r2 =hole_diameter, center = true);
         rotate([0, 0, 90]) translate([21.9, -12.5, 0]) cube([slit_width, slit_height, 10]);
         rotate([0, 0, 90]) translate([44.6, -12.5, 0]) cube([slit_width, slit_height, 10]);
         translate([-20 ,30, 0.75]) cube([10, 10, 4]);
     }
}

// base
module base()
{
    union() 
    {
        translate([13.5, -(cavity_length / 2.0), thickness]) cube([4.0, cavity_length, 4.0]);
        translate([-16, -((cavity_length/2) / 2.0), 2])cube([4.0, cavity_length/2, 2.0]);

        difference () 
        {
            translate([0, 0, vemos_height / 2.0]) cube([vemos_width, vemos_length, vemos_height], center = true); 
            translate([0, 0, ((cavity_height) / 2.0) + thickness]) cube([cavity_width, cavity_length, cavity_height], center = true);
            translate([1, 0, (thickness - 1)]) #cylinder(h = thickness + fudge, r1 = hole_diameter, r2 = hole_diameter, center = true);
            rotate([0, 0, 90]) translate([9, -12.5, 0]) cube([slit_width, slit_height, 5]);
            rotate([0, 0, 90]) translate([-13, -12.5, 0]) cube([slit_width, slit_height, 5]);
            translate([(-20), -6, 1]) cube([3, 12, 12]);
            translate([-17.25, -16.0, 5]) cube([7, 4, 4]);        
        }
    }
}