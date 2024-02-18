// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_pause_game() {
	obj_player_sal.hasControl = false;
	obj_game.isPaused = true;
	instance_create_depth(0, 0, -9999, obj_pause_menu);
}

function scr_resume_game() {
	obj_player_sal.hasControl = true;
	obj_game.isPaused = false;
	instance_destroy(obj_pause_menu);
}