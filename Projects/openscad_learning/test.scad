diameter = 595;
heights = 3.20;
mainCubeLength = 95;//95
mainCubeWidth = 41.47;
innerCubeLength = 58;
innerCubeWidth = 23.90;

module railroadCircle(diameter, heights) {
    translate([250, 0, 0]) {
    cylinder(d=diameter, h=heights, center=true);  
    }
};

module mainCube(length, width, heights) {
    cube(size=[length, width, heights], center=true);
};


module innerCube(length, width, heights) {
    translate([-19, 0, 0]) {
    cube(size=[length, width, heights], center=true);  
    }
};

module legoPlate(length, width, heights) {
    translate([-47, 25.9, 0])
    {
    rotate([0,0,84])
    color([0.8,0.5,1]) {
    cube(size=[length, width, heights], center=true);
    }
    }
};

module supportBlock(length, width, heights) {
    translate([-41.1, 14.4, 0])
    {
    rotate([0,0,90])
    color([0.2,0.8,1]) {
    cube(size=[length, width, heights], center=true);   
    }
    }
}

// Building Part 1
union()
{   
    difference() {
        intersection() {
            mainCube(mainCubeLength, mainCubeWidth, heights);
            railroadCircle(diameter, heights);
        }
            #innerCube(innerCubeLength, innerCubeWidth, heights+1);
            #legoPlate(10, 15.8, heights+1);
translate([10, 0, 0]) {
cube(size=[80, 80, heights+1], center=true);
    
}
}
}

    //supportBlock(5, 9.19, heights);

