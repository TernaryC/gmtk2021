/// @description Insert description here
// You can write your code in this editor

function Move(MovableIDEntry) {
	isDown = true
	layer_sprite_change(self, s_wallDown)
}
function MoveBack(MovableIDEntry) {
	isDown = false
	layer_sprite_change(self, s_WallUp)
}