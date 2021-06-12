//frames++;

//for some reason this is important in order to get the rope
// working when the game begins. It's not strictly neccessary,
// I don't think, but it helps with the edge case of things
// interacting with the rope before the player has moved at all.
if (!init) {
    move( 1, 0);
    move(-1, 0);
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
if (keyboard_check(ord("R"))) {room_restart();
	anchors = ds_list_create();
	var rs = instance_find(o_rope_start, 0);
	anchors_len = 0; //length of anchors list

	// Create first and last anchors
	addAnchor(0, pos(x, y), 0);
	addAnchor(1, pos(rs.x, rs.y), 0);
}