//frames = 0; // counter of how many frames have passed since the game began

self.move = function (distance, angle) {
    /// Move player
    
    //movement is done pixel by pixel. This is because even a
    // single pixel of movement can cause the rope to snag or
    // unsnag. Moving more than one pixel at a time causes the
    // rope to get caught inside of blocks and break.
    for (var i = 0; i < distance; i++) {
        
        //position 1 pixel along in movement
        var v = vector(pos(x, y), angle, 1);

        //don't move if the rope would extend past it's length
        if (getLength(anchors_len - 1, pos(v.x, v.y)) < rope_length) {
    		//converts your movement system to my movement system
    		//which will check for collisions
    		scr_Move(v.x-x, v.y-y)
            
            //move the last anchor in the list to the player's
            // new position
            adjustAnchor(anchors_len - 1, pos(x, y));
        } else {
            break;
        }
    }
}

self.getSnag = function (i) {
    /// Get sign value of anchor
    
    //ignore indexes that are out of bounds
    if (i + 1 > anchors_len - 1) return 0;
    if (i < 0) return 0;

    //a is the angle of the next anchor in the list
    var a = anchors[| i + 1].angle;
    
    //returns the sign (+/-) of the difference between
    // the current anchor's angle and the next anchor's angle
    // (this is important for determining if an anchor needs to be
    //  removed from the list due to being unsnagged.)
    return sign(anchors[| i].angle - a);
}

self.recordSnags = function (i) {
    /// Check for unsnagging along rope
    ///  from anchor[i - 1] to anchor[i]
    
    var s = i - 1 > 0 ? i - 1 : 0;
    //s is the first index of the anchors list to check
    // usually it is the previous anchor, but if there isn't
    // one, it defaults to the first anchor
    
    for (var j = s; j < i; j++) {
        var dir = getSnag(j); //sign value of anchor j
        var old = anchors[| j].dir; //last calculated sign value of j

        //if j has not been given a sign value, set it to the
        // newly calculated one (dir)
        //also, do not attempt to delete the first or last anchor
        if (old == 0 || j == 0 || j == anchors_len - 1) anchors[| j].dir = dir;
        else {
            //if j's sign value has changed since it's creation,
            // it needs to be unsnagged and removed
            if (dir != old) {
                removeAnchor(j);
            }
        }
    }
}

self.location = function (i) {
	return pos(anchors[| i].x, anchors[| i].y)
}

self.adjustAnchor = function (i, newpos) {
    /// Move an anchor
    
    //reposition anchor to new position
    anchors[| i].x = newpos.x;
    anchors[| i].y = newpos.y;
    
    //update anchor angle
    realignAnchor(i);
    
    //update angle of previous and next anchors (if they exist)
    if (i > 0) realignAnchor(i - 1);
    if (i < anchors_len - 1) realignAnchor(i + 1);
    
    //check previous rope section for collisions
    findSnags(i);
    //check next rope section for collisions
    if (i < anchors_len - 1) findSnags(i + 1);
    
    //check for unsnagging along previous and next rope section
    recordSnags(i);
}

self.findSnags = function (i) {
    /// Check along rope for collisions
    ///  from anchor[i - 1] to anchor[i]
    
    if (i > 0) {
        
        var anchor = anchors[| i];
        var anchor_prev = anchors[| i - 1];
        
        //length of rope between both anchors
        var length = pos_distance(anchor_prev, anchor);
        
        //angle of rope from anchor_prev to anchor
        var angle = anchor.angle;
        
        //var check = collision_line(anchor_prev.x, anchor_prev.y, anchor.x, anchor.y, o_rope_block, true, true);
        //if (check == noone) return;
        
        //check each pixel along the rope in question for collisions
        for (var l = 1; l < length; l++) {
            //current position on rope to checkk
            var v = vector(anchor_prev, angle, l);
            
            //check for collision at point v
            var b = collision_point(v.x, v.y, o_rope_block, false, true);
            
            if (b != noone) {
                // Collision found
                
                //get coordinates of corner that rope should hook onto
                var cpos = b.getCorner(v);

                //add new anchor at collision
                addAnchor(i, cpos, angle, b);
                break;
            }
        }
    }
}

self.removeAnchor = function (i) {
    /// Remove an anchor from the list
    
    //if it's not in the list, then don't bother
    if (i >= anchors_len || i < 0) return;
    
    //delete anchor from list
    ds_list_delete(anchors, i);
    anchors_len--;
    
    //update the angle of the previous and next anchor
    // (if they exist)
    if (i > 0) realignAnchor(i)
    if (i < anchors_len - 1) realignAnchor(i + 1);
}

self.addAnchor = function (i, _pos, _angle, _parent) {
    /// Add a new anchor to the list
    
    // New anchor object
    var anchor = {
        x : _pos.x,
        y : _pos.y,
        angle : _angle,
        dir : 0,
        parent : _parent
    }
    
    //Add new anchor to list
    ds_list_insert(anchors, i, anchor);
    anchors_len++;
    
    //Update the angle of the next anchor in the list
    if (i <= anchors_len - 1) realignAnchor(i + 1);
}

self.realignAnchor = function (i) {
    /// Update anchor[i]'s angle
    
    //don't bother if it doesn't have a previous or next anchor
    if (i - 1 < 0 or i >= anchors_len) return;
    
    var oldangle = anchors[| i].angle; //previous angle
    
    //potential new angles
    var newangles = [0, 0, 0];
    newangles[0] = angle_from(anchors[| i - 1], anchors[| i]);
    newangles[1] = newangles[0] - two_pi;
    newangles[2] = newangles[0] + two_pi;
    // newangles[0] is the angle from the previous anchor to the
    //  current one
    // newangles[1] and [2] are the same angle but +/- two_pi
    //  This is important to prevent the pi boundry (see below)
    
    
    /* Find the angle closest to the old angle, and use that one */
    
    //default to using angle 0
    // (this variable stores which angle has the smallest calculated difference)
    var least = newangles[0];
    
    //difference between old angle and angle 0
    // (this variable stores the smallest difference calculated so far)
    var record = abs(oldangle - newangles[0]);
    
    for (var j = 1; j <= 2; j++) {
        //check other angles (1 and 2) to see if they are better
        
        //difference between old angle and angle j
        var test = abs(oldangle - newangles[j])
        if (test < record) {
            //angle j is closer to the original angle
            least = newangles[j];
            record = test;
        }
    }
    
    //This whole mess of finding the closest angle to the current
    // one is to prevent the pi boundry, which causes the rope
    // to delete anchors and behave unpredictably when an anchor's
    // angle passes +/-pi
    //I can't fully explain why this is neccessary, but it is.
    
    /**/
    
    //update angle
    anchors[| i].angle = least;
}

self.getLength = function (ai, testpos) {
    /// Return length of rope if an anchor was to move to the position
    ///  testpos. This is important for figuring out if a movement of
    ///  an anchor will overextend the rope.
    
    var length = 0;
    for (var i = 0; i < anchors_len - 1; i++) {
        var pos1 = ai == i ? testpos : anchors[| i];
        var pos2 = ai == i + 1 ? testpos : anchors[| i + 1];
        length += pos_distance(pos1, pos2);
    }
    return length;
}


//list of anchors along chain
anchors = ds_list_create();
var rs = instance_find(o_rope_start, 0);
anchors_len = 0; //length of anchors list

// Create first and last anchors
addAnchor(0, pos(x, y), 0, o_rope_start);
addAnchor(1, pos(rs.x, rs.y), 0, o_rope_end);
//the first anchor is always the o_rope_start object
//the last anchor is always the o_rope_end object

init = false;

