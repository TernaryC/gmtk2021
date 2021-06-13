if (!global.lockout) {
    if (!audio_is_playing(sfx_success) and !o_Menu.wiping) {
        audio_play_sound(sfx_success, 1, false);
        audio_group_stop_all(ag_sfx);
    }
    o_Menu.wiping = true;
}