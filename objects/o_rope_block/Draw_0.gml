draw_self();
draw_set_color(c_aqua);
print("corning")
var corn = getCorner(pos(x - 50, y - 50));
print(corn)
draw_circle(corn.x, corn.y, 10, true);
corn = getCorner(pos(x - 50, y + 50));
draw_circle(corn.x, corn.y, 10, true);
corn = getCorner(pos(x + 50, y - 50));
draw_circle(corn.x, corn.y, 10, true);
corn = getCorner(pos(x + 50, y + 50));
draw_circle(corn.x, corn.y, 10, true);