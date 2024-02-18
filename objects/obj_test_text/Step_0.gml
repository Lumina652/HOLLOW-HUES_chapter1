if (position_meeting(mouse_x, mouse_y, id)) && (mouse_check_button_pressed(mb_left)) && (obj_player_sal.hasControl == true) {
	scr_create_textbox(text_id);
	obj_player_sal.hasControl = false;
}