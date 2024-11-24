ambience_instance = noone;
ambience_asset = noone;
target_ambience_asset = noone;
ambience_end_fade_out_time = 0; //frames to fade out the song playing rn
ambience_start_fade_in_time = 0; //frames to fade in the new song
ambience_fade_in_instance_volume = 1; //the volume of song_instance
ambience_loop = true; //set if the song should loop

ambience_fade_out_instances = array_create(0); //audio instances to fade out
ambience_fade_out_instances_volume = array_create(0); //volumes of each individual audio instance
ambience_fade_out_instances_time = array_create(0); //how fast the fadeout should happen