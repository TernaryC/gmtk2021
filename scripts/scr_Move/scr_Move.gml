// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Move(xspd, yspd){
	var block = instance_place(x+xspd,y,o_Wall)
	if place_meeting(x+xspd,y,o_Wall) and !o_Wall.isDown{
		while(!place_meeting(x+sign(xspd),y,o_Wall)){
			x= x+sign(xspd)
		}
		xspd = 0
	}
x = x+ xspd
var block = instance_place(x+xspd,y,o_Wall)
if place_meeting(x,y+yspd,o_Wall) and !o_Wall.isDown{
	
	while(!place_meeting(x,y+sign(yspd),o_Wall)){
		y= y+sign(yspd)
	}
	yspd = 0
	}
	
y = y+ yspd
}
