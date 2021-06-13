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