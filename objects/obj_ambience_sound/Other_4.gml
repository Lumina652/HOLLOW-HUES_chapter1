/// @description Play ambience based on the room
if (room == rm_cut_start) {
	scr_set_ambience_ingame(noone);
}

if (room == rm_malachi_0) {
	scr_set_ambience_ingame(snd_ocean_ambience, 0, 120, true);
}

if (room == rm_test_dialogue) {
	scr_set_ambience_ingame(noone);
}
