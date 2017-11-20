#include "colors.inc"
#include "metals.inc"
#include "woods.inc"
#include "shapes.inc"           
#include "textures.inc"
#include "glass.inc"
        

#macro Correct_Pigment_Gamma(Orig_Pig, New_G)
  #local Correct_Pig_fn =
      function{ pigment {Orig_Pig} }
  pigment{ average pigment_map{
   [function{ pow(Correct_Pig_fn(x,y,z).x, New_G)}
               color_map{[0 rgb 0][1 rgb<3,0,0>]}]
   [function{ pow(Correct_Pig_fn(x,y,z).y, New_G)}
               color_map{[0 rgb 0][1 rgb<0,3,0>]}]
   [function{ pow(Correct_Pig_fn(x,y,z).z, New_G)}
               color_map{[0 rgb 0][1 rgb<0,0,3>]}]
   }}
#end  

//from http://news.povray.org/povray.binaries.images/thread/<3e44371c%40news.povray.org>/
#declare Leather=texture
 {
   pigment {color rgb < 0.0 , 0.0 , 0.02 >
           }
   normal
         {
         average
         normal_map
                {
                [ crackle metric .3  turbulence 0.1 ]
                [ crackle metric .3  turbulence 0.1 scale .3]
                [ dents , -1.0   scale  0.01]
                }
        scale  .2
        }
   finish
   {
      ambient 0.1
      specular 0.4
      roughness 0.02
   }
scale 0.5}


camera {
//   location <3.75-8*cos(2*pi*clock), 5, 2.25-8*(sin(2*pi*clock))>  
   location<5,5,-10>
   look_at <0 ,0 ,0 >

   //location<-5,5,-8>
   //look_at <3.75,1,2.25>
}
light_source {< 2, 5, -10> color White
}                                       
#declare wallet_lado1 = 5;
 #declare wallet_lado2 = 4;
#declare wallet_height = 1.25; 
#declare wallet_radius = 0.3; 

#declare wallet = union{
 Round_Box(<0,0,0>,<wallet_lado1, wallet_height/2 ,wallet_lado2>, wallet_radius, 0)
 Round_Box(<0,wallet_height,0>,<wallet_lado1, wallet_height/2 ,wallet_lado2>, wallet_radius, 0)      
 texture { Leather }
}
#declare key = prism {
    cubic_spline
    0, // sweep the following shape from here ...
    0.2, // ... up through here
    27, // the number of points making up the shape ...
    < 0, 0>, // point#1 (control point... not on curve)
    <0.4, 4.4>, // c
    < 0.1,  4.05>,  //e
    < -0.05,  3>,  //f
    < 0.15,  2.65>,    //g
    < 0.5, 2.5>,  //h
    < 0.25, 0.4>,  //i
    < 0.45,  0.2>,  //j
    < 0.75,  0.55>,  //k
    < 0.7,  0.7>,//l
    < 0.85,  1>,  //m
    < 0.9,  1.2>,   //n
    < 0.8,  1.4>,  //o
    < 0.8,  1.7>,  //p
    < 0.95,  2>,  //q
    < 0.9,  2>, //r
    < 1.05,  2.25>,    //s
    < 1.05,  2.4>, //t 
    < 1.35,  2.35>, //u
    < 1.3,  2.65>,  //v
    < 1.43,  2.7>, //w
    < 1.5,  2.95>, //z
    < 1.7,  3>,    //a  
    < 1.8,  4>,    //b
    < 1.6, 4.4>, // d      
    <0.4, 4.4>, // c
    
    <0,  0>  // point#6 (control point... not on curve)
    pigment { Green }
  }

