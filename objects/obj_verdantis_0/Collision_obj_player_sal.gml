if (obj_player_sal.in_cutscene == false) {
	alarm[0] = 3.5 * room_speed;
	with (obj_player_sal) {
		hasControl = false;
		in_cutscene = true;
		whatCutscene = 10;
		image_alpha = 0;
	}
	instance_create_depth(obj_player_sal.x, obj_player_sal.y, obj_player_sal.depth, obj_cutscene_sal);
	
	with (obj_cutscene_sal) {
		animation = playerAnimsCUTSCENE.LAYING;	
	}
	scr_set_song_ingame(noone, 0, 0);
}