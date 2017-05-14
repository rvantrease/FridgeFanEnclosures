ScrewOffset = 5;
ScrewHole = 3;

BoxEdge = 92;
BoxHeight = 25;
BoxEdgethickness = 3;

//BoxEdgethickness = ScrewOffset + 3;
VentWidgh = 32;
VentHeight = 11;
VentCenter = (BoxEdge - VentWidgh)/2;

boxscrew0 = ScrewOffset;
boxscrew1 = BoxEdge - ScrewOffset;

difference (){
    //cube([x,y,z], center = true/false);
    cube([BoxEdge,BoxEdge,BoxHeight], center=false);

    //Remove the following shapes
    //Translates (moves) its child elements along the specified vector. The argument name is optional.
    //    translate([x, y, z]) { ... }
        translate ([BoxEdgethickness,BoxEdgethickness*3,BoxEdgethickness])
            cube([BoxEdge - (BoxEdgethickness*2),BoxEdge - (BoxEdgethickness*6),30], center=false);
        translate ([BoxEdgethickness*3,BoxEdgethickness,BoxEdgethickness])
            cube([BoxEdge - (BoxEdgethickness*6),BoxEdge - (BoxEdgethickness*2),30], center=false);
        //vent hole
        translate([VentCenter,0,BoxEdgethickness])
            cube([VentWidgh,20,VentHeight]);
        //Screw holes        
        translate([boxscrew0,boxscrew0,-3])
            cylinder(BoxHeight+5,ScrewHole,ScrewHole,center=false);
        translate([boxscrew1,boxscrew0,-3])
            cylinder(BoxHeight+5,ScrewHole,ScrewHole,center=false);
        translate([boxscrew0,boxscrew1,-3])
            cylinder(BoxHeight+5,ScrewHole,ScrewHole,center=false);
        translate([boxscrew1,boxscrew1,-3])
            cylinder(BoxHeight+5,ScrewHole,ScrewHole,center=false);
}