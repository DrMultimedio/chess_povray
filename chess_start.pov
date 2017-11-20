#include "colors.inc"
#include "metals.inc"
#include "woods.inc"
#include "shapes.inc"           
#include "textures.inc"
#include "glass.inc"
camera {
//   location <3.75-8*cos(2*pi*clock), 5, 2.25-8*(sin(2*pi*clock))>  
   location<5,5,-10>
   look_at <3.75,1,2.25>

   //location<-5,5,-8>
   //look_at <3.75,1,2.25>
}
light_source {< 2, 5, -10> color White
}
/*  PAWNS */
#declare pawn_body = lathe{ quadratic_spline 8,
                       <0,0>,<0.5,0>,<0.5,0.25>,<0.4,0.35>,<0.2,0.95>,
                       <0.25,1>,<0.2,1.05>,<0,1.1> 
                       }            
                                                  
/*#declare gold_pawn = union{
                        object{pawn_body}
                        sphere{<0,1.35,0> 0.3}
                        texture{T_Gold_1B}
                        }     
                        */                         
#declare pawn_height = 0.8;
#declare pawn_radius = 0.5;
#declare tower_height = 1.25;
#declare tower_lado = 0.8;
#declare tower_center = tower_lado/2 ; 
#declare tower_thickness = 0.9;
#declare tower_interior_a = tower_center - tower_center*tower_thickness;
#declare tower_interior_b = tower_center + tower_center*tower_thickness; 
#declare king_height = 2;
#declare king_radius = 0.5;
//pawns
#declare gold_pawn = difference{
                         cone{<0,      0,0>,pawn_radius*0.8, <0,pawn_height   ,0>,pawn_radius }
                         cone{<0,pawn_radius*.05,0>,pawn_radius*0.5, <0,pawn_height+.1,0>,pawn_radius*.9} 
                         material {
                           texture {
                               pigment { color rgbf <1, 1.0, 1, 0.5> }
                               finish { F_Glass4 }
                           }
                             interior { I_Glass caustics 1 }
                           }
} // end of difference



#declare gold_tower = difference{                                    
                         // Round_Box(A, B, WireRadius, Merge)
                        Round_Box(<0,0,0>,<tower_lado, tower_height ,tower_lado>, 0.007, 0)
                        Round_Box(<tower_interior_a, 0, tower_interior_a>,<tower_interior_b, tower_height*1.1,tower_interior_b>, 0.07, 0)
                         material {
                           texture {
                               pigment { color rgbf <0.98, 1.0, 0.99, 0.75> }
                               finish { F_Glass4 }
                           }
                             interior { I_Glass caustics 1 }
                           }

}                                             
#declare gold_king = difference{                                    
                         //<Base_Point>, <Cap_Point>, Radius
                        cylinder{<0,0,0>, <0, king_height, 0>, king_radius}
                          cylinder{<0,king_height*0.1,0>, <0, king_height*1.25, 0>, king_radius*0.95}

                         material {
                           texture {
                               pigment { color rgbf <0.98, 1.0, 0.99, 0.75> }
                               finish { F_Glass4 }
                           }
                             interior { I_Glass caustics 1 }
                           }

}
#declare gold_queen =   lathe{ quadratic_spline 6,
                       <0,0>,<0.3,0.0>,<0.05,0.1>,<0.1,0.6 >,<0.1,0.6>, <0.5, 1.1>
                        material {
                           texture {
                               pigment { color rgbf <0.98, 1.0, 0.99, 0.75> }
                               finish { F_Glass4 }
                           }
                             interior { I_Glass caustics 1 }
                           } 
                       }  
#declare gold_bishop =   lathe{ quadratic_spline 8,
                       <0,0>,<0.15,0.0>,<0.03,0.05>,<0.03,0.15>,<0.1,0.2>,<0.12,0.3 >,<0.15,0.6>, <0.15, 0.7>
                        material {
                           texture {
                                         pigment { color rgbf <0.98, 1.0, 0.99, 0.75> }
                               finish { F_Glass4 }
                           }
                             interior { I_Glass caustics 1 }
                           } 
                       }  
                                                    
#declare gold_knight =   lathe{ quadratic_spline 13,
                       <0.55,0.1>,<1.55,0.1>,<1.15,0.4 >,<1.2,0.5>, <1.2, 0.6>,<1.4,0.8>, <1.5,1.1>, <1.55, 1.1>, <1.5, 1.55>, <1.45, 1.8>, <1.4, 2>, <1.4, 2.2>, <1.55, 2.5>
                       //texture{Glass}
                       material {
                           texture {
                            pigment { color rgbf <0.98, 1.0, 0.99, 0.75> }
                               finish { F_Glass4 }
                           }
                             interior { I_Glass caustics 1 }
                           }  
                       
                       }
                             
