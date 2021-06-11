
anchors = ds_list_create();
ds_list_add(anchors, pos(x, y));
ds_list_add(anchors, pos(x, y));

sensors = ds_list_create();

self.move = function (_x, _y) {
    x += _x;
    y += _y;
    adjustAnchor(ds_list_size(anchors) - 1, pos(_x, _y))
}

self.adjustAnchor = function (ai, change) {
    var old = anchors[| ai];
    
    var npos = pos(old.x + change.x, old.y + change.y)
    ds_list_replace(anchors, ai, npos);
    
    var prev = ai >= 1 ? ai - 1 : -1;
    var next = ai < ds_list_size(anchors) ? ai + 1 : -1;
    
    if (prev != -1) {
        //check for collisions in previous link
    }
    if (next != -1) {
        //check for collisions in following link
    }
}