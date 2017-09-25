#include "colors.inc"
#include "metals.inc"
#include "woods.inc"
camera {
//   location <3.75-8*cos(2*pi*clock), 5, 2.25-8*(sin(2*pi*clock))>  
   location<-5,5,-5>
   look_at <3.75,1,2.25>
}
light_source {< 2, 13, -10> color White
}
/*  PAWNS */
#declare pawn_body = lathe{ quadratic_spline 8,
                       <0,0>,<0.5,0>,<0.5,0.25>,<0.4,0.35>,<0.2,0.95>,
                       <0.25,1>,<0.2,1.05>,<0,1.1> 
                       }            
                                                  
#declare gold_pawn = union{
                        object{pawn_body}
                        sphere{<0,1.35,0> 0.3}
                        texture{T_Gold_1B}
                        }
#declare silver_pawn = union{
                        object{pawn_body}
                        sphere{<0,1.35,0> 0.3}
                        texture{T_Silver_1B}
                        }
                                                              
/* Horizontal Plane */
plane{ <0,1,0>, -0.012 pigment{ rgb<0.2,0.8,0.4> } }
/* Chess Board */
box{ <9.75,-0.01,8.25> <-2.25,0.0,-3.75> 
                pigment{checker pigment{rgb<0,0,0>},pigment{rgb<0.9,0.8,0.8>} 
                        scale<1.5,0,1.5> translate<0.75,0,0.75>} 
   }
/* Display Chess set */
object{gold_pawn translate <0,0,-3>}   
object{gold_pawn translate <0,0,-1.5>}
object{gold_pawn}
object{gold_pawn translate <0,0,1.5>}
object{gold_pawn translate <0,0,3>}
object{gold_pawn translate <0,0,4.5>}
object{gold_pawn translate <0,0,6>}    
object{gold_pawn translate <0,0,7.5>}
object{silver_pawn translate <7.5,0,-3>}   
object{silver_pawn translate <7.5,0,-1.5>}
object{silver_pawn translate <7.5,0,0>}
object{silver_pawn translate <7.5,0,1.5>}
object{silver_pawn translate <7.5,0,3>}
object{silver_pawn translate <7.5,0,4.5>}
object{silver_pawn translate <7.5,0,6>}    
object{silver_pawn translate <7.5,0,7.5>}           
