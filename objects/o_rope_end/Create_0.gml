
//list of anchors along chain
anchors = ds_list_create();
ds_list_add(anchors, pos(x, y));
ds_list_add(anchors, pos(x, y));
//the first anchor is always the o_rope_start object
//the last anchor is always the o_rope_end object

sensors = ds_list_create();

self.move = function (_x, _y) {
    x += _x;
    y += _y;
    //move anchor (self) to new location
    adjustAnchor(ds_list_size(anchors) - 1, pos(x, y))
}

self.adjustAnchor = function (ai, npos) {
    //An anchor has moved!
    
    var old = anchors[| ai]; //anchor original position
    
    //anchor new position
    ds_list_replace(anchors, ai, npos);
    
    //positions of previous and next anchors in chain
    var prev = ai >= 1 ? ai - 1 : -1;
    var next = ai < ds_list_size(anchors) ? ai + 1 : -1;
    
    if (prev != -1) {
        //check for collisions along previous link
        ropeCollide(anchors[| prev], npos, old);
    }
    if (next != -1) {
        //check for collisions along following link
        ropeCollide(anchors[| next], npos, old);
    }
}

self.ropeCollide = function (anchor, newpos, oldpos) {
    
}