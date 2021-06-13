if (global.paused) {
    if (close.pressed)  game_end();
    if (resume.pressed) global.paused = false;
    if (mute.pressed)   global.muted  = !global.muted;
}