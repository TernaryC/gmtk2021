/// @description Insert description here
// You can write your code in this editor

if place_meeting(x,y,o_Player){
	for (var i = 0; i < instance_number(o_Movable); i++) {
		var block = instance_find(o_Movable, i);
		block.Move(controls)
	}
} else {
	o_Movable.MoveBack(controls)
}