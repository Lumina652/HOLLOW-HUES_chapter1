//get selected item //selected_item = i;
selected_item = -1;

pressed_interact_timer --;

if (pressed_interact_timer <= 0) {
	pressed_interact_timer = 0;	
}

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
		audio_play_sound(snd_option_pick, 2, false, global.sound_volume * global.master_volume);
	}
	//picking menu
	if (keyboard_check_pressed(global.controls_interact)) && (pressed_interact_timer == 0) {
		audio_play_sound(snd_confirm, 2, false, global.sound_volume * global.master_volume);
		switch (menu_button_pos) {
			case 0:
				menu_button = 0;
				selected_menu = 1;
				scr_add_interaction_delay()
				obj_player_sal.hasControl = false;
				break;
			case 1:
				menu_button = 1;
				selected_menu = 1;
				scr_add_interaction_delay()
				obj_player_sal.hasControl = false;
				break;
			case 2:
				menu_button = 2;
				selected_menu = 1;
				scr_add_interaction_delay()
				obj_player_sal.hasControl = false;
				break;
			case 3:
				menu_button = 3;
				selected_menu = 1;
				scr_add_interaction_delay()
				obj_player_sal.hasControl = false;
				break;
		}
	}
}

//Go back to picking menus
if (keyboard_check_pressed(global.controls_back)) && (menu_button != -1) && (pressed_interact_timer == 0) && (obj_player_sal.in_text == 0) && (picking_item_for_party == 0) && (picking_weapon_for_party == 0) && (picking_armor_for_party == 0) {
	audio_play_sound(snd_cancel, 2, false, global.sound_volume * global.master_volume);
	menu_button = -1;
	obj_player_sal.hasControl = true;
	selected_menu = 0;
	made_draw_menu = 0;
	other_frame_sprite = spr_inv_frame;
	other_bg_sprite = spr_text_box_inv;
	scr_add_interaction_delay();
}

//closing with controls_back
if (keyboard_check_pressed(global.controls_back)) && (menu_button == -1) && (pressed_interact_timer == 0) && (obj_player_sal.hasControl == true) && (obj_player_sal.in_text == 0) && (picking_item_for_party == 0) && (picking_weapon_for_party == 0) && (picking_armor_for_party == 0)  {
	audio_play_sound(snd_cancel, 2, false, global.sound_volume * global.master_volume);
	obj_player_sal.in_inv = 0;
	obj_player_sal.opened_inv = false;
	instance_destroy(obj_item_menu);
}

