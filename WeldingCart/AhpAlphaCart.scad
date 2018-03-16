Alpha200_length = 23;//23 inches
Alpha200_width = 12;//12 inches
Alpha200_height = 19;//19 inches

ShelfLength = 25;
ShelfWidth = 7;

MiddleShelfWidth = 8;
BottomShelfAdjustment = 7.5;
BottomShelfLength= ShelfLength+BottomShelfAdjustment;

HandelStub=3;


TopShelfRotation =8;

//Tubing Stock
TwoInches =2; //Two Inches to MM;
OneInches =1; //One Inches to MM;
HalfInches =0.5; //One Inches to MM;
ThreeQuarterInches = 3/4;
WallThickness = 1/16 ;

//PerfPlate (ShelfWidth*2,ShelfLength+1);


Shelves();
SideStruts();
BackUprights();
Misc();
TankStruts();

module TankStruts()
{
    color([.9,.9,.9])
    {
        translate([-12.5,2,-34.25])
        rotate([0,0,180])
        OneInchAngleIron(24,"2 x Tank Struts");

        translate([-12.5,-2,-34.25])
        rotate([0,0,90])
        OneInchAngleIron(24);
    }
}
module OneInchAngleIron (length =11,name="")
{
    cube([OneInches,1/8,length]);
    rotate([0,0,90])
    cube([OneInches,1/8,length]);
    
      if(name != "")
     {
         echo (name," = " ,length);             
     }
}


module PerfPlate(width,height,name="")
{
    //rotate([-TopShelfRotation,0,90])
    //translate([-ShelfWidth,-13,-9.8])
    difference()
    {
        cube ([width,height,0.036]);       
        for (y=[0:5/16:height])
        {
            for (x=[0:5/16:width])
            {
                  echo ("x = " ,x);             
                translate([x,y,0])
                circle(.125);
            }
        }
        
    }
    
}

module BackUprights()
{

    color([.9,.9,.9])
    rotate([0,90,0])
    {
        translate([23,ShelfWidth+.5,-ShelfLength/2])
            1InchSquareTubing(25,"2 x Back Uprights");
        translate([23,-ShelfWidth-.5,-ShelfLength/2])
            1InchSquareTubing(25);

    }

}
module SideStruts()
{
    color([.9,.9,.9])
    {
        translate([-2,-ShelfWidth-1.55,-21])
            rotate ([0,-50,0])
                1InchSquareTubing(36,"2 x Side Struts");

        translate([-2,ShelfWidth+1.55,-21])
            rotate ([0,-50,0])
                1InchSquareTubing(36);
    }


}

module Misc()
{
 
    rotate([0,-TopShelfRotation,0])
        AlphaTig200();
    
    translate([-16,0,-24])
        ArgonTank55();

    translate([-15,-5,-22])
        RodGuard();

    translate([-15,5,-22])
        RodGuard();
    
}

module Shelves()
{
  rotate([0,-TopShelfRotation,0])
        1InchtopShelf();
 
 1InchMiddleShelf();
 1InchBottomShelf();

}
module 1InchBottomShelf()
{
    translate([01.4+BottomShelfAdjustment/2,0,-25.5])
    color([.9,.9,.9])
    {
    
            translate ([-BottomShelfAdjustment,MiddleShelfWidth+OneInches/2,(-Alpha200_height/2)+OneInches/4]) 1InchSquareTubing(BottomShelfLength,"2 x BottomShelf Length");
            translate ([-BottomShelfAdjustment,-MiddleShelfWidth-OneInches/2,(-Alpha200_height/2)+OneInches/4]) 1InchSquareTubing(BottomShelfLength);
            
        
        translate ([(BottomShelfLength/2+OneInches/2)-BottomShelfAdjustment,0,(-Alpha200_height/2)+OneInches/4]) 
                rotate([0,0,90])
                    1InchSquareTubing(MiddleShelfWidth*2+2,"2 x BottomShelf Width");

            //translate ([-(ShelfLength/2+50)+OneInches/2,0,(-Alpha200_height/2)+OneInches/4]) 
        translate ([-(BottomShelfLength/2+OneInches/2)-BottomShelfAdjustment,0,(-Alpha200_height/2)+OneInches/4]) 
                rotate([0,0,90])
                    1InchSquareTubing(MiddleShelfWidth*2+2);
        
        translate ([-(BottomShelfLength/2+OneInches/2),0,(-Alpha200_height/2)+OneInches/4]) 
                rotate([0,0,90])
                    1InchSquareTubing(MiddleShelfWidth*2,"1x Bottom Self Center Cross");

        color([1,0,0])
            translate ([-(BottomShelfLength/2+OneInches/2)-BottomShelfAdjustment/2,-MiddleShelfWidth/4,(-Alpha200_height/2)+OneInches/4]) 1InchSquareTubing(BottomShelfAdjustment-OneInches,"2 x Bottom Shelf Tank Cross");

        color([1,0,0])
            translate ([-(BottomShelfLength/2+OneInches/2)-BottomShelfAdjustment/2,+(MiddleShelfWidth/4),(-Alpha200_height/2)+OneInches/4]) 1InchSquareTubing(BottomShelfAdjustment-OneInches);


    } 
    
}


