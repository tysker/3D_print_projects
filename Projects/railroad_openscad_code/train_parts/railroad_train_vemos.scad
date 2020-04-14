include <D:\3D_prints\Projects\railroad_openscad_code\lego_factory\lego_manifacture.scad>
include <D:\3D_prints\Projects\railroad_openscad_code\vemos_mini_case\vemos_mini_case.scad>


build_vemos_train_box(4,4,1, true);

module build_vemos_train_box(a, b, c, boolean)
{
    rotate([0, 180, 0]) 
    {
        build_lego_piece_with_only_bottom_studs(a, b, c, boolean);    
    }

    translate([-(lego_plate_outer_length_x * a) / 2, (lego_plate_outer_length_x * b)/2 , 0]) 
    {
        base(10.5);
    }
}
