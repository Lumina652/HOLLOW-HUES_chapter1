audio_play_sound(snd_sal, 1, false, global.sound_volume * global.master_volume);
with (obj_player_sal) {
	hasControl = true;
	in_cutscene = false;
	image_alpha = 1;
}
instance_destroy(obj_cutscene_sal);
instance_destroy();