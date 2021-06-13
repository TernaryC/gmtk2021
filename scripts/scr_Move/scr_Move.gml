// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Move(xspd, yspd){
	if !global.paused{
		
		if place_meeting(x+xspd,y,o_Wall) or place_meeting(x+xspd,y,o_Pushable) //or place_meeting(x,y+yspd,o_bottomless)
		{
			while !place_meeting(x+sign(xspd),y,o_Wall) and !place_meeting(x+sign(xspd),y,o_Pushable) //and !place_meeting(x+sign(xspd),y,o_bottomless))
			{
				x = x+sign(xspd)
			}
			xspd = 0
		}
		x = x+ xspd
	
		
		if place_meeting(x,y+yspd,o_Wall) or place_meeting(x,y+yspd,o_Pushable) //or place_meeting(x,y+yspd,o_bottomless)
		{
	
			while !place_meeting(x,y+sign(yspd),o_Wall) and !place_meeting(x,y+sign(yspd),o_Pushable) //and !place_meeting(x,y+sign(yspd),o_bottomless))
			{
				y= y+sign(yspd)
			}
			yspd = 0
		}
	
		y = y+ yspd
	}
}
