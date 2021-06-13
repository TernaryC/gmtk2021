randomise()

global.paused = false;
global.muted = false;
can_mute = true;

wiping = false;
wipe = 0;
restart = false;
wipedir = 0;
newwipe = true;

left = 48;
right = room_width - 48;
top = 48;
bottom = room_height - 48;
centerx = room_width / 2;
centery = room_height / 2;



self.button = function (_w, _h, _x, _y) {
    var b = {
        width : _w,
        height : _h,
        posx : _x,
        posy : _y,
        endx : 0,
        endy : 0,
        hover : false,
        pressed : false
    }
    b.endx = b.posx + b.width;
    b.endy = b.posy + b.height;
    return b;
}

self.drawButton = function (button) {
    var w = button.width;
    var h = button.height;
    var _x = button.posx + (w / 2);
    var _y = button.posy + (h / 2);
    
    draw_set_color($AFA536);
    if (button.hover) {
        draw_set_color($C9C03E);
        w += 5;
        h += 5;
    }
    if (button.pressed) {
        draw_set_color($99912F);
        w -= 10;
        h -= 10;
    }
    draw_set_alpha(1);
    draw_roundrect(_x - (w / 2), _y - (h / 2), _x + (w / 2), _y + (h / 2), false);
}

self.checkButton = function (button) {
    var hover = true
    if (mouse_x < button.posx or mouse_x > button.posx + button.width)
        hover = false
    else if (mouse_y < button.posy or mouse_y > button.posy + button.height)
        hover = false
    button.hover = hover;
    if (hover and mouse_check_button(mb_left)) button.pressed = true;
    else button.pressed = false;
}



close  = button(32, 32, right - 64, top + 32);
resume = button(128, 128, centerx - 96 - 128, centery);
mute   = button(128, 128, centerx + 96, centery);