#declare keychain_ring = sphere_sweep {
    linear_spline // spline type
    40, //7 number of <x,y,z> points, radius
    <3.1 ,2.25,-0.5>, 0.082
    <3.1, 2.5, -0.5>, 0.082
    < 3, 2.8, -0.5>, 0.082
    < 2.85, 3, -0.5>, 0.082
    < 2.65, 3.2, -0.5>, 0.082
    < 2.4, 3.35, -0.5>, 0.082
    < 2.2, 3.4, -0.5>, 0.082
    < 2, 3.4, -0.5>, 0.082
    < 1.8, 3.4, -0.5>, 0.082
    < 1.6, 3.3, -0.5>, 0.082
    < 1.4, 3.2, -0.5>, 0.082    
    < 1.18, 3, -0.5>, 0.082
    < 1, 2.8, -0.5>, 0.082
    < 1, 2.6, -0.5>, 0.082    
    < 0.95, 2.4, -0.5>, 0.082
    < 0.95, 2.2, -0.5>, 0.082
    < 1, 2, -0.5>, 0.082
    < 1.05, 1.8, -0.5>, 0.082
    < 1.2, 1.6, -0.5>, 0.082
    < 1.4, 1.4, -0.5>, 0.082
    < 1.6, 1.3, -0.5>, 0.082
    < 1.8, 1.25, -0.5>, 0.082
    < 2, 1.25, -0.5>, 0.082    
    < 2.2, 1.25, -0.5>, 0.082
    < 2.4, 1.3, -0.5>, 0.082
    < 2.55, 1.4, -0.5>, 0.082
    < 3, 1.8, -0.5>, 0.082
    < 3.05, 2, -0.5>, 0.082
    < 3.1, 2.2, -0.5>, 0.082

    <3.1 ,2.25,-0.7>, 0.082
    <3.1, 2.5, -0.7>, 0.082
    < 3, 2.8, -0.7>, 0.082
    < 2.85, 3, -0.7>, 0.082
    < 2.65, 3.2, -0.7>, 0.082
    < 2.4, 3.35, -0.7>, 0.082
    
    < 2.2, 3.4, -0.7>, 0.082
    < 2, 3.4, -0.7>, 0.082
    < 1.8, 3.4, -0.7>, 0.082
    < 1.6, 3.3, -0.7>, 0.082
    < 1.4, 3.2, -0.7>, 0.082    
          
        texture{
      pigment{ color rgb<1,0.55,0.00>}
      finish { phong 1}
    } // end of texture
    //scale<1,1,1>
    //rotate<0,0,0>
    //translate<0,0.5,0
   }  // end of sphere_sweep object
   
