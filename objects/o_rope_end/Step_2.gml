/* Keeping anchors[0] synced up with the start of the rope */

var rs = instance_find(o_rope_start, 0); //location of rope start

//if the o_rope_start object has moved, adjust it's anchor
if (rs.x != anchors[| 0].x or rs.y != anchors[| 0].y) 
    adjustAnchor(0, pos(rs.x, rs.y));
    
/**/