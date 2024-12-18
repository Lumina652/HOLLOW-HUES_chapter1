if (solved != true) {
	obj_player_sal.hasControl = true;
	audio_play_sound(snd_malachi_6, 10, false);

	with (obj_mushroomdoor) {
		what_step ++;
		array_push(code, 1);	
	}
}
else {
	obj_player_sal.hasControl = false;
	scr_create_textbox("Music_Mushroom_after");
}