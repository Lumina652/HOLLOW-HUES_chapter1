obj_malachi.sprite_index = spr_malachi_flee_1;
obj_malachi.image_speed = 1;
obj_malachi.image_index = 0;
audio_play_sound(snd_malachi_teleport, 5, false, global.sound_volume * global.master_volume);
with (obj_camera) {
	cam_speed = 6;
	follow = obj_player_sal;
}

alarm[3] = 1 * room_speed;