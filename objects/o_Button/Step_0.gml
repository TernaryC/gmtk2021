/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,o_Player){
	if distanceMoved< distanceMax{
		o_Movable.x = o_Movable.x+1;	
		distanceMoved++;
	}
} else {
	if (distanceMoved > 0) {
		o_Movable.x--;
		distanceMoved--;
	}
}