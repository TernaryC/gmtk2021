// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Push(){
	if (place_meeting(x+xspd, y , o_Pushable)){
		var block = instance_place(x+xspd,y,o_Pushable)
		with(block){
				scr_Move(o_Player.xspd,0)
		}
		xspd = xspd/2
	}
	if (place_meeting(x, y+yspd , o_Pushable)){
		var block = instance_place(x,y+yspd,o_Pushable)
		with(block){
				scr_Move(0,o_Player.yspd)
		}
		yspd = yspd/2
	}
}