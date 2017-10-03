//Output_File_Type=N Height=720 Width=1280 Antialias=yes
//Initial_Frame=2351 Final_Frame=2600


#include "colors.inc"
#include "woods.inc"


//location<82.5,7,5>
//look_at <82.5,7,20>
camera{
        location<82.5,15,42>
        look_at <82.5,15,240.5>
        angle 30
}          

light_source{
        <76, 19, 0>
        color White*(1-clock)
}


//FLOOR
box{<67,0,20>,<100,-1,40>
    texture{
                pigment{
                        image_map{
                                jpeg "tile4.jpg"
                                map_type 0
                        }
                        scale 2
                        rotate<90, 0, 0>
                }
                normal{
                        bump_map{
                                jpeg "tile4.jpg"
                                bump_size 4
                                interpolate 2
                                }
                        scale 2
                        rotate<90, 0, 0>
                }
                finish {diffuse 0.20 ambient 0.15 reflection 0.15 phong 0.4}
        }
}

//Ceiling
box{<67,20,20>,<100,21,40>
    texture{
                pigment{
                        image_map{
                                jpeg "ceiling.jpg"
                                map_type 0
                        }
                        scale 2
                        rotate<90, 0, 0>
                }
                normal{
                        bump_map{
                                jpeg "ceiling.jpg"
                                bump_size 4
                                interpolate 2
                                }
                        scale 2
                        rotate<90, 0, 0>
                }
                finish {diffuse 0.20 ambient 0.15 reflection 0.15 phong 0.4}
        }
}



//KITCHEN WALLS
difference{
box{<67,0,40>,<100,20,41>}
box{<80,10,39>,<85,17,42>}
texture{pigment{rgb<1,0.97,0.95>*0.95}
finish {diffuse 0.15 ambient 0.15 reflection 0.01 phong 0.4}}}      
box{<67,0,20>,<67.5,20,40.5>
texture{pigment{rgb<1,0.97,0.95>*0.95}
finish {diffuse 0.15 ambient 0.15 reflection 0.01 phong 0.4}}}
box{<99.5,0,20>,<100,20,40.5>
texture{pigment{rgb<1,0.97,0.95>*0.95}
finish {diffuse 0.15 ambient 0.15 reflection 0.01 phong 0.4}}}




//Cabinet
difference{
box{<75,0,35>,<90,8,40>}
sphere{<82.5,8,37>1.5}
texture{T_Wood25 scale 3} }

#include "stones1.inc"
difference{
sphere{<82.5,8,37>1.5}
sphere{<82.5,8,37>1.3}
clipped_by{plane{<0,1,0>,8}}
texture{T_Stone17}}

#include "faucet.inc"         
object{ kohler_faucet
rotate<0,90,0>
scale 0.18
translate<82.5,8,39>
}


  #declare OceanArea = texture {
      pigment {
        bozo
        turbulence .5
        lambda 2
        color_map {
          [0.00, 0.33 color rgb <0, 0, 1>
                      color rgb <0, 0, 1>]
          [0.33, 0.66 color rgbf <1, 1, 1, 1>
                      color rgbf <1, 1, 1, 1>]
          [0.66, 1.00 color rgb <0, 0, 1>
                      color rgb <0, 0, 1>]
        }
      }
    }


//SHELL
//When tilting back, change the z rotate coordinate to -30
object{#include "shell.inc" scale 0.001 rotate<-90,180,0> translate<84.7,8,38>}

//Kitchen Light
light_source{
        <82.5, 19, 30>
        color White*(1-clock)
}


        

#declare hall =
box{<0,0,0>,<20,20,1>
      texture{pigment{rgb<205/255,198/255,115/255>}
                finish {diffuse 0.15 ambient 0.15 reflection 0.02 phong 0.4}
        }
}

object{hall translate<-2, 0, 10.1> scale<3,1,1>}
object{hall translate<-3, 0, 20> scale<4,1,1>}
object{hall translate<-40, 0, -10> scale<0.5,1,1> rotate<0,90,0>}
object{hall scale<2.8,1,1> rotate<0,90,0> translate<100, 0, 25>}
object{hall scale<2.1,1,1> rotate<0,90,0> translate<53, 0, 10.5>}
object{hall scale<2.4,1,1> translate<53, 0, -25>}


light_source{
        <-5, 10, 15>
        color White*1.1*(1-clock)
}

light_source{
        <5, 10, 15>
        color White*1.1*(1-clock)
} 

light_source{
        <15, 10, 15>
        color White*1.1*(1-clock)
        spotlight
        point_at<15,12,20>
} 

light_source{
        <30, 10, 15>
        color White*1.1*(1-clock)
}

light_source{
        <45, 10, 15>
        color White*1.1*(1-clock)
} 

light_source{
        <60, 10, 15>
        color White*1.1*(1-clock)
}  


difference{
box{<67,0,20>,<100,20,20.1>}
box{<80,0,19.9>,<85,12,20.2>}
texture{pigment{rgb<1,0.97,0.95>*0.95}
                finish {diffuse 0.15 ambient 0.15 reflection 0.01 phong 0.4}
        }
}        

#include "doors.inc"
object{Door_1 rotate<0,-90,0> scale<5,6.8,1> translate<79.5,0,22.5>}




//SUNLIGHT
//Kitchen Light
light_source{
        <82.5, 200, 30>
        color White*3*(1-clock)
}


//SKY
sky_sphere {
    pigment {
      gradient y
      color_map {
        [ 0.5  color rgb<0.258824,0.258824,0.435294>*(1-clock) ]
        [ 1.0  color rgb<0.184314,0.184314,0.309804>*(1-clock) ]
      }
      scale 2
      translate -1
    }
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
/*
sphere{
        <82.5,-1400+500,20000>, 200
        texture{
                pigment{image_map {
                                jpeg "moon.jpg"
                                map_type 2
                               
                        }}
                }
                normal{
                        bump_map{
                                jpeg "moon.jpg"
                                bump_size 4
                                interpolate 2
                                once
                                }
                               
                }
                finish{ambient 0.8} 
        }
*/

//TREES
#declare l_base = object { cone { <0,0,0>, 0.25, <0,1.5,0> ,0.25 }}
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
