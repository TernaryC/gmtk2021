/// @description put this object sligtly smaller then the visual
global.Dead = true
if (!audio_is_playing(sfx_death) and !o_Menu.wiping) {
    audio_group_stop_all(ag_sfx);
    audio_play_sound(sfx_death, 1, false);
}
sprite_index = Death