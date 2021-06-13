/// @description Insert description here
// You can write your code in this editor
if (!instance_exists(o_Tester)) {
	instance_create_layer(0, 0, "Player_and_Rope", o_Tester);
}
if (!instance_exists(o_Menu)) {
	instance_create_layer(0, 0, "Player_and_Rope", o_Menu);
}

event_inherited();

if (!global.paused) {
	
	xspd = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * walkSpd;
	yspd = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) * walkSpd;
	
	moving = xspd + yspd != 0;
	
	if (xspd != 0 and sign(xspd) != lastx) lastx = sign(xspd);
	if (yspd != 0 and sign(yspd) != lasty) lasty = sign(yspd);
}

scr_Push()