if (solved != true) {
	obj_player_sal.hasControl = true;
	audio_play_sound(snd_malachi_7, 10, false, global.sound_volume * global.master_volume);

	with (obj_mushroomdoor) {
		what_step ++;
		array_push(code, 3);	
	}
}
else {
	obj_player_sal.hasControl = false;
	scr_create_textbox("Music_Mushroom_after");
}