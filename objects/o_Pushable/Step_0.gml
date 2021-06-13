
if (lastx != x || lasty != y) {
    if (!audio_is_playing(sfx_move_loop)) {
		audio_play_sound(sfx_move_loop, 0.5, true);
		audio_sound_gain(sfx_move_loop, 0.3, 0);
	}
} else {
    if (audio_is_playing(sfx_move_loop)) {
		audio_stop_sound(sfx_move_loop)
		audio_play_sound(sfx_move_end, 0.5, false);
		audio_sound_gain(sfx_move_end, 0.3, 0);
	}
}

lastx = x;
lasty = y;