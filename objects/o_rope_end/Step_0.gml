
if (mouse_check_button_pressed(mb_left)) {
    addAnchor(1, pos(mouse_x, mouse_y));
}

if (keyboard_check(ord("W"))) move( 0, -5);
if (keyboard_check(ord("A"))) move(-5,  0);
if (keyboard_check(ord("S"))) move( 0,  5);
if (keyboard_check(ord("D"))) move( 5,  0);
if (keyboard_check(ord("R"))) room_restart();