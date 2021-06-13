/// @description Insert description here
// You can write your code in this editor
event_inherited();
baseX = x
baseY = y

distanceMoved = 0;

additive = 1
if isLeftOrUp{
	additive = -1
}

self.Move = function(MovableIDEntry) {
	var xspd = 0 
	var yspd = 0
	
	var moved = false;
	if MovableId == MovableIDEntry {
		if distanceMoved< distanceMax{
				if (!isVerticle){
					
					xspd = additive 
					
					if (!place_meeting(x + xspd, y, o_Player)) {
						scr_Move(xspd,0)
						distanceMoved++;
						moved = true;
					}
				}
				else{
					yspd = additive;
					
					if (!place_meeting(x, y + yspd, o_Player)) {
						scr_Move(0,yspd)
						distanceMoved++;
						moved = true;
					}
				}
		}
		if (moved) {
			if (!audio_is_playing(sfx_moveBig_loop)) {
				audio_play_sound(sfx_moveBig_loop, 0.5, true);
			}
			adjustAnchors(xspd, yspd);
			checkAnchors(x, y);
		} else {
			if (audio_is_playing(sfx_moveBig_loop)) {
				audio_stop_sound(sfx_moveBig_loop)
				audio_play_sound(sfx_moveBig_end, 0.5, false);
			}
		}
	}
}

self.MoveBack = function (MovableIDEntry) {
	var xoff = 0;
	var yoff = 0;
	var moved = false;
	if MovableId == MovableIDEntry {
		if (!isVerticle){
			
			if (baseX != x) {
				if (!place_meeting(x - additive, y, o_Player)) {
					x = x-additive;
					xoff = -additive;
					distanceMoved--;
					moved = true;
				}
			}
		}
		else{
			
			if (baseY != y) {
				if (!place_meeting(x, y - additive, o_Player)) {
					y = y - additive;
					yoff = -additive;
					distanceMoved--;
					moved = true
				}
			}
		}
		
		//I basically spammed audio_sound_gain calls here
		// (for the sfx_moveBig_loop sound)
		//because it wasn't working with just one.
		//This, for some reason works, and so it shall stay.
		
		audio_sound_gain(sfx_moveBig_loop, 0.5, 0);
		if (moved) {
			audio_sound_gain(sfx_moveBig_loop, 0.5, 0);
			if (!audio_is_playing(sfx_moveBig_loop)) {
				audio_play_sound(sfx_moveBig_loop, 0.5, true);
				audio_sound_gain(sfx_moveBig_loop, 0.5, 0);
			}
			audio_sound_gain(sfx_moveBig_loop, 0.5, 0);
			adjustAnchors(xoff, yoff);
			checkAnchors(x, y);
		} else {
			audio_sound_gain(sfx_moveBig_loop, 0.5, 0);
			audio_sound_gain(sfx_moveBig_end, 0.5, 0);
			if (audio_is_playing(sfx_moveBig_loop)) {
				audio_stop_sound(sfx_moveBig_loop)
				audio_play_sound(sfx_moveBig_end, 0.5, false);
			}
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

