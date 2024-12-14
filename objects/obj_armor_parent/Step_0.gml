sprite_index = armor.a_ov_sprite;

if (keyboard_check_pressed(global.controls_interact)) {
	if (place_meeting(x, y, obj_interact)) && (obj_player_sal.hasControl == true) && (obj_player_sal.in_inv == false) {
		if (scr_armor_add(armor) == true) {
			alarm[0] = 2;
			obj_player_sal.hasControl = false;
		}
		else {
			alarm[1] = 2;
			obj_player_sal.hasControl = false;
		}
	}
}