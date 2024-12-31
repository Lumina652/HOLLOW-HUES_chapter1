if (keyboard_check_pressed(global.controls_interact)) {
	if (place_meeting(x, y, obj_interact)) && (obj_player_sal.hasControl == true) && (!instance_exists(obj_item_menu)) {
		alarm[0] = 2;
		obj_player_sal.hasControl = false;
	}
}