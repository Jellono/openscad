Alpha200_length = 23;//23 inches
Alpha200_width = 12;//12 inches
Alpha200_height = 19;//19 inches

ShelfLength = 25.5;
ShelfWidth = 7.75;

HandelStub=2.5;


TopShelfRotation =10;

//Tubing Stock
TwoInches =2; //Two Inches to MM;
OneInches =1; //One Inches to MM;
HalfInches =0.5; //One Inches to MM;
WallThickness = 1/16 ;





2InchtopShelf();


module HalfInchHandel()
{
        
        HandelLength=ShelfWidth*2-HandelStub;
        //echo ("Handel Length = ", HandelLength);
        //echo ("Handel Stub Length = ", HandelStub);
        color([1,0,0])
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


module 2InchtopShelf()
{
    AlphaTig200();
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
module 1InchtopShelf()
{
    AlphaTig200();
    translate ([0,ShelfWidth,(-Alpha200_height/2)+OneInches/4]) 1InchSquareTubing(ShelfLength);
    translate ([0,-ShelfWidth,(-Alpha200_height/2)+OneInches/4]) 1InchSquareTubing(ShelfLength);
    
    translate ([ShelfLength/2+TwoInches/2-13,0,(-Alpha200_height/2)+OneInches/4]) 
        rotate([0,0,90])
            1InchSquareTubing(ShelfWidth*2+25);

    translate ([-(ShelfLength/2+38)+TwoInches/2,0,(-Alpha200_height/2)+OneInches/4]) 
        rotate([0,0,90])
            1InchSquareTubing(ShelfWidth*2+25);
    
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
module HalfInchSquareTubing(lengthMM = 245,name = "") //10 inches by default
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




module AlphaTig200()
{

    color([1,1,0])   cube ([Alpha200_length,
        Alpha200_width,
        Alpha200_height],
        center=true) ;
    
}