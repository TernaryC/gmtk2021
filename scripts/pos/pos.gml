function pos (_x, _y) {
    return { x : _x, y : _y };
}

function angle_from (pos1, pos2) {
    return arctan2(pos2.y - pos1.y, pos2.x - pos1.x);
}

function vector (_pos, angle, len) {
    var vx = _pos.x + cos(angle) * len;
    var vy = _pos.y + sin(angle) * len;
    return pos(vx, vy);
}

function repos (_pos) {
    return pos(_pos.x, _pos.y);
}

function pos_distance (pos1, pos2) {
    return point_distance(pos1.x, pos1.y, pos2.x, pos2.y);
}