#declare keylabel = difference 
    {
        prism{
            cubic_spline
            0, // sweep the following shape from here ...
            1, // ... up through here
            23, // the number of points making up the shape ...
            < 0, 0>, // point#1 (control point... not on curve)
            <1.7, 3.9>, // c
            < 1.4,  3.5>,  //d
            < 1.2,  3>,  //e
            < 1.3,  2.4>,    //f
            < 1.6, 2>,  //g
            < 1.9, 1.8>,  //h
            < 2.35,  1.65>,  //i
            < 2.8,  1.7>,  //j
            < 3.35,  1.9>,//k
            < 3.8,  2.1>,//l
            < 4.25,  2.25>,  //m
            < 6.35,  3.18>,   //n
            < 6.61,  3.43>,  //o
            < 6.77,  3.81>,  //p
            < 6.8,  4.14>,  //q
            < 6.7,  4.6>, //r
            < 6.4,  5.06>,    //s
            < 5.84,  5.33>, //t 
            < 5.36,  5.33>, //u
            < 5.36,  5.25>,  //v
        
            
            <1.7, 3.9>, // c
            
            <0,  0>  // point#6 (control point... not on curve)
        }
    box{      
        <2.35,0.3, 3.85><4.9,1.2, 3.05>
    
    } 

}   
#declare boli = union{
   cylinder{ <0,0,0>, <0, 2.1, 0>, 0.1         texture{
      pigment{ color rgb<1,1, 1>}
      finish { phong 1}
    } }
    
   cylinder{ <0,2,0>, <0, 2.7, 0>, 0.125 texture{
      pigment{ color rgb<1,0.02,0.02>}
      finish { phong 1}
    } }
}   
#declare calculator = prism{ 
            cubic_spline
            0, // sweep the following shape from here ...
            0.25, // ... up through here
            25, // the number of points making up the shape ...
            < 0, 0>, // point#1 (control point... not on curve)
            <3.0, 0>, // c
            <3.55, 0.04>,  //d
            < 4.05, 0.16>,  //e
            < 4.6,  0.4>,    //f
            < 4.95, 0.66>,  //g
            < 5.19, 3.55>,  //h
            < 5.21,  5.55>,  //i
            < 5.14,  8.17>,  //j
            < 5.01,  8.44>,//k
            < 4.41,  8.58>,//l
            < 3.1,  8.6>,  //m
            < 1.38,  8.54>,   //n
            < 1.18,  8.44>,  //o
            < 1.07,  8.22>,  //p
            < 0.94,  5.76>,  //q
            < 0.98,  3.52>, //r
            < 1.05,  1.19>,    //s
            < 1.15,  0.81>, //t 
            < 1.28,  0.5>, //u
            < 1.57,  0.23>,  //v
            < 2.05,  0.15>,  //w
            < 2.46,  0.03>,  //z
        
            
            <3.0, 0>, // c
            
            <0,  0>  // point#6 (control point... not on curve)  
               texture{
                 pigment{color rgb<0.4,0.40,0.4>} //
                    finish { phong 1 reflection 0.1}
                } 
               texture{
                pigment{                                             

                 // projects an image on the xy plane
                 //from <0,0,0> to <1,1,0>
                 // (aspect ratio 1:1)
                 image_map{ png "fx350esplus.png"
                 // imagetype "file name" - Path + .tga etc.
                 // accepted types of images:
                 // gif, tga, iff, ppm, pgm, png, jpeg, tiff, sys
                 map_type 0 // 0=planar, 1=spherical, 2=cylindrical, 5=torus
                 interpolate 2
                  // 0=none, 1=linear, 2=bilinear, 4=normalized distance
                  //
              // for transpartent image parts use palette graphics (256 colors or less)
              // gif version 87a, non interlaced, or png palette non interlaced
              // filter Palette, Amount |
              // filter all Amount |
               //  transmit 215, 1 // Palette, Amount |
              // transmit all Amount
                } // end of image_map
              } // end of pigment
            
              finish { diffuse 0.9 phong 1}// end of finish
              scale <6,1.5,1> rotate<0,0,6> translate<5.8,0.00,2>
              } // end of texture  ------------------


}         
#declare keychain  = prism{
            cubic_spline
            0, // sweep the following shape from here ...
            1, // ... up through here
            36, // the number of points making up the shape ...
            < 0, 0>, // point#1 (control point... not on curve)
            < 1.01, -1.32 >, //c
            < 1.27, -0.57 >, //d
            < 1.44,  0.61 >, //e
            < 1.50,  2.28 >, //f
            < 1.47,  3.08 >, //g
            < 1.52,  2.28 >, //h
            < 1.32,  3.76 >, //i
            < 1.08,  3.08 >, //j
            < 0.87,  3.37 >, //k
            < 0.56,  3.66 >, //l
            < 0.43,  4.12 >, //m
            < 0.70,  5.08 >, //n
            < 0.94,  4.96 >, //o
            < 0.87,  5.38 >, //p
            < 0.66,  5.62 >, //q 
            < 0.55,  5.67 >, //r
            < 0.29,  5.04 >, //s
            < 0.05,  4.08 >, //t
            <-0.02,  2.99 >, //u
            < 0.03,  1.94 >, //v
            < 0.18,  0.88 >, //w 
            < 0.43,  0.00 >, //z
            < 1.01, -1.32 >, //c

	        <0,  0>,  // (control point... not on curve) 


	        <0,  0>,  // (control point... not on curve) 

            < 0.79, -0.63 >, //a1
            < 1.01, -1.07 >, //b1
            < 1.51,  1.16 >, //c1 
            < 1.31,  3.08 >, //d1 
            < 0.71,  3.26 >, //e1 
            < 0.25,  4.00 >, //f1 
            < 0.17,  2.46 >, //g1 
            < 0.41,  0.72 >, //h1
            < 0.79, -0.63 >, //a1

	        <0,  0>  // (control point... not on curve)     
	        texture{
      pigment{ color rgb<1,0.02,0.02>}
      finish { phong 1}
    }
        }

/* Horizontal Plane */
plane{ <0,1,0>, -0.012 pigment{ rgb<0.3,0.4,0.4> } }  

//object{wallet translate <0,0, 0>}   
//object{key translate <0,2, -5 >}   
//object {keychain_ring }         
//object {keylabel}    
//object {boli}  
//object {calculator}     
object {keychain}