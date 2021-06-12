/// @description Insert description here
// You can write your code in this editor
function Move(MovableIDEntry) {
	//show_debug_message(MovableId == MovableIDEntry)
	show_debug_message(MovableIDEntry)
	show_debug_message(MovableId)
	if MovableId == MovableIDEntry {
		
		if distanceMoved< distanceMax{
				if (!isVerticle){
					
					x = x+1;	
					distanceMoved++;
				}
				else{
					y = y+1;	
					distanceMoved++;
				}
		}
		
	}
}
function MoveBack(MovableIDEntry) {
	if MovableId == MovableIDEntry {
		if (!isVerticle){
			
			if (distanceMoved > 0) {
				x--;
				distanceMoved--;
			}
		}
		else{
			if (distanceMoved > 0) {
				y--;
				distanceMoved--;
			}
		}
	}
}