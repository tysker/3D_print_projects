// Cube
cube([10, 20 ,15], center = true);

// Sphere
translate([-40,0,0]){
sphere(r = 20);
}

// Cylinder -> Cone
translate([40,0 ,0]){
cylinder(h = 40, r1 = 20, r2 = 0);
} 

// Cylinder
translate([0,40 ,0]){
cylinder(h = 40, r = 20);
}    

// Cylinder Nr. 2
translate([0,100 ,0]){
cylinder(h = 40, r1 = 20, r2 = 10);
}   

// Cylinder with 6 faces
translate([0,-100,0]){
cylinder(h = 40, r = 10, $fn=6);
}    

// Cylinder with fa = maximum angle and fs = maximum size
translate([0,-200,0]){
cylinder(r=6, h=20, $fa=1, $fs=1.5);
}    
















