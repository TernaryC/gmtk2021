self.getCorner = function (_pos) {
    /// Get coordinates of nearest corner to point
    
    //position of block
    var me = pos(x, y);
    
    //position of block's bottom right corner
    //NOTE:
    // it's important that the block's sprite origin is set to
    //   Middle Center
    // otherwise this code will break
    var limit = pos(x + sprite_width / 2, y + sprite_height / 2);
    
    //angle from center of block to bottom-right corner
    var corner = angle_from(me, limit);
    
    //length from center of block to bottom-right corner
    var cornlength = pos_distance(me, limit);
    
    
    //angle from center of block to supplied point
    var angle = angle_from(me, _pos);
    angle = wrap(angle, 0, two_pi); //ensure angle is between 0 and two_pi
                                    // this is so that it can be easily
                                    // checked against the direction constants
                                    // (see macroenum script)
    
    //angle rounded to the nearest multiple of half_pi (90 degrees)
    var rounded = half_pi * floor(angle / half_pi);
    //rounded angle adjusted to be a multiple of 45 degrees (this is used later)
    var adjust = rounded + (half_pi * 0.5);
    
    
    //rounded angle adjusted to aim directly at a corner of the block
    // this part is a little funky, ngl
    // the math works. I can sketch it for you.
    
    if (rounded == LEFT || rounded == RIGHT) //if rounded is 0 or 180 degrees
        rounded += corner;
    else if (rounded == UP || rounded == DOWN) //if rounded is 90 or 270 degrees
        rounded += half_pi - corner;
    
    
    //get coordinates of corner using center of block, angle to corner,
    // and length to corner
    var v = vector(me, rounded, cornlength);
    
    //finally, move calculated point 1 pixel away from block at a
    // 45 degree angle. This is important to stop the rope from
    // catching strangely and breaking, I promise.
    return vector(v, adjust, 1);
}