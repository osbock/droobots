//droolop bot

module battery_2032(h_expand = 0, v_expand =0){
    $fn=60;
    color("red")
    cylinder(r=10+h_expand, h= 3.2 +v_expand);
}

module bot_body(){
    difference(){
        union(){
            cylinder(r=12,h=4);
            translate([0,-12,0])cube([30,24,4]);
            translate([30,0,0])cylinder(r=12,h=4);
            //drooloop legs
            for(legx =[-4:4:32]){
                translate([legx,-35,0])cube([2,24,1]);
                translate([legx,11,0])cube([2,24,1]);
            }
         }
         //subtract the battery
        translate([15,0,1])battery_2032(v_expand=5,h_expand = .1);
         // a little notch for wires
         translate([0,-2,1])cube([6,4,4]);
    }
}

translate([0,0,10])bot_body();
//support
for(supx = [-12:4:42]){
    translate([supx,-12,0])cube([.6,24,9.6]);
}
translate([-12,-12,0])cube([54,24,.4]);