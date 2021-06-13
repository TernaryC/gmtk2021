if (wiping) {
    draw_set_color(c_black);
    draw_set_alpha(1);
    
    var lim0, lim1;
    if (wipedir ==  0) { lim0 = 0; lim1 = room_width;  }
    if (wipedir ==  1) { lim0 = 0; lim1 = room_height; }
    if (wipedir ==  2) { lim1 = 0; lim0 = room_width;  }
    if (wipedir ==  3) { lim1 = 0; lim0 = room_height; }
    //print(wipedir)
    
    var w1 = map(wipe,  0, 20, lim0, lim1);
    var w2 = map(wipe, 30, 50, lim0, lim1);
    if (wipedir == 0 || wipedir == 2)
        draw_rectangle(w2, 0, w1, room_height, false);
    if (wipedir == 1 || wipedir == 3)
        draw_rectangle(0, w2, room_width, w1, false);
}

if (global.paused) {
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(left, top, right, bottom, false);
    
    drawButton(close);
    draw_set_color(c_white);
    draw_line_width(close.posx + 8, close.posy + 8,
                    close.endx - 8, close.endy - 8, 4);
    draw_line_width(close.endx - 8, close.posy + 8,
                    close.posx + 8, close.endy - 8, 4);
    
    drawButton(resume);
    draw_set_color(c_white);
    draw_triangle(resume.posx + 32, resume.posy + 32,
                  resume.posx + 32, resume.endy - 32,
                  resume.endx - 32, resume.posy + (resume.width / 2),
                  false);
                  
    drawButton(mute);
    draw_set_color(c_white);
    draw_triangle(mute.endx - 48, mute.posy + 32,
                  mute.endx - 48, mute.endy - 32,
                  mute.posx + 32, mute.posy + (mute.width / 2),
                  false);
    draw_rectangle(mute.posx + 32, mute.posy + 48,
                   mute.posx + 64, mute.endy - 48, false);
    if (!global.muted) {
        draw_rectangle(mute.endx - 32, mute.posy + 40,
                       mute.endx - 40, mute.endy - 40,
                       false);
    }
    
}