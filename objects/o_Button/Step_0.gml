/// @description Insert description here
// You can write your code in this editor

var box = false;
for (var i = 0; i < instance_number(o_Pushable); i++) {
	var ps = instance_find(o_Pushable, i);
	if (ps.buttonCheck(self)) {
		box = true
		break
	}
}

if (place_meeting(x,y,o_Player) or box or (switched and permanent)) {
	if (!switched) audio_play_sound(sfx_press, 1, false);
	switched = true;
	for (var i = 0; i < instance_number(o_Movable); i++) {
		var block = instance_find(o_Movable, i);
		block.Move(controls)
	}
} else if (!permanent) {
	if (switched) audio_play_sound(sfx_unpress, 1, false);
	switched = false;
	for (var i = 0; i < instance_number(o_Movable); i++) {
		var block = instance_find(o_Movable, i);
		block.MoveBack(controls)
	}
}