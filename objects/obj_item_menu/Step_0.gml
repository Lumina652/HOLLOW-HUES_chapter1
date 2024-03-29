//get selected item //selected_item = i;
selected_item = -1;

for (var i = 0; i < array_length(global.inv_item); i++) {
	var _xx = camera_get_view_x(view_camera[0]) + screen_border_x;
	var _yy = camera_get_view_y(view_camera[0]) + screen_border_y + sep * i;
	
	if (mouse_x > _xx && mouse_x < _xx + 20 && mouse_y > _yy && mouse_y < _yy + 20) {
		selected_item = i;
	}
}

if (selected_item != -1) {
	//use an item
	if (keyboard_check_pressed(global.controls_interact)) {
		scr_create_textbox(global.inv_item[selected_item].used_text);
		global.inv_item[selected_item].effect();
	}
	
	//drop the item
	if (keyboard_check_pressed(global.controls_back)) && (global.inv_item[selected_item].can_drop == true) {
		array_delete(global.inv_item, global.inv_item[selected_item], 1);
	}
}