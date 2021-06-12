/// @description Insert description here
// You can write your code in this editor

xspd = (keyboard_check(ord("D"))- keyboard_check(ord("A"))) * walkSpd;
yspd = (keyboard_check(ord("S"))- keyboard_check(ord("W"))) * walkSpd;

scr_Move(xspd, yspd)
scr_Push()
/*
if place_meeting(x+xspd,y,o_Pushable){
	var block = instance_place(x+xspd,y,o_Pushable)
	xspd =  xspd/2
	block.x = block.x +xspd
	if place_meeting(block.x+xspd,block.y,o_Wall){
		show_debug_message("butts")
		while(!place_meeting(block.x+xspd,block.y,o_Wall)){
			block.x= block.x+sign(xspd)
			x= x+sign(xspd)
	}
	
}
if place_meeting(x,y+yspd,o_Pushable){
	var block = instance_place(x,y+yspd,o_Pushable)
	yspd =  yspd/2

	block.y = block.y +yspd
	
	}
}
*/

