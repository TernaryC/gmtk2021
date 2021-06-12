draw_self();

/* DEBUG DRAW CODE FOR DISPLAYING BLOCK CORNERS */
// Essentially it just calls getCorner a bunch and draws
//  circles at the results.
// The +/-50 is arbitrary. I chose it because it's a big enough number.
//  The 4 points chosen just have to be within the 4 quadrants of the
//  block. 

/*
draw_set_color(c_aqua);
var corn = getCorner(pos(x - 50, y - 50));
draw_circle(corn.x, corn.y, 10, true);
corn = getCorner(pos(x - 50, y + 50));
draw_circle(corn.x, corn.y, 10, true);
corn = getCorner(pos(x + 50, y - 50));
draw_circle(corn.x, corn.y, 10, true);
corn = getCorner(pos(x + 50, y + 50));
draw_circle(corn.x, corn.y, 10, true);
/**/