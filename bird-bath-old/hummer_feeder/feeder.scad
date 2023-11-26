$fn=96;

//Top vars
top_dia = 120;
top_height_min = 2.2;
top_height_max = 15.8;
top_height_center = 4.6-top_height_min;

top_center_hole_dia = 31.6;
top_center_indent_dia = 51.4;
top_center_indent_height = 13.2;

top_inside_lip_height = 5.5-3.1;
top_inside_lip_width = 2.4;
top_inside_lip_outer_dia = 32.4;
top_inside_lip_inner_dia = 27.6;

top_center_cone_height = 13.3;
top_center_cone_max_dia = 74.5;
top_center_cone_min_dia = 51.1;

top_outside_lip_height = 5.3;
top_outside_lip_outer_dia = 108.4;
top_outside_lip_width = 2.2;
top_outside_lip_inner_dia = top_outside_lip_outer_dia-2.5;

sip_hole_outer_dia = 6;
sip_hole_height = 5.3;
sip_hole_inner_dia = 3.8;


//Bottom vars


module top()
{
  difference()
  {
    union()
    {

      cylinder( h = top_height_min, d = top_dia, center = true);
      
      
      //Outer lip
      translate([0, 0, top_height_min])
        cylinder(h = top_outside_lip_height, d = top_outside_lip_outer_dia, center = true);
//Sip holes
    //translate([0, 0, -top_height_min/2+sip_hole_height/2-.2])
      //make_ring_of(radius = 97.6/2, count = 8)
        //difference() {
          //sip_hole();
              //cylinder(h = sip_hole_height, d = sip_hole_outer_dia, center = true);
    //cylinder( h = sip_hole_height, d = sip_hole_inner_dia, center = true);
        //}
      
      
    }
     //Center bevel
    translate([ 0, 0, top_height_min-1 ])
    #cylinder( h = 8.8-4.4+2.3, d1 = 74.6, d2 = 56.8, center = true );

    //Outer lip
    translate([0, 0, top_height_min])
      cylinder(h = top_outside_lip_height, d = top_outside_lip_inner_dia, center = true);
//Sip holes
    translate([0, 0, -top_height_min/2+sip_hole_height/2-.2])
      make_ring_of(radius = 97.6/2, count = 8)
        //difference() {
          //sip_hole();
          //    cylinder(h = sip_hole_height, d = sip_hole_outer_dia, center = true);
    cylinder( h = sip_hole_height, d = sip_hole_inner_dia, center = true);
        //}

      //Center hole
    translate([0, 0, top_height_max/2-top_height_min-1])  
    cylinder(h=top_height_max+top_height_min*2, d = top_center_hole_dia, center =true);
      translate([0, 0, top_height_max/2])
        cylinder(h = top_center_indent_height, d = top_center_indent_dia, center = true);
  


    }
  
  

  //Center
  difference()
  {
    union()
    {
      translate([ 0, 0, top_height_min/2+top_center_cone_height/2])
        cylinder(h = top_center_cone_height, d1 = top_center_cone_max_dia, d2 = top_center_cone_min_dia, center = true);
     translate([0, 0, -top_height_min])
        cylinder(h = 2.3, d = 57.4, center = true);
    } 
      
            //Center bevel
    translate([ 0, 0, top_height_min-1 ])
    #cylinder( h = 8.8-4.4, d1 = 74.6, d2 = 56.8, center = true );
    
      //Center hole
    translate([0, 0, top_height_max/2-top_height_min-1])  
    cylinder(h=top_height_max+top_height_min*2, d = top_center_hole_dia, center =true);
      translate([0, 0, top_height_max/2])
        cylinder(h = top_center_indent_height, d = top_center_indent_dia, center = true); 
  

  
    //Center bevel
    //translate([ 0, 0, top_height_min ])
    //cylinder( h = 8.8-4.4+2.3, d1 = 74.6, d2 = 56.8, center = true );

  }

        
//Inside Lip
    
    translate([ 0, 0, top_height_min/2 ]){
difference(){
  union(){
  cylinder(h = top_inside_lip_height, d = top_inside_lip_outer_dia, center = true);
}          
cylinder(h = top_inside_lip_height, d = top_inside_lip_inner_dia, center = true);
 }     
    }
 
//Sip holes
    translate([0, 0, -top_height_min/2+sip_hole_height/2-.2])
      make_ring_of(radius = 97.6/2, count = 8)
        difference() {
          //sip_hole();
            cylinder(h = sip_hole_height, d = sip_hole_outer_dia, center = true);
    cylinder( h = sip_hole_height, d = sip_hole_inner_dia, center = true);
          }
          
    

}

module bottom()
{
  
}

module sip_hole()
{
  difference()
  {
    cylinder(h = sip_hole_height, d = sip_hole_outer_dia, center = true);
    cylinder( h = sip_hole_height, d = sip_hole_inner_dia, center = true);
  }
}

module make_ring_of(radius, count)
{
    for (a = [0 : count - 1]) {
        angle = a * 360 / count;
        translate(radius * [sin(angle), -cos(angle), 0])
            rotate([0, 0, angle])
                children();
    }
}

top();
//bottom();
//sip_hole();