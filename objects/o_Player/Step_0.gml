/// @description Insert description here
// You can write your code in this editor

xspd = (keyboard_check(ord("D"))- keyboard_check(ord("A"))) * walkSpd;
yspd = (keyboard_check(ord("S"))- keyboard_check(ord("W"))) * walkSpd;

if place_meeting(x+xspd,y,o_Wall){
	while(!place_meeting(x+sign(xspd),y,o_Wall)){
		x= x+sign(xspd)
	}
	xspd = 0
}

if place_meeting(x,y+yspd,o_Wall){
	while(!place_meeting(x,y+sign(yspd),o_Wall)){
		y= y+sign(yspd)
	}
	yspd = 0
}

x = x+xspd
y = y+yspd