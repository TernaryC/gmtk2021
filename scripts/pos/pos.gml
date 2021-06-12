function pos (_x, _y) {
    /// Given an x and y value, return a struct that contains those
    ///  values assigned with the names "x" and "y".
    ///  This is for convenience throughout the code.
    
    return { x : _x, y : _y };
}

function angle_from (pos1, pos2) {
    /// Calculate angle from pos1 to pos2 in radians
    
    return arctan2(pos2.y - pos1.y, pos2.x - pos1.x);
}

function vector (_pos, angle, len) {
    /// Given a position, an angle, and a length, calculate
    ///  polar coordinates
    ///  (i.e. the point that is "len" units away from "_pos" at "angle" degrees)
    
    /// (I'm aware this is a misnomer. It should probably be called
    ///  polar() but I wrote this in the thick of rope confusion)
    
    var vx = _pos.x + cos(angle) * len;
    var vy = _pos.y + sin(angle) * len;
    return pos(vx, vy);
}

function pos_distance (pos1, pos2) {
    /// Given two positions, calculate the distance between them
    ///  This is a convenience function more than anything.
    return point_distance(pos1.x, pos1.y, pos2.x, pos2.y);
}

function wrap (val, low, high) {
    /// Given a value and an upper and lower bound, ensure that it
    ///  remains within those bounds, and if it exceeds them, make
    ///  the value "wrap around"
    ///  (i.e. circles around from high to low, or low to high)
    
    /// Useful for keeping an angle within a certain 360 degree
    ///  range
    
    while (val < low)  val += high;
    while (val >= high) val -= high;
    return val;
}