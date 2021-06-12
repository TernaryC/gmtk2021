self.getCorner = function (_pos) {
    //print("corner time")
    var me = pos(x, y);
    var limit = pos(x + sprite_width / 2, y + sprite_height / 2);
    var corner = angle_from(me, limit);
    var cornlength = pos_distance(me, limit) + 5;
    //print("me/limt:", me, limit)
    //print("corndat:", corner, cornlength)
    
    //print(_pos)
    
    var angle = angle_from(me, _pos)
    //print("angle:", angle);
    angle = wrap(angle, 0, 2*pi);
    //print(angle);
    
    var rounded = half_pi * floor(angle / half_pi);
    
    //print("round", rounded)
    if (rounded == RIGHT || rounded == LEFT)
        rounded += corner;
    else if (rounded == DOWN || rounded == UP) 
        rounded += half_pi - corner;
    //print(rounded)
    
    return vector(me, rounded, cornlength);
}