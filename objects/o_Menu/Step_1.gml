if (global.paused) {
    if (close.pressed)  game_end();
    if (resume.pressed) global.paused = false;
    if (mute.pressed) {
        if (can_mute) global.muted  = !global.muted;
        can_mute = false;
    } else can_mute = true;
}