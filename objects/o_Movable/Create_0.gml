/// @description Insert description here
// You can write your code in this editor
event_inherited();
baseX = x
baseY = y

additive = 1
if isLeftOrdDown{
	additive = -1
}

self.Move = function(MovableIDEntry) {
	var xspd = 0 
	var yspd = 0
	
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
		adjustAnchors(xspd, yspd);
	}
}

self.MoveBack = function (MovableIDEntry) {
	var xoff = 0;
	var yoff = 0;
	if MovableId == MovableIDEntry {
		if (!isVerticle){
			
			if (baseX != x) {
				x = x-additive;
				xoff = -additive;
				distanceMoved--;
			}
		}
		else{
			
			if (baseY != y) {
				y = y - additive;
				yoff = -additive;
				distanceMoved--;
			}
		}
		adjustAnchors(xoff, yoff);
	}
}

self.adjustAnchors = function (xoff, yoff) {
	print("adjusting")
	var re = instance_find(o_rope_end, 0);
	print(re)
	for (var i = 0; i < global.anchorsLen - 1; i++) {
		print(i)
		var anchor = global.anchors[| i];
		print(anchor.parent)
		print(self)
		if (anchor.parent == self.id) {
			re.adjustAnchor(i, pos(anchor.x + xoff, anchor.y + yoff));
		}
	}
}