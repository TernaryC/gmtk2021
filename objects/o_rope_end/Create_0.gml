
self.move = function (_x, _y) {
    x += _x;
    y += _y;
    adjustAnchor(anchors_len - 1, pos(x, y));
}

self.adjustAnchor = function (i, newpos) {
    anchors[| i].x = newpos.x;
    anchors[| i].y = newpos.y;
    realignAnchor(i);
    if (i != 0) realignAnchor(i - 1);
    if (i != anchors_len - 1) realignAnchor(i + 1);
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

