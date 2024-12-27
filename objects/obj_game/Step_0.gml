if (keyboard_check_pressed(global.controls_esc)) {
	if (!isPaused) && (obj_player_sal.hasControl) && (obj_player_sal.in_inv == 0) && (!instance_exists(obj_battle)){
		scr_pause_game();	
	}
}

if (keyboard_check_pressed(ord("M"))) {
	global.music_volume = 0;
}

if (keyboard_check_pressed(ord("F"))) {
    if window_get_fullscreen() {
		window_set_fullscreen(false);
    }
    else {
        window_set_fullscreen(true);
    }
}