audio_play_sound(snd_cancel, 1, false, global.sound_volume * global.master_volume);
start = 1;
with (obj_cutscene_sal) {
	//var _x_start = x;
	//var _y_start = y;
	//var _how_long = 4;
	//var _timer = 0;
	//while (_timer != _how_long) {
	//    _timer ++;
	//}
	
	//if (_timer != _how_long) {
	//	x = lengthdir_x(1, irandom(360));
	//	y = lengthdir_y(1, irandom(360));
	//}
	//else {
	//	x = _x_start;
	//	y = _y_start;
	//	other.alarm[1] = 3 * 60;
	//}
	if (other.shake_timer != other.shake_time) {
		x = xstart + dsin(current_time * 0.001) * 5;
		y = ystart + dsin(current_time * 0.001) * 5;
	}
	
}
alarm[1] = 3*60