module 1InchMiddleShelf()
{
    translate([01.4,0,-12])
    color([.9,.9,.9])
    {
    
            translate ([0,MiddleShelfWidth+OneInches/2,(-Alpha200_height/2)+OneInches/4]) 1InchSquareTubing(ShelfLength,"2 x MiddleShelf Length");
            translate ([0,-MiddleShelfWidth-OneInches/2,(-Alpha200_height/2)+OneInches/4]) 1InchSquareTubing(ShelfLength);
            
            translate ([ShelfLength/2+OneInches/2,0,(-Alpha200_height/2)+OneInches/4]) 
                rotate([0,0,90])
                    1InchSquareTubing(MiddleShelfWidth*2+2,"2 x MiddleShelf Width");

            //translate ([-(ShelfLength/2+50)+OneInches/2,0,(-Alpha200_height/2)+OneInches/4]) 
            translate ([-(ShelfLength/2+OneInches/2),0,(-Alpha200_height/2)+OneInches/4]) 
                rotate([0,0,90])
                    1InchSquareTubing(MiddleShelfWidth*2+2);


    } 
    
}


module ThreQuarterInchHandel()
{
        
        HandelLength=ShelfWidth*2-HandelStub;
        //echo ("Handel Length = ", HandelLength);
        //echo ("Handel Stub Length = ", HandelStub);
        //color([1,0,0])
        translate([-(HandelStub/2),0,0])
        rotate([0,0,90])ThreeQuarterInchSquareTubing(HandelLength,"2 x TopShelf Handel Width");
        
        color([0,1,0])
        rotate([90,00,0]) 
            translate([0,0,HandelLength/2-ThreeQuarterInches/2])  
                ThreeQuarterInchSquareTubing(HandelStub,"2 x TopShelf Handel Stub");

        rotate([90,00,0]) 
            translate([0,0,-(HandelLength/2-ThreeQuarterInches/2)])  
                ThreeQuarterInchSquareTubing(HandelStub);

}


module 1InchtopShelf()
{
    color([.9,.9,.9])
    {
    
            translate ([0,ShelfWidth+OneInches/2,(-Alpha200_height/2)+OneInches/4]) 1InchSquareTubing(ShelfLength,"2 x TopShelf Length");
            translate ([0,-ShelfWidth-OneInches/2,(-Alpha200_height/2)+OneInches/4]) 1InchSquareTubing(ShelfLength);
            
            translate ([ShelfLength/2+OneInches/2,0,(-Alpha200_height/2)+OneInches/4]) 
                rotate([0,0,90])
                    1InchSquareTubing(ShelfWidth*2+2,"2 x TopShelf Width");

            //translate ([-(ShelfLength/2+50)+OneInches/2,0,(-Alpha200_height/2)+OneInches/4]) 
            translate ([-(ShelfLength/2+OneInches/2),0,(-Alpha200_height/2)+OneInches/4]) 
                rotate([0,0,90])
                    1InchSquareTubing(ShelfWidth*2+2);

            //Handel
            rotate ([0,0,180])
                translate ([-(HandelStub/2+ShelfLength/2+OneInches),0,-Alpha200_height/2])
                    ThreQuarterInchHandel();

    } 
    
}

