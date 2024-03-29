if (!obj_player_sal.in_cutscene) {
	if (page >= page_number - 1) && (option_number <= 0) {
		obj_player_sal.hasControl = true;
		obj_player_sal.in_text = 0;
	}
}
else {
	if (page >= page_number - 1) && (option_number <= 0) {
		switch (obj_player_sal.whatCutscene) {
			case 1:
				obj_malachi_cut_01.alarm[2] = 1 * room_speed;
				break;
			case 2:
				obj_malachi_cut_02.alarm[2] = 1 * room_speed;
				break;
			case 3:
				obj_malachi_cut_03.alarm[2] = 1 * room_speed;
				break;
			case 4:
				obj_malachi_cut_04.alarm[2] = 1 * room_speed;
				break;
			case 5:
				obj_malachi_cut_05.alarm[2] = 1 * room_speed;
				break;
		}
	}
}