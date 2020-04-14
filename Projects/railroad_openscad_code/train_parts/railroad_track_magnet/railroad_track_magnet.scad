include <D:\3D_prints\Projects\railroad_openscad_code\lego_factory\lego_manifacture.scad>

//Magnets for registrering train travel
magnet_x = 10.4;
magnet_y = 5;
magnet_z = 2.96;

magnet_holder_z = 4;



build_track_magnet();

module build_track_magnet()
{
    translate([lego_plate_outer_length_x , -lego_plate_outer_length_x, 0]) {
        rotate([0, 180, 0]) {
            build_lego_piece_with_only_bottom_studs(2,2,1, true); 
        }
    }
    difference()
    {
        magnet_holder();
       #magnet();
    }
}

module magnet_holder()
{
    cylinder(d=lego_plate_outer_length_x * 2, h=magnet_holder_z, $fn=128);
}

module magnet()
{
    translate([0, 0, (magnet_holder_z - magnet_z) + 1.5]) {
        cube(size=[magnet_x, magnet_y, magnet_z], center=true);
    }
}