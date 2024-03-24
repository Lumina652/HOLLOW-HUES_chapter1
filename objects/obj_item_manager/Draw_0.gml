//drawing the inventory

draw_set_font(global.font_main);

for (var i = 0; i < array_length(inv_item); i++) {
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
		draw_sprite(inv_item[i].icon, 0, _xx1, _yy1 + _sep * i);
	
		//name
		draw_text(_xx1 + 35, _yy1 + _sep * i + 4, inv_item[i].name);
	}
	if (inv_item_step > 4) && (inv_item_step <= 9) {
		//draw the icon
		draw_sprite(inv_item[i].icon, 0, _xx2, _yy1 + _sep * (i - 5));
	
		//name
		draw_text(_xx2 + 35, _yy1 + _sep * (i - 5) + 4, inv_item[i].name);
	}
	if (inv_item_step > 9) && (inv_item_step <= 14) {
		//draw the icon
		draw_sprite(inv_item[i].icon, 0, _xx3, _yy1 + _sep * (i - 10));
	
		//name
		draw_text(_xx3 + 35, _yy1 + _sep * (i - 10) + 4, inv_item[i].name);
	}
	if (inv_item_step > 14) {
		//draw the icon
		draw_sprite(inv_item[i].icon, 0, _xx4, _yy1 + _sep * (i - 15));
	
		//name
		draw_text(_xx4 + 35, _yy1 + _sep * (i - 15) + 4, inv_item[i].name);
	}
	#endregion
	
	//description
	if (selected_item == i) {
		draw_text_ext(_xx1 + 6, _yy1 + _sep * 5 + 6, inv_item[i].description, 12, 190);
	}
	
	
	//reset text color to white
	draw_set_color(c_white);
	
}

show_debug_message(inv_item_step);