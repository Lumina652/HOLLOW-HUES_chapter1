//get selected item
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
	if (mouse_check_button_pressed(mb_left)) {
		global.inv_item[selected_item].effect();	
	}
	
	//drop the item
	if (mouse_check_button_pressed(mb_right)) && (global.inv_item[selected_item].can_drop == true) {
		array_delete(global.inv_item, global.inv_item.selected_item, 1);	
	}
}

if (keyboard_key_press(global.controls_back)) {
	obj_player_sal.in_inv = false;
	obj_player_sal.hasControl = true;
	instance_destroy();
}