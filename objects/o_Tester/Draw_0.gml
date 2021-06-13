draw_set_color(c_white)
var re = instance_find(o_rope_end, 0);
if (re != undefined) draw_text(5, 5, re.rope_length);
draw_text(5, 17, "Lockout: " + string(global.lockout));