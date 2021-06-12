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