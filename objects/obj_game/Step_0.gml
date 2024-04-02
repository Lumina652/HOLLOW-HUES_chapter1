if (keyboard_check_pressed(global.controls_esc)) {
	if (!isPaused) && (obj_player_sal.hasControl) {
		scr_pause_game();
	}
}