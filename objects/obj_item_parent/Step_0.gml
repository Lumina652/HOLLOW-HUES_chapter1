sprite_index = item.ov_sprite

if (keyboard_check_pressed(global.controls_interact)) {
	if (place_meeting(x, y, obj_interact)) && (obj_player_sal.hasControl == true) {
		if (scr_item_add(item) == true) {
			alarm[0] = 2;
			obj_player_sal.hasControl = false;
		}
	}
}