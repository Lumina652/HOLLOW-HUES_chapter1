/// @description Progress the transition

if (mode != TRANS_MODE_WHITE.OFF) {
	//INTRO TRANSITION
	if (mode == TRANS_MODE_WHITE.INTRO) {
		percent = max(0, percent - max((percent / 10), 0.005));
	}
	else {
		percent = min(percent_target, percent + max(((percent_target - percent) / 10), 0.005));
	}
	
	//
	if (percent == percent_target) || (percent = 0) {
		switch (mode) {
			case TRANS_MODE_WHITE.INTRO: {
				mode = TRANS_MODE.OFF;
				break;	
			}
			case TRANS_MODE_WHITE.NEXT: {
				mode = TRANS_MODE.INTRO;
				room_goto_next();
				break;		
			}
			case TRANS_MODE_WHITE.GOTO: {
				mode = TRANS_MODE.INTRO;
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
