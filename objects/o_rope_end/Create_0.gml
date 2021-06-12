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

        x = v.x;
        y = v.y;
        //move the last anchor in the list to the player's
        // new position
        adjustAnchor(anchors_len - 1, pos(x, y));
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
        if (old == 0) anchors[| j].dir = dir;
        else {
            //if j's sign value has changed since it's creation,
            // it needs to be unsnagged and removed
            if (dir != old) {
                removeAnchor(j);
            }
        }
    }
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
        
        /* Botched optimization. WIP */
        var cv = vector(anchor_prev, angle, length);
        var check = collision_line(anchor_prev.x, anchor_prev.y, cv.x, cv.y, o_rope_block, false, true);
        //if (check == noone) return;
        /**/

        //check each pixel along the rope in question for
        // collisions
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
                addAnchor(i, cpos, angle);
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

self.addAnchor = function (i, _pos, _angle) {
    /// Add a new anchor to the list
    
    if (_angle == undefined) _angle = 0 //default angle to 0
    if (_angle == 0 and i != 0) {
        //get angle from last anchor to new anchor
        //ONLY DO THIS IF _angle WAS NOT SUPPLIED
        //(this may not be neccessary code)
        _angle = angle_from(anchors[| i - 1], _pos);
    }
    
    // New anchor object
    var anchor = {
        x : _pos.x,
        y : _pos.y,
        angle : _angle,
        dir : 0
    }
    
    //Add new anchor to list
    ds_list_insert(anchors, i, anchor);
    anchors_len++;
    
    //Update the following anchor in the list's angle
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
    //newangles[0] is the angle from the previous anchor to this one
    //newangles[1] and [2] are the same angle but +/- two_pi
    
    
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
    
    //^^ This is to prevent the pi boundry, which causes the rope
    // to delete anchors and behave unpredictably when a rope's
    // angle passes +/- pi
    
    /**/
    
    //update angle
    anchors[| i].angle = least;
}


//list of anchors along chain
anchors = ds_list_create();
var rs = instance_find(o_rope_start, 0);
anchors_len = 0; //length of anchors list
addAnchor(0, pos(x, y), 0);
addAnchor(1, pos(rs.x, rs.y), 0);
//the first anchor is always the o_rope_start object
//the last anchor is always the o_rope_end object

init = false;

