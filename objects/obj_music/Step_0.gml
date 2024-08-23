var _final_volume = global.music_volume * global.master_volume;

#region play target song
if (song_asset != target_song_asset) {
	//tell the old song to fade out
	if (audio_is_playing(song_instance)) {
		array_push(fade_out_instances, song_instance);
		array_push(fade_out_instances_volume, fade_in_instance_volume);
		array_push(fade_out_instances_time, end_fade_out_time);
		
		//reset the song instance and song asset
		song_instance = noone;
		song_asset = noone;
	}
	
	//play the song if the old song has faded out
	if (array_length(fade_out_instances) == 0) {
		if (audio_exists(target_song_asset)) {
			song_instance = audio_play_sound(target_song_asset, 4, song_loop);
	
			//start the song volume at 0
			audio_sound_gain(song_instance, 0, 0);
			fade_in_instance_volume = 0;
		}
		//set the song asset to match target song asset
		song_asset = target_song_asset;
	}
}
#endregion

#region volume control
//main song volume
if (audio_is_playing(song_instance)) {
	//fade the song in
	if (start_fade_in_time > 0) {
		if (fade_in_instance_volume < 1) {
			fade_in_instance_volume += 1 / start_fade_in_time;	
		}
		else  {
			fade_in_instance_volume = 1;	
		}
	}
	else {
		fade_in_instance_volume = 1;	
	}
	
	audio_sound_gain(song_instance, fade_in_instance_volume * _final_volume, 0);
}

//fading songs out
for (var i = 0; i < array_length(fade_out_instances); i++) {
	//fade the volume
	if (fade_out_instances_time[i] > 0) {
		if (fade_out_instances_volume[i] > 0) {
			fade_out_instances_volume[i] -= 1 / fade_out_instances_time[i];	
		}
	}
	else {
		fade_out_instances_volume[i] = 0;	
	}
	
	audio_sound_gain(fade_out_instances[i], fade_out_instances_volume[i] * _final_volume, 0);
	
	if (fade_out_instances_volume[i] <= 0) {
		if (audio_is_playing(fade_out_instances[i])) {
			audio_stop_sound(fade_out_instances[i]);	
		}
		array_delete(fade_out_instances, i, 1);
		array_delete(fade_out_instances_volume, i, 1);
		array_delete(fade_out_instances_time, i, 1);
		
		i --;
	}
}


#endregion