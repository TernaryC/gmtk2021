/// @description Insert description here
// You can write your code in this editor
event_inherited()
draw_self();

if (lastx == -1 and lasty == -1) sprite_index = s_Bot_UL;
if (lastx == -1 and lasty ==  1) sprite_index = s_Bot_DL;
if (lastx ==  1 and lasty == -1) sprite_index = s_Bot_UR;
if (lastx ==  1 and lasty ==  1) sprite_index = s_Bot_DR;