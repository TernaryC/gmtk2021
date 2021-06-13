/// @description Insert description here
// You can write your code in this editor
if (!global.Dead)
	image_speed = moving ? 1 : 0;
else image_speed = 1;

var plugcheck = place_meeting(x, y, o_rope_start)
if (lasty == -1 && !plugcheck) draw_self()
event_inherited()
if (lasty == 1 || plugcheck) draw_self()

if (!global.Dead) {
	if (lastx == -1 and lasty == -1) sprite_index = s_Bot_UL;
	if (lastx == -1 and lasty ==  1) sprite_index = s_Bot_DL;
	if (lastx ==  1 and lasty == -1) sprite_index = s_Bot_UR;
	if (lastx ==  1 and lasty ==  1) sprite_index = s_Bot_DR;
} else {
	if (!dying) {
		sprite_index = s_Bot_Die;
		dying = true;
	}
}