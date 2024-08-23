/// @description Move to next room

with (obj_player_sal) {
	if (hasControl) {
		hasControl = false;
		scr_transition_white(TRANS_MODE_WHITE.GOTO, other.target);
		scr_set_song_ingame(msc_rise, 0, 0, false);
	}
}