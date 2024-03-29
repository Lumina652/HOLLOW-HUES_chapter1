//get selected item //selected_item = i;
selected_item = -1;

//picking from items, weapons, armor and key items
if (selected_menu == 0) {
	menu_button_pos += keyboard_check_pressed(global.controls_down) - keyboard_check_pressed(global.controls_up);
	menu_button_pos = clamp(menu_button_pos, 0, 3);
	
	//menu button sprite change
	switch (menu_button_pos) {
		case 0:
			button_bg_item = button_selected;
			button_bg_weapon = button_unselected;
			button_bg_armor = button_unselected;
			button_bg_key = button_unselected;
			break;
		case 1:
			button_bg_item = button_unselected;
			button_bg_weapon = button_selected;
			button_bg_armor = button_unselected;
			button_bg_key = button_unselected;
			break;
		case 2:
			button_bg_item = button_unselected;
			button_bg_weapon = button_unselected;
			button_bg_armor = button_selected;
			button_bg_key = button_unselected;
			break;
		case 3:
			button_bg_item = button_unselected;
			button_bg_weapon = button_unselected;
			button_bg_armor = button_unselected;
			button_bg_key = button_selected;
			break;
	}

	//option pick sound
	if (keyboard_check_pressed(global.controls_down)) || (keyboard_check_pressed(global.controls_up)) {
		audio_play_sound(snd_option_pick, 2, false);
	}
	//picking menu
	if (keyboard_check_pressed(global.controls_interact)) {
		switch (menu_button_pos) {
			case 0:
				menu_button = 0;
				selected_menu = 1;
				break;
			case 1:
				menu_button = 1;
				selected_menu = 1;
				break;
			case 2:
				menu_button = 2;
				selected_menu = 1;
				break;
			case 3:
				menu_button = 3;
				selected_menu = 1;
				break;
		}
	}
}

//Go back to picking menus
if (keyboard_check_pressed(global.controls_esc)) {
	menu_button = -1;
	selected_menu = 0;
	made_draw_menu = 0;
	other_frame_sprite = spr_inv_frame;
	other_bg_sprite = spr_text_box_inv;
}

//ITEMS
if (menu_button == 0) {
	//items
	item_move_vertical += keyboard_check_pressed(global.controls_down) - keyboard_check_pressed(global.controls_up);
	item_move_vertical = clamp(item_move_vertical, 0, array_length(global.inv_item) - 1);
	
	for (var i = 0; i < array_length(global.inv_item); i++) {
		var _xx = camera_get_view_x(view_camera[0]) + screen_border_x;
		var _yy = camera_get_view_y(view_camera[0]) + screen_border_y;
		if (item_move_vertical <= 4) {
			item_selection_frame_x = _xx
			item_selection_frame_y = _yy + sep * item_move_vertical;
		}
		if (item_move_vertical > 4) && (item_move_vertical <= 9) {
			item_selection_frame_x = _xx + next_column_offset;
			item_selection_frame_y = _yy + sep * (item_move_vertical - 5);
		}
		if (item_move_vertical > 9) && (item_move_vertical <= 14) {
			item_selection_frame_x = _xx + (next_column_offset * 2);
			item_selection_frame_y = _yy + sep * (item_move_vertical - 10);
		}
		if (item_move_vertical > 14) {
			item_selection_frame_x = _xx + (next_column_offset * 3);
			item_selection_frame_y = _yy + sep * (item_move_vertical - 15);
		}
		
		selected_item = item_move_vertical;
		
	}

	if (selected_item != -1) {
		//use an item
		if (keyboard_check_pressed(global.controls_use)) && (obj_player_sal.in_text == 0) {
			global.inv_item[item_move_vertical].effect();
		}
	
		//drop the item
		if (keyboard_check_pressed(global.controls_back)) && (global.inv_item[item_move_vertical].can_drop == true) && (obj_player_sal.in_text == 0) {
			array_delete(global.inv_item, global.inv_item[item_move_vertical], 1);
		}
	}
}