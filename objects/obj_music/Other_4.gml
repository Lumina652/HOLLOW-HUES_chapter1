/// @description Play music based on the room
if (room == rm_cut_start) {
	scr_set_song_ingame(msc_underwater, 0, 0, false);	
}

if (room == rm_malachi_0) {
	scr_set_song_ingame(msc_malachi, 0, 120, true);	
}

if (room == rm_malachi_2) {
	scr_set_song_ingame(noone, 120, 0);	
}

if (room == rm_test_dialogue) {
	scr_set_song_ingame(noone, 120, 0);	
}

if (room == rm_overgrown_0) {
	scr_set_song_ingame(msc_verdantis, 120, 120, true);	
}
