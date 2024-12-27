var _malachi = instance_create_layer(obj_player_sal.x, 920, "Malachi", obj_malachi);
audio_play_sound(snd_malachi_teleport, 10, false, global.sound_volume * global.master_volume);
with (obj_camera) {
	cam_speed = 17;
	follow = obj_malachi;
}

alarm[1] = 2 * room_speed;