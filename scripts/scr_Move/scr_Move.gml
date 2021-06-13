// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Move(xspd, yspd, call){
	if (!global.Dead and call == o_Player) || (!global.paused and call == o_Movable) {
		var block = instance_place(x+xspd,y,o_Wall)
		var re = instance_find(o_rope_end, 0)
		for (var i = 0; i < re.anchors_len - 1; i++) {
			//print("BUTTS")
			var block = instance_find(re.anchors, i);
			if place_meeting(re.anchors[| i].x, re.anchors[| i].y, o_Movable){
				//print("BUTTS2")
			}
		}
		
		if place_meeting(x+xspd,y,o_Wall) {
			while(!place_meeting(x+sign(xspd),y,o_Wall)){
				x= x+sign(xspd)
			}
			xspd = 0
		}
		if (call == o_Player) {
			if place_meeting(x+xspd,y,o_bottomless) {
				while(!place_meeting(x+sign(xspd),y,o_bottomless)){
					x= x+sign(xspd)
				}
				xspd = 0
			}
		}
		x = x+ xspd
	
		if place_meeting(x,y+yspd,o_Wall) {
			while(!place_meeting(x,y+sign(yspd),o_Wall)) {
				y= y+sign(yspd)
			}
			yspd = 0
		}
		if (call == o_Player) {
			if place_meeting(x,y+yspd,o_bottomless) {
				while(!place_meeting(x,y+sign(yspd),o_bottomless)) {
					y= y+sign(yspd)
				}
				yspd = 0
			}
		}
	
		y = y+ yspd
	}
}
