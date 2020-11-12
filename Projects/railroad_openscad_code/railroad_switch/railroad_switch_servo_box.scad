include <D:\3D_prints\Projects\railroad_openscad_code\lego_factory\lego_manifacture.scad>
include <D:\3D_prints\Projects\railroad_openscad_code\train_parts\lego_train_tobias_code.scad>
include <D:\3D_prints\Projects\railroad_openscad_code\vemos_mini_case\vemos_mini_case.scad>


// Settings
//===========================
$fn=64;

servoLength = 13;
servoWidth = 23.2;
servoHeight = 22.7;

servo_box_shell_height = (servoLength/2) + 2;
servo_screw_mount_length = 33;

//===========================

// Servo specs: For specs. look at the image in railroad_switch folder
big_cylinder_height = 4.44;
small_cylinder_height = 3.32;
small_cylinder_diameter = 4.84;
micro_cylinder_diameter = 6;

//===========================

    /*
    building_railroad_switch(a, b, c, boolean);
    a = length of the plate
    b = width of the plate
    boolean = true if you want studs at the bottom plate / false without studs at the bottom plate
    */ 

//===========================

build_railroad_servo_switch(7, 11, 1,false);

//build_railroad_servo_box_bottom(5, 5);
//build_railroad_servo_box_top(5, 5);
//servo_model(servoWidth, servoLength, servoHeight);
//lid();


railroad_part_1();
//railroad_part_2(7, 11, 1,false);
//railroad_part_3();
//railroad_part_4();

//===========================
// Railroad building factory

module build_railroad_servo_switch(a, b, c, boolean) 
{
    railroad_part_1();
    railroad_part_2(a, b, c, boolean);

    translate([lego_plate_outer_length_x * 1, (lego_plate_outer_length_x * 6), 0]) 
    {
        build_railroad_servo_box_bottom(5, 5);
    }
   
}

module railroad_part_1() 
{

    translate([0, 0, - plate_height]) 
    {
    
        translate([lego_plate_outer_length_x, 0, plate_height * 3]) 
        {
            railroad_basic_plate(3,2,1,false); 
        }
        translate([lego_plate_outer_length_x, 0, plate_height * 2]) 
        {
            railroad_basic_plate(3,2,1,false); 
        }

        translate([0, lego_plate_outer_length_x * 2, (plate_height * 3)]) 
        {
            railroad_basic_plate(4, 1, 1, false);      
        }
        translate([0, lego_plate_outer_length_x * 2, (plate_height * 2)]) 
        {
            railroad_basic_plate(4, 1, 1, true);      
        }

        translate([0, lego_plate_outer_length_x * 3, (plate_height * 3)]) 
        {
            railroad_basic_plate(3, 1, 1, true);
        }

        translate([0, lego_plate_outer_length_x * 4, (plate_height * 3)]) 
        {
            railroad_basic_plate(4, 1, 1, false);      
        }
        translate([0, lego_plate_outer_length_x * 4, (plate_height * 2)]) 
        {
            railroad_basic_plate(4, 1, 1, true);      
        }

        translate([0, lego_plate_outer_length_x * 5, (plate_height * 3)]) 
        {
            railroad_basic_plate(4, 1, 1, false);
        }
        translate([0, lego_plate_outer_length_x * 5, (plate_height * 2)]) 
        {
            railroad_basic_plate(4, 1, 1, false);
        }
    }
}

module railroad_part_2(a, b, c, boolean)
{
    difference()
    {
        railroad_basic_plate(a, b, c, boolean);
            translate([0, lego_plate_outer_length_x * 2, 0]) 
            {
                railroad_part_3();
            }
            translate([0, lego_plate_outer_length_x * 4, 0]) 
            {
                railroad_part_4();
            }
            translate([-lego_plate_outer_length_x, -3, -lego_plate_outer_length_x]) 
            {
                build_lego_piece_with_only_bottom_studs(2 ,3, 2, false);
            }
    }
}

module railroad_part_3()
{
    translate([-lego_plate_outer_length_x, 0, -6]) {
        build_lego_piece_with_only_bottom_studs(7 ,3, 2, false);
    }
}

module railroad_part_4()
{
    translate([-lego_plate_outer_length_x, 0, -6]) {
        build_lego_piece_with_only_bottom_studs(3 ,8, 2, false);
    }
}

//===========================
// Railroad basic plate

module railroad_basic_plate(a , b, c, boolean) 
{
    translate([lego_plate_outer_length_x * a, 0, 0]) 
    {
        rotate([0, 180, 0]) 
        {
            build_lego_piece_with_only_bottom_studs(a, b, c, boolean);
        }    
    }
}

//===========================
// Railroad servo box

module build_railroad_servo_box_bottom(a, b) 
{
    difference()
    {
        servo_box_shell(a, b);
            translate([((lego_plate_outer_length_x * a) - 32) / 2, (servoHeight + big_cylinder_height-0.1), 2]) 
            {
                servo_model(servoWidth, servoLength, servoHeight);    
            }  
    }
    
}

module build_railroad_servo_box_top(a, b) 
{
    difference()
    {
        servo_box_shell(a, b);
            translate([((lego_plate_outer_length_x * a) - 32) / 2, (servoHeight + big_cylinder_height-0.1), (servo_box_shell_height - servoLength)-2]) 
            {
                servo_model(servoWidth, servoLength, servoHeight);    
            }  
    }
    translate([ (lego_plate_outer_length_x * b) / 2, (lego_plate_outer_length_x * a) / 2, servo_box_shell_height]) 
    {
        rotate([0, 0, 180]) 
        {
        base(0);        
        }
    }
}

module servo_box_shell(a, b)
{
    cube(size=[lego_plate_outer_length_x * a, lego_plate_outer_length_x * b, servo_box_shell_height]);
}

module servo_model(x, y, h)
{
    translate([servoWidth+((servo_screw_mount_length-servoWidth)/2), 0, servoLength]) {
        rotate([90, -180, 0]) {
            cube(size=[x, y, h]);
            translate([-((servo_screw_mount_length-x)/2), 0, 15.3]) 
            {
                // Screw mount for servo
                cube(size=[servo_screw_mount_length, y, 3]);
            }
            translate([(servoLength/2), (servoLength/2), servoHeight]) 
            {
                //Big cylinder at the top of the servo
                cylinder(d=servoLength, h=big_cylinder_height);
            }
            translate([(servoLength/2), (servoLength/2), servoHeight + big_cylinder_height]) 
            {
                // Smaller cylinder on the top
                cylinder(d=small_cylinder_diameter, h=small_cylinder_height);
            }
            translate([12, servoLength/2, servoHeight]) 
            {
                // Small cylinder next to the big cylinder at the top
                cylinder(d=micro_cylinder_diameter, h=big_cylinder_height);    
            } 
            /*
            Opening for the servo cabel
            if you change the length of the cabel cube, you aslo have to change x in translate, 
            with the equliant number.
            */
            translate([-12, 0, 3.28]) {
                cube(size=[12, servoLength, 2]);
            }
        }  
    }
    

}


