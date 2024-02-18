/// @description Move to next room

with (obj_player_sal) {
	if (hasControl) {
		hasControl = false;
		scr_transition(TRANS_MODE.GOTO, other.target);
	}
}