/// @description Insert description here
// You can write your code in this editor
event_inherited();
baseX = x
baseY = y
function Move(MovableIDEntry) {
	

	additive = 1
	xspd = 0 
	yspd = 0
	if isLeftOrdDown{
		additive = -1
	}
	
	if MovableId == MovableIDEntry {
		if distanceMoved< distanceMax{
				if (!isVerticle){
					
					xspd = additive 
					
					scr_Move(xspd,0)
					distanceMoved++;
				}
				else{
					yspd = additive;
					
					scr_Move(0,yspd)
					distanceMoved++;
				}
		}
	}
}
function MoveBack(MovableIDEntry) {
	if MovableId == MovableIDEntry {
		if (!isVerticle){
			
			if (baseX != x) {
				
				x= x-additive;
				distanceMoved--;
			}
		}
		else{
			
			if (baseY != y) {
				y= y-additive;
				distanceMoved--;
			}
		}
	}
}