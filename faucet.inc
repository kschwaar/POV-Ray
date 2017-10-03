#declare chrome = texture { pigment { color rgb < 0.5 0.5 0.5>} finish { diffuse 0.1 specular 0.5 reflection 0.7 roughness 0.005 metallic } }
#declare porcelain = texture { pigment { color rgbf <0.98 0.98 0.98 0> } finish { diffuse 0.8 specular 0.4 roughness 0.02 reflection 0.1 } }

#declare kohler_faucet =
union {
  //the main cylinder, and the beginning of the spout (a sort of "Y" shape)
  difference {
    blob {
      threshold 0.8
      cylinder { <0,-4,0> <0,5,0> 2 3 }
      cylinder { <0,0,0> <2.5,3.75,0> 1 2 }
    }
    box { <-1.5,5,-1.5> <1.5,10,1.5> }
    box { <-1.5,-10,-1.5> <1.5,-2,1.5> }
  }
  torus { 1.575 0.125 translate <0,-2,0> }
  cone { <0,-2,0> 1.65 <0,-1,0> 1.5 }
  torus { 1.5 0.125 translate <0,-1,0> }
  torus { 1.5 0.125 translate <0,4,0> }
  torus { 1.5 0.2 translate <0,5,0> }
  cone { <0,5,0> 1.7 <0,6,0> 0.8 }
  torus { 0.8 0.125 translate <0,6,0> }
  cone { <0,5,0> 1.7 <0,6,0> 0.8 }
  difference {
    //spout
    sphere_sweep {
      b_spline
      7
      <0,0> 0.60 <0,0> 0.60 <2.33,3.75> 0.61 <3.75,5> 0.61 <6.25,5> 0.61
      <7.5,3.75> 0.61 <7.5,3.75> 0.61
    }
    //hole in end of spout
    cylinder { <0,-1,0> <0,0,0> 0.59 rotate 43*z translate <7.4,3.85,0> }
    cone { <0,0,0> 0.59 <0,1,0> 0.45 rotate 43*z translate <7.4,3.85,0> }
  }
  //lip at end of spout
  torus { 0.61 0.1 rotate 43*z translate <7.4,3.85,0> }
  //handle
  sphere_sweep {
    b_spline
    6
    <0,0> 0.3 <0,0> 0.3 <2,3.5> 0.5 <3,7> 0.5 <5,6.5> 0.7
    <6,4.5> 0.7
    scale <1,0.2,1>
    translate <0,5.7,0>
  }
  sphere { <0,0,0> 0.8 scale <1,0.3,1> translate <0,6.2,0> texture {porcelain}}
  texture { chrome }
  translate <0,2,0>
  //the size here was just guessed at; this scale fudges it to look about
  //right, but it's just a guess too.
  scale 0.85
}

