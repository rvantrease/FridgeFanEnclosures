ScrewOffset = 5;
ScrewHole = 3;

BoxEdgeMM = 40;
BoxHeight = 15;
BoxEdgeMMthickness = 3;
//BoxEdgeMMthickness = ScrewOffset + 3;
VentWidgh = 25.3;
VentHeight = 6;
VentCenter = (BoxEdgeMM - VentWidgh)/2;

boxscrew0 = ScrewOffset;
boxscrew1 = BoxEdgeMM - ScrewOffset;

difference (){
    //cube([x,y,z], center = true/false);
    cube([BoxEdgeMM,BoxEdgeMM,BoxHeight], center=false);

    //Remove the following shapes
    //Translates (moves) its child elements along the specified vector. The argument name is optional.
    //    translate([x, y, z]) { ... }
    translate ([BoxEdgeMMthickness,BoxEdgeMMthickness*3,BoxEdgeMMthickness])
        cube([BoxEdgeMM - (BoxEdgeMMthickness*2),BoxEdgeMM - (BoxEdgeMMthickness*6),30], center=false);
    translate ([BoxEdgeMMthickness*3,BoxEdgeMMthickness,BoxEdgeMMthickness])
        cube([BoxEdgeMM - (BoxEdgeMMthickness*6),BoxEdgeMM - (BoxEdgeMMthickness*2),30], center=false);
    //vent hole
    translate([VentCenter,0,BoxEdgeMMthickness])
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