//WRONG CODE
if (what_step >= 5) && (!array_equals(code, correct_code)) {
	what_step = 0;
	audio_play_sound(snd_cancel, 10, false);
	array_delete(code, 0, 6);
}

//GOOD CODE
if (what_step >= 5) && (array_equals(code, correct_code)) {
	what_step = 0;	
	audio_play_sound(snd_confirm, 10, false);
	obj_musicmushroom1.solved = true;
	obj_musicmushroom2.solved = true;
	obj_musicmushroom3.solved = true;
	obj_musicmushroom4.solved = true;
	instance_destroy();
}