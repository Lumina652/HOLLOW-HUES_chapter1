function scr_make_inventory_menu() {
	//drawing the inventory
	draw_set_font(global.font_main);

	#region ui elements
	//background and frame
	var _bgx = camera_get_view_x(view_camera[0]);
	var _bgy = camera_get_view_y(view_camera[0]);

	bg_img += bg_speed; //make the animation run
	draw_sprite_ext(bg_sprite, bg_img, _bgx, _bgy, bg_width, bg_height, 0, c_white, 0.5);
	draw_sprite_ext(bg_sprite, bg_img, _bgx, _bgy, bg2_width, bg_height, 0, c_white, 0.5);
	draw_sprite_ext(frame_sprite, 0, _bgx, _bgy, bg_width, bg_height, 0, c_white, 0.5);
	draw_sprite_ext(frame_sprite, 0, _bgx, _bgy, bg2_width, bg_height, 0, c_white, 0.5);

	//items bg
	var _xx1 = camera_get_view_x(view_camera[0]) + screen_border_x;
	var _xx2 = camera_get_view_x(view_camera[0]) + screen_border_x + next_column_offset;
	var _xx3 = camera_get_view_x(view_camera[0]) + screen_border_x + (next_column_offset * 2);
	var _xx4 = camera_get_view_x(view_camera[0]) + screen_border_x + (next_column_offset * 3);
	var _yy1 = camera_get_view_y(view_camera[0]) + screen_border_y;
	var _sep = camera_get_view_y(view_camera[0]) + sep;

	draw_sprite(bg_sprite, bg_img, _xx1, _yy1 + _sep * 0);
	draw_sprite(bg_sprite, bg_img, _xx1, _yy1 + _sep * 1);
	draw_sprite(bg_sprite, bg_img, _xx1, _yy1 + _sep * 2);
	draw_sprite(bg_sprite, bg_img, _xx1, _yy1 + _sep * 3);
	draw_sprite(bg_sprite, bg_img, _xx1, _yy1 + _sep * 4);

	draw_sprite(bg_sprite, bg_img, _xx2, _yy1 + _sep * 0);
	draw_sprite(bg_sprite, bg_img, _xx2, _yy1 + _sep * 1);
	draw_sprite(bg_sprite, bg_img, _xx2, _yy1 + _sep * 2);
	draw_sprite(bg_sprite, bg_img, _xx2, _yy1 + _sep * 3);
	draw_sprite(bg_sprite, bg_img, _xx2, _yy1 + _sep * 4);

	draw_sprite(bg_sprite, bg_img, _xx3, _yy1 + _sep * 0);
	draw_sprite(bg_sprite, bg_img, _xx3, _yy1 + _sep * 1);
	draw_sprite(bg_sprite, bg_img, _xx3, _yy1 + _sep * 2);
	draw_sprite(bg_sprite, bg_img, _xx3, _yy1 + _sep * 3);
	draw_sprite(bg_sprite, bg_img, _xx3, _yy1 + _sep * 4);

	draw_sprite(bg_sprite, bg_img, _xx4, _yy1 + _sep * 0);
	draw_sprite(bg_sprite, bg_img, _xx4, _yy1 + _sep * 1);
	draw_sprite(bg_sprite, bg_img, _xx4, _yy1 + _sep * 2);
	draw_sprite(bg_sprite, bg_img, _xx4, _yy1 + _sep * 3);
	draw_sprite(bg_sprite, bg_img, _xx4, _yy1 + _sep * 4);

	//names bg
	draw_sprite_ext(bg_sprite, bg_img, _xx1+ sep, _yy1 + _sep * 0, name_bg_width, 1, 0, c_white, 1);
	draw_sprite_ext(bg_sprite, bg_img, _xx1+ sep, _yy1 + _sep * 1, name_bg_width, 1, 0, c_white, 1);
	draw_sprite_ext(bg_sprite, bg_img, _xx1+ sep, _yy1 + _sep * 2, name_bg_width, 1, 0, c_white, 1);
	draw_sprite_ext(bg_sprite, bg_img, _xx1+ sep, _yy1 + _sep * 3, name_bg_width, 1, 0, c_white, 1);
	draw_sprite_ext(bg_sprite, bg_img, _xx1+ sep, _yy1 + _sep * 4, name_bg_width, 1, 0, c_white, 1);

	draw_sprite_ext(bg_sprite, bg_img, _xx2+ sep, _yy1 + _sep * 0, name_bg_width, 1, 0, c_white, 1);
	draw_sprite_ext(bg_sprite, bg_img, _xx2+ sep, _yy1 + _sep * 1, name_bg_width, 1, 0, c_white, 1);
	draw_sprite_ext(bg_sprite, bg_img, _xx2+ sep, _yy1 + _sep * 2, name_bg_width, 1, 0, c_white, 1);
	draw_sprite_ext(bg_sprite, bg_img, _xx2+ sep, _yy1 + _sep * 3, name_bg_width, 1, 0, c_white, 1);
	draw_sprite_ext(bg_sprite, bg_img, _xx2+ sep, _yy1 + _sep * 4, name_bg_width, 1, 0, c_white, 1);

	draw_sprite_ext(bg_sprite, bg_img, _xx3+ sep, _yy1 + _sep * 0, name_bg_width, 1, 0, c_white, 1);
	draw_sprite_ext(bg_sprite, bg_img, _xx3+ sep, _yy1 + _sep * 1, name_bg_width, 1, 0, c_white, 1);
	draw_sprite_ext(bg_sprite, bg_img, _xx3+ sep, _yy1 + _sep * 2, name_bg_width, 1, 0, c_white, 1);
	draw_sprite_ext(bg_sprite, bg_img, _xx3+ sep, _yy1 + _sep * 3, name_bg_width, 1, 0, c_white, 1);
	draw_sprite_ext(bg_sprite, bg_img, _xx3+ sep, _yy1 + _sep * 4, name_bg_width, 1, 0, c_white, 1);

	draw_sprite_ext(bg_sprite, bg_img, _xx4+ sep, _yy1 + _sep * 0, name_bg_width, 1, 0, c_white, 1);
	draw_sprite_ext(bg_sprite, bg_img, _xx4+ sep, _yy1 + _sep * 1, name_bg_width, 1, 0, c_white, 1);
	draw_sprite_ext(bg_sprite, bg_img, _xx4+ sep, _yy1 + _sep * 2, name_bg_width, 1, 0, c_white, 1);
	draw_sprite_ext(bg_sprite, bg_img, _xx4+ sep, _yy1 + _sep * 3, name_bg_width, 1, 0, c_white, 1);
	draw_sprite_ext(bg_sprite, bg_img, _xx4+ sep, _yy1 + _sep * 4, name_bg_width, 1, 0, c_white, 1);

	//description bg
	draw_sprite_ext(bg_sprite, bg_img, _xx1, _yy1 + _sep * 5, description_bg_width, description_bg_height, 0, c_white, 1);

	//item, weapon, armor and key items buttons

	draw_sprite_ext(button_bg, bg_img, button_x, button_item_y, button_width, button_height, 0, c_white, 1);
	draw_sprite_ext(button_bg, bg_img, button_x, button_weapon_y, button_width, button_height, 0, c_white, 1);
	draw_sprite_ext(button_bg, bg_img, button_x, button_armor_y, button_width, button_height, 0, c_white, 1);
	draw_sprite_ext(button_bg, bg_img, button_x, button_key_y, button_width, button_height, 0, c_white, 1);

	draw_sprite_ext(button_item_icon, 0, button_x, button_item_y, 1, 1, 0, c_white, 1);
	draw_sprite_ext(button_weapon_icon, 0, button_x, button_weapon_y, 1, 1, 0, c_white, 1);
	draw_sprite_ext(button_armor_icon, 0, button_x, button_armor_y, 1, 1, 0, c_white, 1);
	draw_sprite_ext(button_key_icon, 0, button_x, button_key_y, 1, 1, 0, c_white, 1);

	//portraits
	if (global.follower_count == 0) {
		draw_sprite_ext(button_unselected, bg_img, portrait_sal_x_1, portrait_y, portrait_scale, portrait_scale, 0, c_white, 1);
		draw_sprite(portrait_sal_sprite, 0, sal_x_1, portrait_people_y);
	}
	if (global.follower_count == 1) {
		draw_sprite_ext(button_unselected, bg_img, portrait_sal_x_2, portrait_y, portrait_scale, portrait_scale, 0, c_white, 1);
		draw_sprite_ext(portrait_rose, bg_img, portrait_other_x_2, portrait_y, portrait_scale, portrait_scale, 0, c_white, 1);
		draw_sprite(portrait_sal_sprite, 0, sal_x_2, portrait_people_y);
		draw_sprite(portrait_rose_sprite, 0, rose_x_2, portrait_people_y);
	}
	if (global.follower_count == 2) {
		draw_sprite_ext(button_unselected, bg_img, portrait_sal_x_3, portrait_y, portrait_scale, portrait_scale, 0, c_white, 1);
		draw_sprite_ext(portrait_rose, bg_img, portrait_other_x_3, portrait_y, portrait_scale, portrait_scale, 0, c_white, 1);
		draw_sprite_ext(portrait_hazel, bg_img, portrait_other2_x_3, portrait_y, portrait_scale, portrait_scale, 0, c_white, 1);
		draw_sprite(portrait_sal_sprite, 0, sal_x_3, portrait_people_y);
		draw_sprite(portrait_rose_sprite, 0, rose_x_3, portrait_people_y);
		draw_sprite(portrait_hazel_sprite, 0, hazel_x_3, portrait_people_y);
	}

	#endregion

	#region items, weapons, armor and key items
	
	//items
	for (var i = 0; i < array_length(global.inv_item); i++) {
		inv_item_step = i;
		var _xx1 = camera_get_view_x(view_camera[0]) + screen_border_x;
		var _xx2 = camera_get_view_x(view_camera[0]) + screen_border_x + next_column_offset;
		var _xx3 = camera_get_view_x(view_camera[0]) + screen_border_x + (next_column_offset * 2);
		var _xx4 = camera_get_view_x(view_camera[0]) + screen_border_x + (next_column_offset * 3);
	 	var _yy1 = camera_get_view_y(view_camera[0]) + screen_border_y;
		var _sep = camera_get_view_y(view_camera[0]) + sep;
		var _col = c_white
	
		//get "selected" color
		if (selected_item == i) {
			_col = c_yellow;
		}
		draw_set_color(_col);
	
		#region icon and name position
		if (inv_item_step <= 4) {
			//draw the icon
			draw_sprite(global.inv_item[i].icon, 0, _xx1, _yy1 + _sep * i);
	
			//name
			draw_text(_xx1 + 35, _yy1 + _sep * i + 4, global.inv_item[i].name);
		}
		if (inv_item_step > 4) && (inv_item_step <= 9) {
			//draw the icon
			draw_sprite(global.inv_item[i].icon, 0, _xx2, _yy1 + _sep * (i - 5));
	
			//name
			draw_text(_xx2 + 35, _yy1 + _sep * (i - 5) + 4, global.inv_item[i].name);
		}
		if (inv_item_step > 9) && (inv_item_step <= 14) {
			//draw the icon
			draw_sprite(global.inv_item[i].icon, 0, _xx3, _yy1 + _sep * (i - 10));
	
			//name
			draw_text(_xx3 + 35, _yy1 + _sep * (i - 10) + 4, global.inv_item[i].name);
		}
		if (inv_item_step > 14) {
			//draw the icon
			draw_sprite(global.inv_item[i].icon, 0, _xx4, _yy1 + _sep * (i - 15));
	
			//name
			draw_text(_xx4 + 35, _yy1 + _sep * (i - 15) + 4, global.inv_item[i].name);
		}
		#endregion
	
		//description
		if (selected_item == i) {
			draw_text_ext(_xx1 + 6, _yy1 + _sep * 5 + 6, global.inv_item[i].description, 12, 190);
		}
	
	
		//reset text color to white
		draw_set_color(c_white);
	
	}
	
	#endregion	
}