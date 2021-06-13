// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Move(xspd, yspd){
	if !global.paused{
		var block = instance_place(x+xspd,y,o_Wall)
		
		
		if place_meeting(x+xspd,y,o_Wall) or place_meeting(x+xspd,y,o_Pushable){
			while(!place_meeting(x+sign(xspd),y,o_Wall) and !place_meeting(x+xspd,y,o_Pushable)){
				x= x+sign(xspd)
			}
			xspd = 0
		}
		x = x+ xspd
	
		
		if place_meeting(x,y+yspd,o_Wall) or place_meeting(x,y+sign(yspd),o_Pushable) {
	
			while(!place_meeting(x,y+sign(yspd),o_Wall) and !place_meeting(x,y+sign(yspd),o_Pushable)){
				y= y+sign(yspd)
			}
			yspd = 0
		}
	
	y = y+ yspd
	}
}
