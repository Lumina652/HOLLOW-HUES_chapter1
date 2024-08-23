function scr_set_song_ingame(_song, _fade_out_current_song = 0, _fade_in = 0, _song_loop = true){
	//_song = set to any song ("NOONE" IS NO SONG)
	// both fade out and fade in are in frames
	//song loop sets if the song should loop
	with (obj_music) {
		target_song_asset = _song;
		end_fade_out_time = _fade_out_current_song;
		start_fade_in_time = _fade_in;
		song_loop = _song_loop;
	}
}