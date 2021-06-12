/// @description Insert description here
// You can write your code in this editor
baseX = x
baseY = y
function Move(MovableIDEntry) {
	//show_debug_message(MovableId == MovableIDEntry)
	show_debug_message("control:" + string(MovableIDEntry))
	show_debug_message("my id:" + string(MovableId))
	show_debug_message("///")
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
					
					scr_Move(yspd,0)
					distanceMoved++;
				}
		}
	}
}
function MoveBack(MovableIDEntry) {
	if MovableId == MovableIDEntry {
		if (!isVerticle){
			
			if (baseX != x) {
				xspd = -additive
				
				scr_Move(xspd,0)
				distanceMoved--;
			}
		}
		else{
			if (baseY != y) {
				yspd = -additive
				
				scr_Move(0,yspd)
				distanceMoved--;
			}
		}
	}
}