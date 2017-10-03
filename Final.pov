//Output_File_Type=N Height=720 Width=1280 Antialias=yes
//Last Frame=1450


#include "colors.inc"
#include "woods.inc"


//location<82.5,7,5>
//look_at <82.5,7,20>
camera{
        location<82.5,15,42>
        look_at <82.5,15,240.5>
        angle 30
}          


//SKY
#include "stars.inc"
sphere{ <0,0,0>, 1
        texture{ Starfield1 scale 0.1 //was 0.25
                finish{ambient 1}
               } // end of texture
        scale 1000
        rotate <0, 0.001+0.001*clock, 0.001+0.001*clock>
      }  
//MOUNTAINS

height_field{
        ppm "img3.ppm"
        smooth
        texture{
                pigment{
                        image_map {
                                jpeg "sunrise.jpg"
                                map_type 0
                                once
                        }        
                }
        }
        scale <200,50,300>
        translate <20, -40, 75>
        
}

//MOON
#declare PMoonMare=pigment {
wrinkles
turbulence 0.2
scale 0.5
color_map { [0 rgb 1] [1 rgb 0] }
}

#declare PMoonCraters=
pigment {
granite
scale 0.2
color_map{
[0 rgb 1]
[1 rgb 0]
}
}

#declare TMoon=
texture{
pigment {
average
pigment_map{
[0.85 PMoonMare]
[0.15 PMoonCraters]
}
}
finish {ambient 0.3+0.7*clock diffuse 0.9}
normal {
average
normal_map{
[0.85 wrinkles 0.3 turbulence 0.2]
[0.15 granite 0.3 scale 0.4]
}
scale 1/2
}
}

#declare Moon1=sphere { 0,1 texture {TMoon } }
object{Moon1 scale 10 translate<82.5, -25+100*clock, 500> }




//TREES
#declare l_base = object { cone { <0,0,0>, 0.25, <0,1.5,0> ,0.25 }}
#declare t_base = finish { ambient 0.3 diffuse 0.7 phong 1 }
#declare t_leaf = finish { ambient 0.3 diffuse 0.7 }
#declare firstTree = object{#include "tree1.inc"}
#declare Secondtree= object{#include "tree2.inc"}
#declare forest = union{
object{firstTree  scale 2 translate<80,-15,200>}
object{firstTree  scale 1.8 translate<85,-15,300>}
object{firstTree  scale 1.7 translate<65,-15,350>}
object{firstTree  scale 1.5 translate<90,-15,400>} 
object{firstTree  scale 2 translate<100,-15,200>}
object{firstTree  scale 1.7 translate<120,-15,350>}
object{firstTree  scale 1.8 translate<115,-15,300>}
object{firstTree  scale 2 translate<140,-15,200>}
object{firstTree  scale 1.8 translate<145,-15,300>}
object{firstTree  scale 1.8 translate<150,-15,300>}
object{firstTree  scale 1.5 translate<160,-15,400>}

object{Secondtree  scale 2 translate<80,-15,200>}
object{Secondtree  scale 1.7 translate<65,-15,350>}
object{Secondtree  scale 1.8 translate<50,-15,300>}
object{Secondtree  scale 2 translate<100,-15,200>}
object{Secondtree  scale 1.8 translate<105,-15,300>}
object{Secondtree  scale 1.8 translate<115,-15,300>}
object{Secondtree  scale 1.5 translate<130,-15,400>}
object{Secondtree  scale 1.8 translate<145,-15,300>}
object{Secondtree  scale 1.7 translate<135,-15,350>}
object{Secondtree  scale 1.5 translate<160,-15,400>}
}

object{forest translate<-15,0,0>}