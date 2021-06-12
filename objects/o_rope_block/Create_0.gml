print("what")
self.getCorner = function (_pos) {
    print("corner time")
    var me = pos(x, y);
    var limit = pos(x + sprite_width / 2, y + sprite_height / 2);
    var corner = angle_from(me, limit);
    var cornlength = pos_distance(me, limit);
    print(me, limit, corner, cornlength)
    
    var angle = angle_from(me, _pos);
    var rounded = half_pi * floor(angle / half_pi);
    
    if (rounded == RIGHT || rounded == LEFT)
        rounded += corner;
    else if (rounded == DOWN || rounded == UP) 
        rounded += half_pi - corner;
    
    print(rounded)
    print("done")
    return vector(me, rounded, cornlength);
}