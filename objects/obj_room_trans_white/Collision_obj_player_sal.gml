/// @description Move to next room

with (obj_player_sal) {
	if (hasControl) {
		hasControl = false;
		audio_play_sound(msc_rising_up, 1000, false);
		scr_transition_white(TRANS_MODE_WHITE.GOTO, other.target);
	}
}
