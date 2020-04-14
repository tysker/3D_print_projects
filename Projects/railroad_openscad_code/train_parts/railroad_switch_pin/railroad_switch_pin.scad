$fn=128;

diameterTopPartFemine = 12;
topPartHeightsFemine = 7;
//===================
// feminine site
diameterInnerCircle = 3.18;
diameterOuterCircle = 4.88;
diameterPin = 3.11;
pinHeights = 6.80;
innerOuterCircleHeights = 2.10;
//==================
diameterTopPartMaskulin = 12;
topPartHeightsMaskulin = 7;
//==================
pinLeftLength = 30;
pinRightLength = 20;
clickLength = 1.9;
clickWidth = 1.9;
clickHeights = 3;

rightPin();
//leftPin();

// building the two pins 
module rightPin()
{
    translate([5, 0, -5]) {
        buildPinRight();  
    }
    translate([7, 0, 23.5]) {
        rotate([0, 90, 0]) {
            topPartMaskulinSite();  
        }  
    }  
}


module leftPin()
{
    translate([0, 0, 0]) {
        buildPinLeft();  
    }
    translate([-2, 0, 23.5]) {
        rotate([0, -90, 0]) {
            topPartfeminineSite();
        }  
    }  
}

// maskulin pin code
module clickMaskulin()
{
    cube(size=[2.1, 2.1, 3.2], center=true);
}

module halfCirkel(dia)
{
    difference()
    {
        cylinder(d=dia+0.1, h=3.04, center=true);
        translate([0, -7.5, 0]) {
        cube(size=[20, 15, 10], center=true);    
        }
    }
}

module topPartMaskulinSite()
{
    difference()
    {
        cylinder(d=diameterTopPartMaskulin+6, h=topPartHeightsMaskulin+2.2, center=true);
        translate([0, 0, -1.1]) {
            cylinder(d=diameterTopPartMaskulin-1.5, h=topPartHeightsMaskulin+10, center=true);  
        }
        translate([0, 0, -3.12]) {
            cylinder(d=diameterTopPartMaskulin-0.2, h=3, center=true);
        }
        translate([-6.2, -4, -3.02]) {
            rotate([0, 0, 18]) {
                #clickMaskulin();
            } 
        }
        translate([-0.5, -7.2, -3.02]) {
            #clickMaskulin();
        }
        translate([6.2, -4, -3.02]) {
            rotate([0, 0, -18]) {
                #clickMaskulin();
            } 
        }
        
        translate([0, 0, -3.081]) {
            halfCirkel(diameterTopPartMaskulin+6);    
        }
    }
}

// feminine site code
module topPartFeminineSite(dia, heights)
{
    difference()
    {
        cylinder(d=dia+6, h=heights+2, center=true);
        translate([0, 0, -1.1]) {
            cylinder(d=dia-1.5, h=heights, center=true);  
        }
        translate([0, 0, -3.2]) {
            cylinder(d=dia-0.2, h=3, center=true);
        }
    }
}

module clickFeminine()
{
    cube(size=[1.9, 1.9, 3], center=true);
}

module innerRingCylinder(dia1, dia2, heights1, heights2) 
{ 
    union()
    {
        difference()
        {
        cylinder(d=dia1+3, h=heights1+1, center=true);
        translate([0, 0, -0.6]) {
                cylinder(d=diameterOuterCircle+1, h=innerOuterCircleHeights, center=true);           
            }
        }
        translate([0, 0, -2]) {
        cylinder(d=dia2, h=heights2, center=true);  
        }
    }
}

module topPartfeminineSite()
{
    
    topPartFeminineSite(diameterTopPartFemine, topPartHeightsFemine);
    translate([0, 0, 1.8]) {
         innerRingCylinder
        (diameterOuterCircle,diameterPin,innerOuterCircleHeights, pinHeights);
    } 
    translate([6.2 , -4, -4.9]) {
        rotate([0, 0, -18]) {
            clickFeminine();           
        }     
    }
    translate([0.5, -7.2, -4.9]) {
        clickFeminine();
    }
    translate([-6.2 , -4, -4.9]) {
        rotate([0, 0, 18]) {
            clickFeminine();           
        }     
    }
}

// building the pin halvs
module pinLeft(l) {
    cube(size=[5, 5, l], center=true);
}

module pinRight(l) {
    cube(size=[5, 5, l], center=true);
}

module clickCube(l, w, h)
{   
    rotate([0, 90, 0]) {
        cube(size=[l, w, h], center=true);    
    }
}

module complementCircle()
{
    difference()
    {
        translate([0, 0, 1]) {
            rotate([0, 90, 0]) {
                cylinder(d=5.5, h=2, center=true);
            }
        }
        translate([0, 0, 0]) {
            cube(size=[2.1, 6, 4], center=true);
        }
    }
}

module clickCylinder(dia,hei)
{   
    rotate([0, 90, 0]) {
        cylinder(d=dia, h=hei, center=true);    
    }   
}

module bridgePinRight()
{
    union()
    {
        difference()
        {
            translate([-2, 0, 0]) {
                cube(size=[9, 5, 5], center=true);
            }
            translate([-5.01, 0, 0]) {
                #clickCube(l = clickLength+0.2, w = clickWidth+0.2, h = clickHeights);
            }
            
        }
            translate([0, 0, 5]) {
                cube(size=[5, 5, 5], center=true);        
            }
    }   
}

module buildPinLeft() 
{
    union()
    {
        difference()
        {
            pinLeft(pinLeftLength);
            translate([2, 0, -11.96]) {
                cube(size=[1.1, 5.1, 6.1], center=true);
            }
            translate([2.45, 0, -11]) {
                    complementCircle();
            }
        }

        translate([4, 0, 7.5]) {
            clickCube(l = clickLength, w = clickWidth, h = clickHeights);
        }
        translate([4, 0, -5]) {
            clickCube(l = clickLength, w = clickWidth, h = clickHeights);
        }
        translate([2.5, 0,-12.5]) {
            #clickCylinder(2.4,6);
        }
    }
}

module buildPinRight()
{
    union()
    {
        translate([4, 0, 12.5]) {
            bridgePinRight();   
        }
        difference()
        {
            pinRight(pinRightLength);
            
                translate([-0.91, 0, 0]) {
                    #clickCube(l = clickLength+0.2, w = clickWidth+0.2, 
                    h = clickHeights+0.2);
                }
                translate([0.29, 0,-7.5]) {
                    clickCylinder(2.6,3.5);
                }
                translate([-2, 0, -6.96]) {
                    cube(size=[1.1, 5.1, 6.1], center=true);
                }
                translate([-2.45, 0, -6]) {
                    complementCircle();
                }
        }
    }
}
