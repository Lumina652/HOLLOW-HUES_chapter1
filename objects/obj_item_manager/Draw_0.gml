//drawing the inventory

draw_set_font(global.font_main);

for (var i = 0; i < array_length(inv); i++) {
	var _xx = camera_get_view_x(view_camera[0]) + screen_border_x;
	var _yy = camera_get_view_y(view_camera[0]) + screen_border_y;
	var _sep = camera_get_view_y(view_camera[0]) + sep;
	var _col = c_white
	
	//draw the icon
	draw_sprite(inv[i].icon, 0, _xx, _yy + _sep * i);
	
	//get "selected" color
	if (selected_item == i) {
		_col = c_yellow;
	}
	draw_set_color(_col);
	
	//name
	draw_text(_xx + 35, _yy + _sep * i + 4, inv[i].name);
	
	//description
	if (selected_item == i) {
		draw_text_ext(_xx + 5, _yy + _sep * 5 + 15, inv[i].description, 12, 180);
	}
	
	//reset text color to white
	draw_set_color(c_white);
}

