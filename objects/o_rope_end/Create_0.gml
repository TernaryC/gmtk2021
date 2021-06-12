
self.move = function (distance, angle) {
    //print("MOVING", distance, angle)
    //print("POSITION", x, y)
    for (var i = 0; i < distance; i++) {
        var v = vector(pos(x, y), angle, 1);
        //print("STEP", v.x, v.y)
        x = v.x;
        y = v.y;
        adjustAnchor(anchors_len - 1, pos(x, y));
    }
}

self.adjustAnchor = function (i, newpos) {
    var oldpos = repos(anchors[| i]);
    
    anchors[| i].x = newpos.x;
    anchors[| i].y = newpos.y;
    realignAnchor(i);
    if (i > 0) realignAnchor(i - 1);
    if (i < anchors_len - 1) realignAnchor(i + 1);
    
    //check previous rope for collisions
    findSnags(i);
}

self.findSnags = function (i) {
    if (i > 0) {
        var anchor = anchors[| i];
        var anchor_prev = anchors[| i - 1];
        var length = pos_distance(anchor_prev, anchor);
        var angle = angle_from(anchor_prev, anchor);
        for (var l = 0; l < length; l++) {
            var v = vector(anchor_prev, angle, l);
            //draw_set_color(c_lime);
            //draw_circle(v.x, v.y, 2, true);
            var b = collision_point(v.x, v.y, o_rope_block, false, true);
            if (b != noone) {
                //draw_circle(v.x, v.y, 4, false);
                //var cpos = b.getCorner(v);
                //addAnchor(i, cpos);
                break;
            }
        }
    }
}

self.addAnchor = function (i, _pos) {
    var _angle;
    if (i != 0)
        _angle = angle_from(anchors[| i - 1], _pos);
    else
        _angle = 0;
    var anchor = {
        x : _pos.x,
        y : _pos.y,
        angle : _angle
    }
    ds_list_insert(anchors, i, anchor);
    if (i <= anchors_len - 1) realignAnchor(i + 1);
    anchors_len++;
}

self.realignAnchor = function (i) {
    if (i - 1 < 0 or i >= anchors_len) return;
    var _angle = angle_from(anchors[| i - 1], anchors[| i]);
    anchors[| i].angle = _angle;
}

//list of anchors along chain
anchors = ds_list_create();
var rs = instance_find(o_rope_start, 0);
anchors_len = 0;
addAnchor(0, pos(x, y));
addAnchor(1, pos(rs.x, rs.y));
//the first anchor is always the o_rope_start object
//the last anchor is always the o_rope_end object

