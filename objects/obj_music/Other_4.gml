/// @description Play music based on the room
switch (room) {
	case rm_cut_start:
		scr_set_song_ingame(msc_underwater, 0, 0, false);	
		break;
	case rm_malachi_0:
		scr_set_song_ingame(msc_malachi, 0, 120, true);	
		break;
	case rm_malachi_2:
		scr_set_song_ingame(noone, 120, 0);	
		break;
	case rm_test_dialogue:
		scr_set_song_ingame(noone, 120, 0);	
		break;
	case rm_overgrown_0:
		scr_set_song_ingame(msc_verdantis, 120, 120, true);	
		break;
	case rm_unknown:
		scr_set_song_ingame(noone, 60, 0);
		scr_set_ambience_ingame(snd_ocean_ambience, 0, 60, true);
}
