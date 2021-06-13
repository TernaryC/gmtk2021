/* DEBUG DRAW CODE */
/*
draw_set_color(c_blue);
draw_text(10, 10, "anchors_len: " + string(anchors_len));
draw_text(10, 25, "size(anchors): " + string(ds_list_size(anchors)));

draw_text(10, 45, "max_length: " + string(rope_length));
draw_text(10, 60, "getLength(): " + string(getLength()));
/**/

/* DEBUG DRAW CODE FOR ROPE */

//draw red circle at player's location
//draw_set_color(c_red);
//draw_circle(x, y, 10, false);

//drawing the rope
if (ds_list_size(anchors) > 0) {
    var i = 0
    for (; i < ds_list_size(anchors) - 1; i++) {
        //these variables are terribly named, I know.
        var ap0 = anchors[| i]
        var ap1 = anchors[| i + 1];
        
        //draw rope as black line
        draw_set_color(c_black);
        draw_line_width(ap0.x, ap0.y, ap1.x, ap1.y, 5);
        
        /* DRAWING ALL ANCHOR POINTS */
        /*
        draw_set_color(c_yellow);
        draw_circle(ap0.x, ap0.y, 5, false);
        var ap0a = vector(ap0, ap0.angle, 10);
        draw_line(ap0.x, ap0.y, ap0a.x, ap0a.y);
        draw_text(ap1.x + 8, ap1.y + 8, ap1.dir);
        draw_text(ap1.x + 8, ap1.y - 8, ap1.angle);
        //findSnags(i + 1);
        /**/
    }
    
    //draw_line(anchors[| i].x, anchors[| i].y, x, y);
}