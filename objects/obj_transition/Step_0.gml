/// @description Progress the transition

if (mode != TRANS_MODE.OFF) {
	//INTRO TRANSITION
	if (mode == TRANS_MODE.INTRO) {
		percent = max(0, percent - max((percent / 10), 0.005));
		//white_alpha += 1 / white_duration;
	}
	else {
		percent = min(percent_target, percent + max(((percent_target - percent) / 10), 0.005));
		//white_alpha = 0;
	}
	
	//
			if (percent == percent_target) || (percent = 0) {
				switch (mode) {
					case TRANS_MODE.INTRO: {
						mode = TRANS_MODE.OFF;
						break;	
					}
					case TRANS_MODE.NEXT: {
						mode = TRANS_MODE.INTRO;
						room_goto_next();
						break;		
					}
					case TRANS_MODE.GOTO: {
						mode = TRANS_MODE.INTRO;
						room_goto(target);
						with (obj_player_sal) {
							
						}
						
						break;		
					}
					case TRANS_MODE.RESTART: {
						game_restart();
						break;		
					}
				}
			}
}
