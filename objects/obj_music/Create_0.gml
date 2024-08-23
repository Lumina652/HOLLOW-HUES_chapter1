song_instance = noone;
song_asset = noone;
target_song_asset = noone;
end_fade_out_time = 0; //frames to fade out the song playing rn
start_fade_in_time = 0; //frames to fade in the new song
fade_in_instance_volume = 1; //the volume of song_instance
song_loop = true; //set if the song should loop

fade_out_instances = array_create(0); //audio instances to fade out
fade_out_instances_volume = array_create(0); //volumes of each individual audio instance
fade_out_instances_time = array_create(0); //how fast the fadeout should happen