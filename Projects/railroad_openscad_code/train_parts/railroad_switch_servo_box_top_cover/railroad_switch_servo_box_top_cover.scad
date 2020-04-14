include <D:\3D_prints\Projects\railroad_openscad_code\train_parts\lego_train_tobias_code.scad>

// Settings
$fn=128;

building_top_cover();


module deckel() {
    union()
    {
        cube(size=[35, 28, 3]);
        translate([6.08, 6,-3]) 
        {
            color([0.8,0.5,1]) 
            {
                cube(size=[22.89, 22, 3]);    
            }
        }
        // translate([17, 14, 0]) 
        // {
        //     NodeMCUV2Holder();
        // }
    }
};

module screw_hole() 
{
    cylinder(d=2.90, h=30, center=true);
}

module building_top_cover() 
{
    difference() 
    {
        deckel();

        translate([32, 4, 1.8]) 
        {
            screw_hole();
        }
        translate([32, 19, 1.8]) 
        {
            screw_hole();
        }
        translate([3, 4, 1.8]) 
        {
            screw_hole();
        }
        translate([3, 19, 1.8]) 
        {
            screw_hole();
        }
    }
}






        
    