if (global.paused) {
    checkButton(close);
    checkButton(resume);
    checkButton(mute);
}

if (global.muted) audio_stop_all();

if (wipe == 25) {
    audio_group_stop_all(ag_sfx);
    if (restart) room_restart();
    else room_goto_next();
}
if (wipe >= 50) {
    wiping = false;
    restart = false;
    wipe = 0;
    wipedir = 0;
    newwipe = true;
}