self.getCorner = function (_pos) {
    //print("corner time")
    var me = pos(x, y);

	
    var limit = pos(x + sprite_width / 2, y + sprite_height / 2 );
    var corner = angle_from(me, limit);
    var cornlength = pos_distance(me, limit);
    //print("me/limt:", me, limit)
    //print("corndat:", corner, cornlength)
    
    //print(_pos)
    
    var angle = angle_from(me, _pos);
    //print("angle:", angle);
    angle = wrap(angle, 0, two_pi);
    //print(angle);
    
    var rounded = half_pi * floor(angle / half_pi);
    var adjust = rounded + (half_pi * 0.5);
    
    //print("round", rounded)
    if (rounded == LEFT || rounded == RIGHT)
        rounded += corner;
    else if (rounded == UP || rounded == DOWN) 
        rounded += half_pi - corner;
    //print(rounded)
    
    var v = vector(me, rounded, cornlength);
    
    return vector(v, adjust, 1);
}