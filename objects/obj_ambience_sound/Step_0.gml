var _final_volume = global.ambience_volume * global.master_volume;

#region play target ambience
if (ambience_asset != target_ambience_asset) {
	//tell the old ambience to fade out
	if (audio_is_playing(ambience_instance)) {
		array_push(ambience_fade_out_instances, ambience_instance);
		array_push(ambience_fade_out_instances_volume, ambience_fade_in_instance_volume);
		array_push(ambience_fade_out_instances_time, ambience_end_fade_out_time);
		
		//reset the ambience instance and ambience asset
		ambience_instance = noone;
		ambience_asset = noone;
	}
	
	//play the ambience if the old ambience has faded out
	if (array_length(ambience_fade_out_instances) == 0) {
		if (audio_exists(target_ambience_asset)) {
			ambience_instance = audio_play_sound(target_ambience_asset, 4, ambience_loop);
	
			//start the ambience volume at 0
			audio_sound_gain(ambience_instance, 0, 0);
			ambience_fade_in_instance_volume = 0;
		}
		//set the ambience asset to match target ambience asset
		ambience_asset = target_ambience_asset;
	}
}
#endregion

#region volume control
//main ambience volume
if (audio_is_playing(ambience_instance)) {
	//fade the ambience in
	if (ambience_start_fade_in_time > 0) {
		if (ambience_fade_in_instance_volume < 1) {
			ambience_fade_in_instance_volume += 1 / ambience_start_fade_in_time;	
		}
		else  {
			ambience_fade_in_instance_volume = 1;	
		}
	}
	else {
		ambience_fade_in_instance_volume = 1;	
	}
	
	audio_sound_gain(ambience_instance, ambience_fade_in_instance_volume * _final_volume, 0);
}

//fading ambiences out
for (var i = 0; i < array_length(ambience_fade_out_instances); i++) {
	//fade the volume
	if (ambience_fade_out_instances_time[i] > 0) {
		if (ambience_fade_out_instances_volume[i] > 0) {
			ambience_fade_out_instances_volume[i] -= 1 / ambience_fade_out_instances_time[i];	
		}
	}
	else {
		ambience_fade_out_instances_volume[i] = 0;	
	}
	
	audio_sound_gain(ambience_fade_out_instances[i], ambience_fade_out_instances_volume[i] * _final_volume, 0);
	
	if (ambience_fade_out_instances_volume[i] <= 0) {
		if (audio_is_playing(ambience_fade_out_instances[i])) {
			audio_stop_sound(ambience_fade_out_instances[i]);	
		}
		array_delete(ambience_fade_out_instances, i, 1);
		array_delete(ambience_fade_out_instances_volume, i, 1);
		array_delete(ambience_fade_out_instances_time, i, 1);
		
		i --;
	}
}


#endregion