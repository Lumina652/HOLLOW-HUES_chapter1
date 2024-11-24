if (!obj_player_sal.in_cutscene) {
	if (page >= page_number - 1) && (option_number <= 0) {
		obj_player_sal.hasControl = true;
		obj_player_sal.in_text = 0;
	}
}
else {
	if (page >= page_number - 1) && (option_number <= 0) {
		scr_textbox_cutscene_destroy();
	}
}