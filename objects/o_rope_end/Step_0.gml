var rs = instance_find(o_rope_start, 0);
ds_list_replace(anchors, 0, pos(rs.x, rs.y));

ds_list_clear(sensors);
var anchor = anchors[| ds_list_size(anchors) - 1];
var theta = arctan2(y - anchor.y, x - anchor.x);
var length = distance_to_point(anchor.x, anchor.y);
var size = 100;
for (var i = 1; i < size; i++) {
    var nx = anchor.x + cos(theta) * i * (length / size);
    var ny = anchor.y + sin(theta) * i * (length / size);
    
    var colBlock = collision_point(nx, ny, o_rope_block, false, true)
    if (colBlock != noone) {
        //ds_list_add(anchors, getCorner(colBlock, nx, ny));
        //snag = getCorner(colBlock, nx, ny);
        if (point_distance(anchor.x, anchor.y, nx, ny) > 5) {
            ds_list_add(anchors, pos(nx, ny));
            break;
        }
    }
    //snag = pos(x, y);
    ds_list_add(sensors, pos(nx, ny));
}

if (keyboard_check(ord("W"))) y -= 5;
if (keyboard_check(ord("A"))) x -= 5;
if (keyboard_check(ord("S"))) y += 5;
if (keyboard_check(ord("D"))) x += 5;
if (keyboard_check(ord("R"))) room_restart();