switch (menu_button) {
	case 0:
		//items
		if (picking_item_for_party == 0) {
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
		}
		if (selected_item != -1) {
			//use an item
			if (keyboard_check_pressed(global.controls_interact)) && (obj_player_sal.in_text == 0) && (pressed_interact_timer == 0) {
				//global.inv_item[item_move_vertical].effect();
				audio_play_sound(snd_confirm, 2, false, global.sound_volume * global.master_volume);
				scr_add_interaction_delay()
				picking_item_for_party = 1;
			}
	
			//drop the item
			if (keyboard_check_pressed(global.controls_esc)) && (global.inv_item[item_move_vertical].can_drop == true) && (obj_player_sal.in_text == 0) && (pressed_interact_timer == 0) {
				audio_play_sound(snd_throw_away_item, 2, false, global.sound_volume * global.master_volume);
				array_delete(global.inv_item, global.inv_item[item_move_vertical], 1);
				scr_add_interaction_delay()
				picking_item_for_party = 0;
			}
		}
	
		if (picking_item_for_party == 1) {
			scr_select_party_item();
		}
		break;
	case 1:
		//weapons
		if (picking_weapon_for_party == 0) {
			item_move_vertical += keyboard_check_pressed(global.controls_down) - keyboard_check_pressed(global.controls_up);
			item_move_vertical = clamp(item_move_vertical, 0, array_length(global.inv_weapon) - 1);
	
			for (var i = 0; i < array_length(global.inv_weapon); i++) {
				var _xx = camera_get_view_x(view_camera[0]) + screen_border_x;
				var _yy = camera_get_view_y(view_camera[0]) + screen_border_y;
				if (item_move_vertical <= 4) {
					weapon_selection_frame_x = _xx
					weapon_selection_frame_y = _yy + sep * item_move_vertical;
				}
				if (item_move_vertical > 4) && (item_move_vertical <= 9) {
					weapon_selection_frame_x = _xx + next_column_offset;
					weapon_selection_frame_y = _yy + sep * (item_move_vertical - 5);
				}
				if (item_move_vertical > 9) && (item_move_vertical <= 14) {
					weapon_selection_frame_x = _xx + (next_column_offset * 2);
					weapon_selection_frame_y = _yy + sep * (item_move_vertical - 10);
				}
				if (item_move_vertical > 14) {
					weapon_selection_frame_x = _xx + (next_column_offset * 3);
					weapon_selection_frame_y = _yy + sep * (item_move_vertical - 15);
				}
		
				selected_item = item_move_vertical;
		
			}
		}
		if (selected_item != -1) {
			//use an item
			if (keyboard_check_pressed(global.controls_interact)) && (obj_player_sal.in_text == 0) && (pressed_interact_timer == 0) {
				//global.inv_item[item_move_vertical].effect();
				audio_play_sound(snd_confirm, 2, false, global.sound_volume * global.master_volume);
				scr_add_interaction_delay()
				picking_weapon_for_party = 1;
			}
	
			//drop the item
			if (keyboard_check_pressed(global.controls_esc)) && (obj_player_sal.in_text == 0) && (pressed_interact_timer == 0) {
				audio_play_sound(snd_throw_away_item, 2, false, global.sound_volume * global.master_volume);
				array_delete(global.inv_weapon, global.inv_weapon[item_move_vertical], 1);
				scr_add_interaction_delay()
				picking_weapon_for_party = 0;
			}
		}
	
		if (picking_weapon_for_party == 1) {
			scr_select_party_weapon();
		}
		break;
	case 2:
		//armor
		if (picking_armor_for_party == 0) {
			item_move_vertical += keyboard_check_pressed(global.controls_down) - keyboard_check_pressed(global.controls_up);
			item_move_vertical = clamp(item_move_vertical, 0, array_length(global.inv_armor) - 1);
	
			for (var i = 0; i < array_length(global.inv_armor); i++) {
				var _xx = camera_get_view_x(view_camera[0]) + screen_border_x;
				var _yy = camera_get_view_y(view_camera[0]) + screen_border_y;
				if (item_move_vertical <= 4) {
					armor_selection_frame_x = _xx
					armor_selection_frame_y = _yy + sep * item_move_vertical;
				}
				if (item_move_vertical > 4) && (item_move_vertical <= 9) {
					armor_selection_frame_x = _xx + next_column_offset;
					armor_selection_frame_y = _yy + sep * (item_move_vertical - 5);
				}
				if (item_move_vertical > 9) && (item_move_vertical <= 14) {
					armor_selection_frame_x = _xx + (next_column_offset * 2);
					armor_selection_frame_y = _yy + sep * (item_move_vertical - 10);
				}
				if (item_move_vertical > 14) {
					armor_selection_frame_x = _xx + (next_column_offset * 3);
					armor_selection_frame_y = _yy + sep * (item_move_vertical - 15);
				}
		
				selected_item = item_move_vertical;
		
			}
		}
		if (selected_item != -1) {
			//use an item
			if (keyboard_check_pressed(global.controls_interact)) && (obj_player_sal.in_text == 0) && (pressed_interact_timer == 0) {
				//global.inv_item[item_move_vertical].effect();
				audio_play_sound(snd_confirm, 2, false, global.sound_volume * global.master_volume);
				scr_add_interaction_delay()
				picking_armor_for_party = 1;
			}
	
			//drop the item
			if (keyboard_check_pressed(global.controls_esc)) && (obj_player_sal.in_text == 0) && (pressed_interact_timer == 0) {
				audio_play_sound(snd_throw_away_item, 2, false, global.sound_volume * global.master_volume);
				array_delete(global.inv_armor, global.inv_armor[item_move_vertical], 1);
				scr_add_interaction_delay()
				picking_armor_for_party = 0;
			}
		}
	
		if (picking_armor_for_party == 1) {
			scr_select_party_armor();
		}
		break;
	case 3:
		//key items
		item_move_vertical += keyboard_check_pressed(global.controls_down) - keyboard_check_pressed(global.controls_up);
		item_move_vertical = clamp(item_move_vertical, 0, array_length(global.inv_key) - 1);
	
		for (var i = 0; i < array_length(global.inv_key); i++) {
			var _xx = camera_get_view_x(view_camera[0]) + screen_border_x;
			var _yy = camera_get_view_y(view_camera[0]) + screen_border_y;
			if (item_move_vertical <= 4) {
				key_selection_frame_x = _xx
				key_selection_frame_y = _yy + sep * item_move_vertical;
			}
			if (item_move_vertical > 4) && (item_move_vertical <= 9) {
				key_selection_frame_x = _xx + next_column_offset;
				key_selection_frame_y = _yy + sep * (item_move_vertical - 5);
			}
			if (item_move_vertical > 9) && (item_move_vertical <= 14) {
				key_selection_frame_x = _xx + (next_column_offset * 2);
				key_selection_frame_y = _yy + sep * (item_move_vertical - 10);
			}
			if (item_move_vertical > 14) {
				key_selection_frame_x = _xx + (next_column_offset * 3);
				key_selection_frame_y = _yy + sep * (item_move_vertical - 15);
			}
		
			selected_item = item_move_vertical;
		
		}

		if (selected_item != -1) {
			//use an item
			if (keyboard_check_pressed(global.controls_interact)) && (obj_player_sal.in_text == 0) && (pressed_interact_timer == 0) {
				audio_play_sound(snd_confirm, 2, false, global.sound_volume * global.master_volume);
				scr_add_interaction_delay()
				global.inv_key[item_move_vertical].k_effect();
			}
			
			//drop the item
			if (keyboard_check_pressed(global.controls_esc)) && (global.inv_key[item_move_vertical].k_can_drop == true) && (obj_player_sal.in_text == 0) && (pressed_interact_timer == 0) {
				audio_play_sound(snd_throw_away_item, 2, false, global.sound_volume * global.master_volume);
				scr_add_interaction_delay()
				array_delete(global.inv_key, global.inv_key[item_move_vertical], 1);
			}
		}
		break;
}