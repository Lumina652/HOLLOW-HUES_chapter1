//background and frame
var _bgx = camera_get_view_x(view_camera[0]);
var _bgy = camera_get_view_y(view_camera[0]);

bg_img += bg_speed; //make the animation run
draw_sprite_ext(other_bg_sprite, bg_img, _bgx, _bgy, bg_width, bg_height, 0, c_white, 0.7);
draw_sprite_ext(other_bg_sprite, bg_img, _bgx, _bgy, bg2_width, bg_height, 0, c_white, 0.7);
draw_sprite_ext(other_frame_sprite, 0, _bgx, _bgy, bg_width, bg_height, 0, c_white, 0.5);
draw_sprite_ext(other_frame_sprite, 0, _bgx, _bgy, bg2_width, bg_height, 0, c_white, 0.5);

//make stats of characters
scr_make_inventory_stats();

//Actual items or weapons ect.
if (made_draw_menu == 0) {
	switch (menu_button) {
		case 0:
			scr_make_inventory_menu_items();
			other_frame_sprite = spr_clear;
			other_bg_sprite = spr_clear;
			break;
		case 1:
			scr_make_inventory_menu_weapons();
			other_frame_sprite = spr_clear;
			other_bg_sprite = spr_clear;
			break;
		case 2:
			scr_make_inventory_menu_armor();
			other_frame_sprite = spr_clear;
			other_bg_sprite = spr_clear;
			break;
		case 3:
			scr_make_inventory_menu_key();
			other_frame_sprite = spr_clear;
			other_bg_sprite = spr_clear;
			break;
	}
}

//item, weapon, armor and key items buttons
draw_sprite_ext(button_bg_item, bg_img, button_x + _bgx, button_item_y + _bgy, button_width, button_height, 0, c_white, 1);
draw_sprite_ext(button_bg_weapon, bg_img, button_x + _bgx, button_weapon_y + _bgy, button_width, button_height, 0, c_white, 1);
draw_sprite_ext(button_bg_armor, bg_img, button_x + _bgx, button_armor_y + _bgy, button_width, button_height, 0, c_white, 1);
draw_sprite_ext(button_bg_key, bg_img, button_x + _bgx, button_key_y + _bgy, button_width, button_height, 0, c_white, 1);

draw_sprite_ext(button_item_icon, 0, button_x + _bgx, button_item_y + _bgy, 1, 1, 0, c_white, 1);
draw_sprite_ext(button_weapon_icon, 0, button_x + _bgx, button_weapon_y + _bgy, 1, 1, 0, c_white, 1);
draw_sprite_ext(button_armor_icon, 0, button_x + _bgx, button_armor_y + _bgy, 1, 1, 0, c_white, 1);
draw_sprite_ext(button_key_icon, 0, button_x + _bgx, button_key_y + _bgy, 1, 1, 0, c_white, 1);