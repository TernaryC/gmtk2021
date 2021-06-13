if (!global.lockout) {
    audio_group_stop_all(ag_sfx);
    audio_play_sound(sfx_success, 1, false);
    room_goto_next();
}