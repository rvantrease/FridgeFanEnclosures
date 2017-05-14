screwboss = 5;
screwhole = 3;

boxedge = 92;
boxheight = 25;
boxedgethickness = 3;
//boxedgethickness = screwboss + 3;

LidScrew0 = screwboss;
LidScrew1 = boxedge - screwboss;

include <FanBox92mm.scad>;

//cover minus screw holes
difference (){
    translate([boxedge * -1,boxedge * -1], center=false)        
        cube([boxedge,boxedge,boxheight], center=false);

    translate ([boxedgethickness - boxedge,boxedgethickness - boxedge,2])
        cube([boxedge - (boxedgethickness*2),boxedge - (boxedgethickness*2),30], center=false);
    //air holes
    //y0
    for (yloop =[-15:-5:(boxedge*-1)+10]){
        for (vloop = [0:5:15]){
            translate([-10,yloop,boxedgethickness+vloop])
                cube([10,4,4]);
        }
    }    
    //y1
    for (yloop =[-15:-5:(boxedge*-1)+10]){
        for (vloop = [0:5:15]){
            translate([boxedge * -1,yloop,boxedgethickness+vloop])
                cube([10,4,4]);
        }
    }    
    //x0
    for (xloop =[-15:-5:(boxedge*-1)+10]){
        for (vloop = [0:5:15]){
            translate([xloop,-10,boxedgethickness+vloop])
                cube([4,10,4]);    
        }
    }
    //y1
    for (xloop =[-15:-5:(boxedge*-1)+10]){
        for (vloop = [0:5:15]){
            translate([xloop,boxedge * -1,boxedgethickness+vloop])
                cube([4,10,4]);    
        }
    }
    //top
    //for(variable = [start : increment : end])
    //(92.075-6)*-1,5,(92.075-6)*-1+80 
    for (xloop =[(boxedge - boxedgethickness*3) *-1:5:(boxedge - boxedgethickness) *-1+80]){
        for (yloop =[(boxedge - boxedgethickness*3) *-1:5:(boxedge - boxedgethickness) *-1+80]){
            translate([xloop,yloop])
                cube([4,4,10]);  
        }    
    }  
    //Screw holes        
    translate([LidScrew0 - boxedge,LidScrew0 - boxedge,-1])
        cylinder(boxheight + 2,screwhole,screwhole,center=false);
    translate([LidScrew1 - boxedge,LidScrew0 - boxedge,-1])
        cylinder(boxheight + 2,screwhole,screwhole,center=false);
    translate([LidScrew0 - boxedge,LidScrew1 - boxedge,-1])
        cylinder(boxheight + 2,screwhole,screwhole,center=false);
    translate([LidScrew1 - boxedge,LidScrew1 - boxedge,-1])
        cylinder(boxheight + 2,screwhole,screwhole,center=false);
}
