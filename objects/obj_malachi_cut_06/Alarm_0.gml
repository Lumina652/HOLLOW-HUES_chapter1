instance_create_layer(obj_player_sal.x, obj_player_sal.y - 100, "Player", obj_malachi_glitch);
audio_play_sound(snd_malachi_teleport, 10, false, global.sound_volume * global.master_volume);
alarm[1] = 2 * room_speed;