draw_set_color(c_white)
var re = instance_find(o_rope_end, 0);
var length = "N/A";
if (re != undefined) length = string(re.rope_length)
if (global.superrope) length = "Unlimited"
draw_text(5, 5, length);
draw_text(5, 17, "Lockout: " + string(global.lockout));
draw_text(5, 29, global.paused)