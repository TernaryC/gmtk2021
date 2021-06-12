draw_set_color(c_red);
draw_circle(x, y, 10, false);

if (ds_list_size(anchors) > 0) {
    var i = 0
    for (; i < ds_list_size(anchors) - 1; i++) {
        var ap0 = anchors[| i]
        draw_circle(ap0.x, ap0.y, 5, false);
        draw_set_color(c_yellow);
        var ap0a = vector(ap0, ap0.angle, 10);
        draw_line(ap0.x, ap0.y, ap0a.x, ap0a.y);
        draw_set_color(c_red);
        var ap1 = anchors[| i + 1];
        draw_line_width(ap0.x, ap0.y, ap1.x, ap1.y, 2.5);
        //findSnags(i + 1);
    }
    draw_line(anchors[| i].x, anchors[| i].y, x, y);
}