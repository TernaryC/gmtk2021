var rs = instance_find(o_rope_start, 0);
ds_list_replace(anchors, 0, pos(rs.x, rs.y));

if (keyboard_check(ord("W"))) move( 0, -5);
if (keyboard_check(ord("A"))) move(-5,  0);
if (keyboard_check(ord("S"))) move( 0,  5);
if (keyboard_check(ord("D"))) move( 5,  0);
if (keyboard_check(ord("R"))) room_restart();