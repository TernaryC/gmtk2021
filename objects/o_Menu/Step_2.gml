if (global.paused) {
    checkButton(close);
    checkButton(resume);
    checkButton(mute);
}

if (global.muted) audio_stop_all();