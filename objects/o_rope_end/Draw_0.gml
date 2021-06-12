draw_set_color(c_red);
draw_circle(x, y, 10, false);

if (ds_list_size(anchors) > 0) {
    var i = 0
    for (; i < ds_list_size(anchors) - 1; i++) {
        var ap0 = anchors[| i]
        draw_circle(ap0.x, ap0.y, 5, false);
        var ap1 = anchors[| i + 1];
        draw_line(ap0.x, ap0.y, ap1.x, ap1.y);
    }
    draw_line(anchors[| i].x, anchors[| i].y, x, y);
}