#declare silver_pawn = difference{
                         cone{<0,      0,0>,pawn_radius*0.8, <0,pawn_height   ,0>,pawn_radius }
                         cone{<0,pawn_radius*.05,0>,pawn_radius*0.5, <0,pawn_height+.1,0>,pawn_radius*.9} 
                         material {
                           texture {
                               pigment { color rgbf <1, 0.0, 0, 0.5> }
                               finish { F_Glass4 }
                           }
                             interior { I_Glass caustics 1 }
                           }
                        }


#declare silver_tower = difference{                                    
                         // Round_Box(A, B, WireRadius, Merge)
                        Round_Box(<0,0,0>,<tower_lado, tower_height ,tower_lado>, 0.007, 0)
                        Round_Box(<tower_interior_a, 0, tower_interior_a>,<tower_interior_b, tower_height*1.1,tower_interior_b>, 0.07, 0)
                         material {
                           texture {
                               pigment { color rgbf <1, 0.0, 0, 0.5> }
                               finish { F_Glass4 }
                           }
                             interior { I_Glass caustics 1 }
                           }

}                                             
#declare silver_king = difference{                                    
                         //<Base_Point>, <Cap_Point>, Radius
                        cylinder{<0,0,0>, <0, king_height, 0>, king_radius}
                          cylinder{<0,king_height*0.1,0>, <0, king_height*1.25, 0>, king_radius*0.95}

                         material {
                           texture {
                               pigment { color rgbf <1, 0.0, 0, 0.5> }
                               finish { F_Glass4 }
                           }
                             interior { I_Glass caustics 1 }
                           }

}
#declare silver_queen =   lathe{ quadratic_spline 6,
                       <0,0>,<0.3,0.0>,<0.05,0.1>,<0.1,0.6 >,<0.1,0.6>, <0.5, 1.1>
                         material {
                           texture {
                               pigment { color rgbf <1, 0.0, 0, 0.5> }
                               finish { F_Glass4 }
                           }
                             interior { I_Glass caustics 1 }
                           }
                       }  
#declare silver_bishop =   lathe{ quadratic_spline 8,
                       <0,0>,<0.15,0.0>,<0.03,0.05>,<0.03,0.15>,<0.1,0.2>,<0.12,0.3 >,<0.15,0.6>, <0.15, 0.7>
                         material {
                           texture {
                               pigment { color rgbf <1, 0.0, 0, 0.5> }
                               finish { F_Glass4 }
                           }
                             interior { I_Glass caustics 1 }
                           }
                       }  
                                                    
#declare silver_knight =   lathe{ quadratic_spline 13,
                       <0.55,0.1>,<1.55,0.1>,<1.15,0.4 >,<1.2,0.5>, <1.2, 0.6>,<1.4,0.8>, <1.5,1.1>, <1.55, 1.1>, <1.5, 1.55>, <1.45, 1.8>, <1.4, 2>, <1.4, 2.2>, <1.55, 2.5>
                       //texture{Glass}
                         material {
                           texture {
                               pigment { color rgbf <1, 0.0, 0, 0.5> }
                               finish { F_Glass4 }
                           }
                             interior { I_Glass caustics 1 }
                           }
                       }
                                                            
/* Horizontal Plane */
plane{ <0,1,0>, -0.012 pigment{ rgb<0.4,0.8,0.4> } }
/* Chess Board */
box{ <9.75,-2,8.25> <-2.25,0.0,-3.75> 
                texture{checker texture {T_Wood4},texture{T_Wood1 } 
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


object{gold_tower translate <-1.875,0, 7.25>} 
object{gold_tower translate <-1.875,0, -3.5>}

object{gold_knight translate <-5.3,0, -5.6> scale<0.3, 0.6, 0.3>}                
object{gold_knight translate <-5.3,0, 20> scale<0.3, 0.6, 0.3>}                
                                                               
                                                               
 
object{gold_bishop scale<2.2, 2.5, 2.2> translate <-1.6, 0, 0>}
object{gold_bishop scale<2.2, 2.5, 2.2> translate <-1.6, 0, 4.5>}


object{gold_king translate <-1.5,0, 1.75>}                
object{gold_queen translate<-1, 0, 2.25> scale<1.4,1.4,1.4> }                     
                     
                     
                     
                     
                     
object{silver_tower translate <8.5,0, 7.25>} 
object{silver_tower translate <8.5,0, -3.5>}

object{silver_knight translate <29,0, -5.6> scale<0.3, 0.6, 0.3>}                
object{silver_knight translate <29,0, 20> scale<0.3, 0.6, 0.3>}                
                                                               
                                                               
 
object{silver_bishop scale<2.2, 2.5, 2.2> translate <8.75, 0, 0>}
object{silver_bishop scale<2.2, 2.5, 2.2> translate <8.75, 0, 4.5>}


object{silver_king translate <8.5,0, 1.75>}                
object{silver_queen translate<6.25, 0, 2.25> scale<1.4,1.4,1.4> }
