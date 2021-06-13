self.getStart = function () {
    //print("Getting Start")
    //print("x y :", x, y)
    var _x, _y;
    if (facing == UP || facing == DOWN) _x = x;
    else {
        if (facing == LEFT) _x = x + 4;
        else _x = x - 4;
    }
    if (facing == LEFT || facing == RIGHT) _y = y;
    else {
        if (facing == UP) _y = y + 8; 
        else _y = y + 4;
    }
    //print("_x _y :", _x, _y)
    return pos(_x, _y);
}