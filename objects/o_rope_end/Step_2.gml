/* Keeping anchors[0] synced up with the start of the rope */

var rs = instance_find(o_rope_start, 0); //location of rope start
var _pos = rs.getStart()

//if the o_rope_start object has moved, adjust it's anchor
if (_pos.x != anchors[| 0].x or _pos.y != anchors[| 0].y) 
    adjustAnchor(0, _pos);
    
/**/

