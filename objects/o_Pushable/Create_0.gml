/// @description Insert description here
// You can write your code in this editor
lastx = x;
lasty = y;

self.buttonCheck = function (button) {
    var left   = x - sprite_width / 2;
    var right  = x + sprite_width / 2;
    var bottom = y + sprite_height / 2;
    var h = sprite_height - 32;
    return collision_rectangle(left, bottom - h, right, bottom, button, false, true) != noone
}