function scr_make_inventory_stats(){
	var _bgx = camera_get_view_x(view_camera[0]);
	var _bgy = camera_get_view_y(view_camera[0]);
	
	//rims
	draw_sprite_ext(other_frame_sprite_stats, 0, _bgx + 170, _bgy, 8.1, 11, 0, c_white, 0.5);
	draw_sprite_ext(other_frame_sprite_stats, 0, _bgx + 70, _bgy + 70, 13, 0.05, 0, c_white, 0.5);
	draw_sprite_ext(other_frame_sprite_stats, 0, _bgx + 70, _bgy + 140, 13, 0.05, 0, c_white, 0.5);
	
	//portraits
	if (global.follower_count == 0) {
		draw_sprite_ext(button_unselected, bg_img, stats_portrait_sal_x, stats_portrait_sal_y, portrait_scale, portrait_scale, 0, c_white, 1);
		draw_sprite(portrait_sal_sprite, 0, stats_sal_x, stats_sal_y);
		
		//WEAPON ICON
		if (obj_sal_stats.weapon_equiped != noone) {
			draw_sprite_ext(obj_sal_stats.weapon_equiped, 0, stats_weapon_icon_x, stats_sal_weapon_y, 1, 1, 0, c_white, 1);	
		}
		//ARMOR ICON
		if (obj_sal_stats.armor_equiped != noone) {
			draw_sprite_ext(obj_sal_stats.armor_equiped, 0, stats_weapon_icon_x + armor_offset_x, stats_sal_weapon_y, 1, 1, 0, c_white, 1);
		}
		
		//stats rims
		draw_sprite_ext(rim_sprite_bars, 0, rim_x, rim_hp_sal_y, rim_width, rim_height, 0, c_white, 1);
		draw_sprite_ext(rim_sprite_bars, 0, rim_x, rim_mana_sal_y, rim_width, rim_height, 0, c_white, 1);
		
		//HP AND MANA
		draw_sprite_ext(hp_sprite, 0, hp_x, hp_sal_y, (obj_sal_stats.hp/obj_sal_stats.hp_max) * hp_width, 1, 0, c_white, 1);
		draw_sprite_ext(mana_sprite, 0, mana_x, mana_sal_y, (obj_sal_stats.mana/obj_sal_stats.mana_max) * mana_width, 1, 0, c_white, 1);
	}
	if (global.follower_count == 1) {
		draw_sprite_ext(button_unselected, bg_img, stats_portrait_sal_x, stats_portrait_sal_y, portrait_scale, portrait_scale, 0, c_white, 1);
		draw_sprite_ext(portrait_rose, bg_img, stats_portrait_rose_x, stats_portrait_rose_y, portrait_scale, portrait_scale, 0, c_white, 1);
		draw_sprite(portrait_sal_sprite, 0, stats_sal_x, stats_sal_y);
		draw_sprite(portrait_rose_sprite, 0, stats_rose_x, stats_rose_y);
		
		//SAL
		//WEAPON ICON
		if (obj_sal_stats.weapon_equiped != noone) {
			draw_sprite_ext(obj_sal_stats.weapon_equiped, 0, stats_weapon_icon_x, stats_sal_weapon_y, 1, 1, 0, c_white, 1);	
		}
		//ARMOR ICON
		if (obj_sal_stats.armor_equiped != noone) {
			draw_sprite_ext(obj_sal_stats.armor_equiped, 0, stats_weapon_icon_x + armor_offset_x, stats_sal_weapon_y, 1, 1, 0, c_white, 1);
		}
		
		//ROSE
		//WEAPON ICON
		if (obj_rose_stats.weapon_equiped != noone) {
			draw_sprite_ext(obj_rose_stats.weapon_equiped, 0, stats_weapon_icon_x, stats_rose_weapon_y, 1, 1, 0, c_white, 1);	
		}
		//ARMOR ICON
		if (obj_rose_stats.armor_equiped != noone) {
			draw_sprite_ext(obj_rose_stats.armor_equiped, 0, stats_weapon_icon_x + armor_offset_x, stats_rose_weapon_y, 1, 1, 0, c_white, 1);
		}
		
		//stats rims
		draw_sprite_ext(rim_sprite_bars, 0, rim_x, rim_hp_sal_y, rim_width, rim_height, 0, c_white, 1);
		draw_sprite_ext(rim_sprite_bars, 0, rim_x, rim_mana_sal_y, rim_width, rim_height, 0, c_white, 1);
	
		draw_sprite_ext(rim_sprite_bars, 0, rim_x, rim_hp_rose_y, rim_width, rim_height, 0, c_white, 1);
		draw_sprite_ext(rim_sprite_bars, 0, rim_x, rim_mana_rose_y, rim_width, rim_height, 0, c_white, 1);
		
		//HP AND MANA
		draw_sprite_ext(hp_sprite, 0, hp_x, hp_sal_y, (obj_sal_stats.hp/obj_sal_stats.hp_max) * hp_width, 1, 0, c_white, 1);
		draw_sprite_ext(mana_sprite, 0, mana_x, mana_sal_y, (obj_sal_stats.mana/obj_sal_stats.mana_max) * mana_width, 1, 0, c_white, 1);
		
		draw_sprite_ext(hp_sprite, 0, hp_x, hp_rose_y, (obj_rose_stats.hp/obj_rose_stats.hp_max) * hp_width, 1, 0, c_white, 1);
		draw_sprite_ext(mana_sprite, 0, mana_x, mana_rose_y, (obj_rose_stats.mana/obj_rose_stats.mana_max) * mana_width, 1, 0, c_white, 1);
	}
	if (global.follower_count == 2) {
		draw_sprite_ext(button_unselected, bg_img, stats_portrait_sal_x, stats_portrait_sal_y, portrait_scale, portrait_scale, 0, c_white, 1);
		draw_sprite_ext(portrait_rose, bg_img, stats_portrait_rose_x, stats_portrait_rose_y, portrait_scale, portrait_scale, 0, c_white, 1);
		draw_sprite_ext(portrait_hazel, bg_img, stats_portrait_hazel_x, stats_portrait_hazel_y, portrait_scale, portrait_scale, 0, c_white, 1);
		draw_sprite(portrait_sal_sprite, 0, stats_sal_x, stats_sal_y);
		draw_sprite(portrait_rose_sprite, 0, stats_rose_x, stats_rose_y);
		draw_sprite(portrait_hazel_sprite, 0, stats_hazel_x, stats_hazel_y);
		
		//SAL
		//WEAPON ICON
		if (obj_sal_stats.weapon_equiped != noone) {
			draw_sprite_ext(obj_sal_stats.weapon_equiped, 0, stats_weapon_icon_x, stats_sal_weapon_y, 1, 1, 0, c_white, 1);	
		}
		//ARMOR ICON
		if (obj_sal_stats.armor_equiped != noone) {
			draw_sprite_ext(obj_sal_stats.armor_equiped, 0, stats_weapon_icon_x + armor_offset_x, stats_sal_weapon_y, 1, 1, 0, c_white, 1);
		}
		
		//ROSE
		//WEAPON ICON
		if (obj_rose_stats.weapon_equiped != noone) {
			draw_sprite_ext(obj_rose_stats.weapon_equiped, 0, stats_weapon_icon_x, stats_rose_weapon_y, 1, 1, 0, c_white, 1);	
		}
		//ARMOR ICON
		if (obj_rose_stats.armor_equiped != noone) {
			draw_sprite_ext(obj_rose_stats.armor_equiped, 0, stats_weapon_icon_x + armor_offset_x, stats_rose_weapon_y, 1, 1, 0, c_white, 1);
		}
		
		//HAZEL
		//WEAPON ICON
		if (obj_hazel_stats.weapon_equiped != noone) {
			draw_sprite_ext(obj_hazel_stats.weapon_equiped, 0, stats_weapon_icon_x, stats_hazel_weapon_y, 1, 1, 0, c_white, 1);	
		}
		//ARMOR ICON
		if (obj_hazel_stats.armor_equiped != noone) {
			draw_sprite_ext(obj_hazel_stats.armor_equiped, 0, stats_weapon_icon_x + armor_offset_x, stats_hazel_weapon_y, 1, 1, 0, c_white, 1);
		}
		
		//stats rims
		draw_sprite_ext(rim_sprite_bars, 0, rim_x, rim_hp_sal_y, rim_width, rim_height, 0, c_white, 1);
		draw_sprite_ext(rim_sprite_bars, 0, rim_x, rim_mana_sal_y, rim_width, rim_height, 0, c_white, 1);
	
		draw_sprite_ext(rim_sprite_bars, 0, rim_x, rim_hp_rose_y, rim_width, rim_height, 0, c_white, 1);
		draw_sprite_ext(rim_sprite_bars, 0, rim_x, rim_mana_rose_y, rim_width, rim_height, 0, c_white, 1);
	
		draw_sprite_ext(rim_sprite_bars, 0, rim_x, rim_hp_hazel_y, rim_width, rim_height, 0, c_white, 1);
		draw_sprite_ext(rim_sprite_bars, 0, rim_x, rim_mana_hazel_y, rim_width, rim_height, 0, c_white, 1);
		
		//HP AND MANA
		draw_sprite_ext(hp_sprite, 0, hp_x, hp_sal_y, (obj_sal_stats.hp/obj_sal_stats.hp_max) * hp_width, 1, 0, c_white, 1);
		draw_sprite_ext(mana_sprite, 0, mana_x, mana_sal_y, (obj_sal_stats.mana/obj_sal_stats.mana_max) * mana_width, 1, 0, c_white, 1);
		
		draw_sprite_ext(hp_sprite, 0, hp_x, hp_rose_y, (obj_rose_stats.hp/obj_rose_stats.hp_max) * hp_width, 1, 0, c_white, 1);
		draw_sprite_ext(mana_sprite, 0, mana_x, mana_rose_y, (obj_rose_stats.mana/obj_rose_stats.mana_max) * mana_width, 1, 0, c_white, 1);
		
		draw_sprite_ext(hp_sprite, 0, hp_x, hp_hazel_y, (obj_hazel_stats.hp/obj_hazel_stats.hp_max) * hp_width, 1, 0, c_white, 1);
		draw_sprite_ext(mana_sprite, 0, mana_x, mana_hazel_y, (obj_hazel_stats.mana/obj_hazel_stats.mana_max) * mana_width, 1, 0, c_white, 1);
	}	
		
	
}