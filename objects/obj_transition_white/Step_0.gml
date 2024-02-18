/// @description Progress the transition

if (mode != TRANS_MODE_WHITE.OFF) {
	//INTRO TRANSITION
	if (mode == TRANS_MODE_WHITE.INTRO) {
		white_alpha = max(0, white_alpha - max((white_alpha / 10), 0.005));
	}
	else {
		white_alpha += 1 / white_duration;
	}
	
	//
			if (white_alpha >= white_stop) || (white_alpha = 0) {
				switch (mode) {
					case TRANS_MODE_WHITE.INTRO: {
						mode = TRANS_MODE_WHITE.OFF;
						break;	
					}
					case TRANS_MODE_WHITE.NEXT: {
						mode = TRANS_MODE_WHITE.INTRO;
						room_goto_next();
						break;		
					}
					case TRANS_MODE_WHITE.GOTO: {
						mode = TRANS_MODE_WHITE.INTRO;
						audio_stop_sound(snd_ocean_ambience);
						room_goto(target);
						break;		
					}
					case TRANS_MODE_WHITE.RESTART: {
						game_restart();
						break;		
					}
				}
			}
}
