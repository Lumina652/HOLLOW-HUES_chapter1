/// @description ROOM AMBIENCE
if (room == rm_malachi_0) || (room == rm_malachi_1) || (room == rm_malachi_2) {
	audio_stop_sound(snd_ocean_ambience);
	audio_play_sound(snd_ocean_ambience, 20, true);	
}