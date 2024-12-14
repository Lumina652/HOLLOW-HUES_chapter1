if (obj_player_sal.in_cutscene == false) {
	alarm[0] = 1 * room_speed;
	obj_player_sal.hasControl = false;
	obj_player_sal.in_cutscene = true;
	obj_player_sal.whatCutscene = 9;
}