/// @description Insert description here
// You can write your code in this editor
event_inherited();
baseX = x
baseY = y
xspd = 0
yspd = 0
additive = 2
if isLeftOrdDown{
	additive = -2
}

self.Move = function(MovableIDEntry) {
	xspd = 0
	yspd = 0

	var moved = false;
	if MovableId == MovableIDEntry {
		if distanceMoved< distanceMax{
				if (!isVerticle){
					xspd = additive
					if (!place_meeting(x + xspd, y, o_Player)) {
						scr_Push()
						scr_Move(xspd,0)
						distanceMoved += 2;
						moved = true;
					}
				} else {
					yspd = additive;
					if (!place_meeting(x, y + yspd, o_Player)) {
						scr_Push()
						scr_Move(0,yspd)
						distanceMoved += 2;
						moved = true;
					}
				}
		}
		if (moved) {
			adjustAnchors(xspd, yspd);
			checkAnchors(x, y);
		}
	}
}

self.MoveBack = function (MovableIDEntry) {
	var xoff = 0;
	var yoff = 0;
	var moved = false;
	if MovableId == MovableIDEntry {
		if (!isVerticle){
			if (distanceMoved >= 0) {
				if (!place_meeting(x - additive, y, o_Player)) {
					x = x-additive;
					xoff = -additive;
					distanceMoved -= 2;
					moved = true;
				}
			}
		}
		else{
			if (distanceMoved >= 0) {
				if (!place_meeting(x, y - additive, o_Player)) {
					y = y - additive;
					yoff = -additive;
					distanceMoved -= 2;
					moved = true
				}
			}
		}
		if (moved) {
			adjustAnchors(xoff, yoff);
			checkAnchors(x, y);
		}
	}
}

self.adjustAnchors = function (xoff, yoff) {
	//print("adjusting")
	var re = instance_find(o_rope_end, 0);
	if (re != undefined) {
		//print(re)
		for (var i = 0; i < re.anchors_len - 1; i++) {
			//print(i)
			var anchor = re.anchors[| i];
			//print(anchor.parent)
			//print(self)
			if (anchor.parent == self.id) {
				re.adjustAnchor(i, pos(anchor.x + xoff, anchor.y + yoff));
			}
		}
	}
}

self.checkAnchors = function (_x, _y) {
	var re = instance_find(o_rope_end, 0);
	if (re != undefined) {
		for (var i = 0; i < re.anchors_len - 1; i++) {
			var anchor = re.anchors[| i];
			var next = re.anchors[| i + 1];
			if (collision_line(anchor.x, anchor.y, next.x, next.y, self, false, false)) {
				re.adjustAnchor(i, re.location(i))
			}
		}
	}
}
