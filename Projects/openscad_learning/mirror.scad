// MIRRORING
// rotate cube

rotate([0, 30, 0])
    cube([30, 60, 45]);
    
// mirrowed across the yz - plane
mirror([1, 0, 0])
rotate([0, 30, 0])
    cube([30, 60, 45]);


