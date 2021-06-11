draw_set_color(c_red);
draw_circle(x, y, 10, false);

if (ds_list_size(anchors) > 0) {
    var i = 0
    for (; i < ds_list_size(anchors) - 1; i++) {
        var ap0 = anchors[| i]
        var ap1 = anchors[| i + 1];
        draw_line(ap0.x, ap0.y, ap1.x, ap1.y);
    }
    draw_line(anchors[| i].x, anchors[| i].y, x, y);
}

for (var i = 0; i < ds_list_size(sensors); i++) {
    draw_set_color(c_yellow);
    draw_circle(sensors[| i].x, sensors[| i].y, 5, true);
}