module 2InchSquareTubing(lengthMM = 245,name = "" ) //10 inches by default
{
    difference()
    {
         cube ([lengthMM,
        TwoInches, //2 inches OD
        TwoInches], //2 inches OD
        center=true) ;
        cube ([lengthMM+5, TwoInches - WallThickness,   TwoInches- WallThickness],     center=true) ;        
        if(name != "")
         {
             echo (name," = " ,lengthMM);             
         }
     }


}
module 1InchSquareTubing(lengthMM = 245,name = "") //10 inches by default
{
    difference()
    {
         cube ([lengthMM,
        OneInches, //2 inches OD
        OneInches], //2 inches OD
        center=true) ;
        cube ([lengthMM+5, OneInches - WallThickness,   OneInches- WallThickness],     center=true) ;        
     }
    if(name != "")
     {
         echo (name," = " ,lengthMM);             
     }


}
module HalfInchSquareTubing(lengthMM = 10,name = "") //10 inches by default
{
    difference()
    {
         cube ([lengthMM,
        HalfInches, //2 inches OD
        HalfInches], //2 inches OD
        center=true) ;
        cube ([lengthMM+5, HalfInches - WallThickness,   HalfInches- WallThickness],     center=true) ;        
     }
    if(name != "")
     {
         echo (name," = " ,lengthMM);             
     }


}

module ThreeQuarterInchSquareTubing(lengthMM = 10,name = "") //10 inches by default
{
    difference()
    {
         cube ([lengthMM,
        ThreeQuarterInches, 
        ThreeQuarterInches], //2 inches OD
        center=true) ;
        cube ([lengthMM+5, ThreeQuarterInches - WallThickness,   ThreeQuarterInches- WallThickness],     center=true) ;        
     }
    if(name != "")
     {
         echo (name," = " ,lengthMM);             
     }


}



module AlphaTig200()
{

    color([1,1,0])   cube ([Alpha200_length,
        Alpha200_width,
        Alpha200_height],
        center=true) ;
    
}
module 2InchtopShelf()
{
    color([.9,.9,.9])
    {
    
            translate ([0,ShelfWidth,(-Alpha200_height/2)+TwoInches/4]) 2InchSquareTubing(ShelfLength,"TopShelf Length");
            translate ([0,-ShelfWidth,(-Alpha200_height/2)+TwoInches/4]) 2InchSquareTubing(ShelfLength);
            
            translate ([ShelfLength/2+TwoInches/2,0,(-Alpha200_height/2)+TwoInches/4]) 
                rotate([0,0,90])
                    2InchSquareTubing(ShelfWidth*2+2,"TopShelf Width");

            //translate ([-(ShelfLength/2+50)+TwoInches/2,0,(-Alpha200_height/2)+TwoInches/4]) 
            translate ([-(ShelfLength/2+TwoInches/2),0,(-Alpha200_height/2)+TwoInches/4]) 
                rotate([0,0,90])
                    2InchSquareTubing(ShelfWidth*2+2);

            //Handel
            rotate ([0,0,180])
                translate ([-(HandelStub/2+ShelfLength/2+TwoInches),0,-Alpha200_height/2])
                    HalfInchHandel();

    } 
}
//55 Cubic Foot Argon Tank Dimensions..
module ArgonTank55()
{
    $fn=50; 
    {
        color([.5,.3,.1])
        {
            cylinder(20.5, 3.375, 3.375, true);
            translate ([0,0,10])
                sphere(3.375);
        }
        color([.9,.9,.9])
            translate ([0,0,13])
                cylinder(4, 1.5, 1.5, true);
    }
}
//THis is a rod Guard for Tig Rods... 
module RodGuard()
{
    $fn=50; 
    color([0,.5,.9])
    {
        cylinder(24, 1, 1, true);
        translate ([0,0,18])
        cylinder(13, 1.14, 1.14, true);
    }
}
module HalfInchHandel()
{
        
        HandelLength=ShelfWidth*2-HandelStub;
        //echo ("Handel Length = ", HandelLength);
        //echo ("Handel Stub Length = ", HandelStub);
        //color([1,0,0])
        translate([-(HandelStub/2+.25),0,0])
        rotate([0,0,90])HalfInchSquareTubing(HandelLength,"TopShelf Handel Width");
        
        color([0,1,0])
        rotate([90,00,0]) 
            translate([0,0,HandelLength/2-HalfInches/2])  
                HalfInchSquareTubing(HandelStub,"TopShelf Handel Stub");

        rotate([90,00,0]) 
            translate([0,0,-(HandelLength/2-HalfInches/2)])  
                HalfInchSquareTubing(HandelStub);

}
