
rotate([180,0,0])
{
  !union()
  {
    cylinder(r=2, h=10);
    cube([20,10,5], center=true);
  }
};

// ROTATION 
// rotate([x, y, z]);
  translate([0, 160, 0])
  {
  rotate([45, -20, 45])
  cube([20, 40, 30], center=true);
  }



