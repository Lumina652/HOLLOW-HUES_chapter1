if (obj_player_sal.in_cutscene == false) {
	alarm[0] = 2 * room_speed;
	obj_player_sal.hasControl = false;
	obj_player_sal.in_cutscene = true;
	obj_player_sal.whatCutscene = 6;
	scr_set_song_ingame(noone, 120, 0);
}