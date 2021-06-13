frames++;

//for some reason this is important in order to get the rope
// working when the game begins. It's not strictly neccessary,
// I don't think, but it helps with the edge case of things
// interacting with the rope before the player has moved at all.
if (!init) {
    move( 5, 5);
    move( 5,-5);
    init = true;
}

/* //Click to add anchors
if (mouse_check_button_pressed(mb_left)) {
    addAnchor(1, pos(mouse_x, mouse_y));
}
*/

//player movement
if (keyboard_check(ord("W"))) move( 5, UP);
if (keyboard_check(ord("A"))) move( 5, LEFT);
if (keyboard_check(ord("S"))) move( 5, DOWN);
if (keyboard_check(ord("D"))) move( 5, RIGHT);

if (keyboard_check(ord("R"))) room_restart();
if (keyboard_check(ord("Q"))) global.paused = !global.paused;

global.anchors = anchors
global.anchorsLen = anchors_len

depth = map(y, 0, room_height, 100, 0);

