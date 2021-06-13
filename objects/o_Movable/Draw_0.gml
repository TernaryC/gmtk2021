//draw_self()

depth = map(y, 0, room_height, 399, 300);

var left = x - sprite_width / 2;
var top  = y - sprite_height / 2;

var tile_width = floor(sprite_width / 32);
var tile_height = ceil(sprite_height / 32);

for (var _y = -1; _y <= tile_height; _y++) {
	for (var _x = -1; _x <= tile_width; _x++) {
		var i = _y == tile_height - 1 ? 0 : 1;
		if (_x >= 0 and _x < tile_width and _y >= 0 and _y < tile_height) {
			draw_sprite(s_WallSingle, i, left + _x * 32, top + _y * 32);
			//draw_text(left + _x * 32, top + _y * 32, i)
		} else {
			if (_y == -1) {
				if (_x == -1)               i = 0;
				else if (_x == tile_width) i = 1;
				else					   i = 4;
			} else if (_y == tile_height) {
				if (_x == -1)               i = 2;
				else if (_x == tile_width) i = 3;
				else					   i = 6;
			} else {
				if (_x == -1)               i = 7;
				else if (_x == tile_width) i = 5;
				else                       i = 8;
			}
			
			draw_sprite(s_WallShadow, i, left + _x * 32, top + _y * 32);
			//draw_text(left + _x * 32, top + _y * 32, i)
		}
	}
}






