function pos (_x, _y) {
    return { x : _x, y : _y };
}

function ang (p1, p2) {
    var len = point_distance(p1.x, p1.y, p2.x, p2.y);
    var a   = point_direction(p1.x, p1.y, p2.x, p2.y);
    a = degtorad(a);
    return {length : len, angle : a}
}

function angpos (p, a, l) {
    var _x = p.x + cos(a) * l
    var _y = p.y + sin(a) * l
    return pos(_x, _y);
}

function posang (a, o) {
    return degtorad(point_direction(a.x, a.y, o.x, o.y));
}