function scr_make_inventory_stats(){
	scr_draw_set_text(c_white, global.font_main, fa_left, fa_top);
	
	var _bgx = camera_get_view_x(view_camera[0]);
	var _bgy = camera_get_view_y(view_camera[0]);
	
	//rims
	draw_sprite_ext(other_frame_sprite_stats, 0, _bgx + 170, _bgy, 8.1, 11, 0, c_white, 0.5);
	draw_sprite_ext(other_frame_sprite_stats, 0, _bgx + 70, _bgy + 70, 13, 0.05, 0, c_white, 0.5);
	draw_sprite_ext(other_frame_sprite_stats, 0, _bgx + 70, _bgy + 140, 13, 0.05, 0, c_white, 0.5);
	
	//portraits
	switch (global.follower_count) {
		case 0:
			draw_sprite_ext(button_unselected, bg_img, stats_portrait_sal_x + _bgx, stats_portrait_sal_y + _bgy, portrait_scale, portrait_scale, 0, c_white, 1);
			draw_sprite(portrait_sal_sprite, 0, stats_sal_x + _bgx, stats_sal_y + _bgy);
		
			//WEAPON ICON
			if (obj_sal_stats.weapon_equiped != noone) {
				draw_sprite_ext(obj_sal_stats.weapon_equiped, 0, stats_weapon_icon_x + _bgx, stats_sal_weapon_y + _bgy, 1, 1, 0, c_white, 1);	
			}
			//ARMOR ICON
			if (obj_sal_stats.armor_equiped != noone) {
				draw_sprite_ext(obj_sal_stats.armor_equiped, 0, stats_weapon_icon_x + armor_offset_x + _bgx, stats_sal_weapon_y + _bgy, 1, 1, 0, c_white, 1);
			}
		
			//stats rims
			draw_sprite_ext(rim_sprite_bars, 0, rim_x + _bgx, rim_hp_sal_y + _bgy, rim_width, rim_height, 0, c_white, 1);
			draw_sprite_ext(rim_sprite_bars, 0, rim_x + _bgx, rim_mana_sal_y + _bgy, rim_width, rim_height, 0, c_white, 1);
		
			//HP AND MANA
			draw_sprite_ext(hp_sprite, 0, hp_x + _bgx, hp_sal_y + _bgy, (obj_sal_stats.hp/obj_sal_stats.hp_max) * hp_width, 1, 0, c_white, 1);
			draw_sprite_ext(mana_sprite, 0, mana_x + _bgx, mana_sal_y + _bgy, (obj_sal_stats.mana/obj_sal_stats.mana_max) * mana_width, 1, 0, c_white, 1);
		
			//ATTACK AND DEFENSE MENU
			draw_sprite_ext(button_unselected, bg_img, attdef_sal_x + _bgx, attdef_sal_y + _bgy, attdef_sal_width, attdef_sal_height, 0, c_white, 1);
			//ATTACK
			draw_text_ext_transformed(attdef_sal_attack_x + _bgx, attdef_sal_attack_y + _bgy, "ATK", 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(attdef_sal_attack_val_x + _bgx, attdef_sal_attack_val_y + _bgy, string(obj_sal_stats.dmg), 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			//DEFENSE
			draw_text_ext_transformed(attdef_sal_attack_x + _bgx, attdef_sal_defense_y + _bgy, "DEF", 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(attdef_sal_attack_val_x + _bgx, attdef_sal_defense_val_y + _bgy, string(obj_sal_stats.def), 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
	
			//HP AND MANA TEXT
			// "/"
			draw_text_ext_transformed(stats_slash_x + _bgx, stats_slash_sal_y + _bgy, "/", 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(stats_slash_x + _bgx, stats_slash_sal_y + stats_slash_mana_offset + _bgy, "/", 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			// MAX COUNTER
			draw_text_ext_transformed(stats_maxcounter_x + _bgx, stats_slash_sal_y + _bgy, string(obj_sal_stats.hp_max), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(stats_maxcounter_x + _bgx, stats_slash_sal_y + stats_slash_mana_offset + _bgy, string(obj_sal_stats.mana_max), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			// CURRENT COUNTER
			draw_text_ext_transformed(stats_currentcounter_x + _bgx, stats_slash_sal_y + _bgy, string(obj_sal_stats.hp), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(stats_currentcounter_x + _bgx, stats_slash_sal_y + stats_slash_mana_offset + _bgy, string(obj_sal_stats.mana), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			break;
		case 1:
			draw_sprite_ext(button_unselected, bg_img, stats_portrait_sal_x + _bgx, stats_portrait_sal_y + _bgy, portrait_scale, portrait_scale, 0, c_white, 1);
			draw_sprite_ext(portrait_rose, bg_img, stats_portrait_rose_x + _bgx, stats_portrait_rose_y + _bgy, portrait_scale, portrait_scale, 0, c_white, 1);
			draw_sprite(portrait_sal_sprite, 0, stats_sal_x + _bgx, stats_sal_y + _bgy);
			draw_sprite(portrait_rose_sprite, 0, stats_rose_x + _bgx, stats_rose_y + _bgy);
		
			//SAL
			//WEAPON ICON
			if (obj_sal_stats.weapon_equiped != noone) {
				draw_sprite_ext(obj_sal_stats.weapon_equiped, 0, stats_weapon_icon_x + _bgx, stats_sal_weapon_y + _bgy, 1, 1, 0, c_white, 1);	
			}
			//ARMOR ICON
			if (obj_sal_stats.armor_equiped != noone) {
				draw_sprite_ext(obj_sal_stats.armor_equiped, 0, stats_weapon_icon_x + armor_offset_x + _bgx, stats_sal_weapon_y + _bgy, 1, 1, 0, c_white, 1);
			}
		
			//ROSE
			//WEAPON ICON
			if (obj_rose_stats.weapon_equiped != noone) {
				draw_sprite_ext(obj_rose_stats.weapon_equiped, 0, stats_weapon_icon_x + _bgx, stats_rose_weapon_y + _bgy, 1, 1, 0, c_white, 1);	
			}
			//ARMOR ICON
			if (obj_rose_stats.armor_equiped != noone) {
				draw_sprite_ext(obj_rose_stats.armor_equiped, 0, stats_weapon_icon_x + armor_offset_x + _bgx, stats_rose_weapon_y + _bgy, 1, 1, 0, c_white, 1);
			}
		
			//stats rims
			draw_sprite_ext(rim_sprite_bars, 0, rim_x + _bgx, rim_hp_sal_y + _bgy, rim_width, rim_height, 0, c_white, 1);
			draw_sprite_ext(rim_sprite_bars, 0, rim_x + _bgx, rim_mana_sal_y + _bgy, rim_width, rim_height, 0, c_white, 1);
	
			draw_sprite_ext(rim_sprite_bars, 0, rim_x + _bgx, rim_hp_rose_y + _bgy, rim_width, rim_height, 0, c_white, 1);
			draw_sprite_ext(rim_sprite_bars, 0, rim_x + _bgx, rim_mana_rose_y + _bgy, rim_width, rim_height, 0, c_white, 1);
		
			//HP AND MANA
			draw_sprite_ext(hp_sprite, 0, hp_x + _bgx, hp_sal_y + _bgy, (obj_sal_stats.hp/obj_sal_stats.hp_max) * hp_width, 1, 0, c_white, 1);
			draw_sprite_ext(mana_sprite, 0, mana_x + _bgx, mana_sal_y + _bgy, (obj_sal_stats.mana/obj_sal_stats.mana_max) * mana_width, 1, 0, c_white, 1);
		
			draw_sprite_ext(hp_sprite, 0, hp_x + _bgx, hp_rose_y + _bgy, (obj_rose_stats.hp/obj_rose_stats.hp_max) * hp_width, 1, 0, c_white, 1);
			draw_sprite_ext(mana_sprite, 0, mana_x + _bgx, mana_rose_y + _bgy, (obj_rose_stats.mana/obj_rose_stats.mana_max) * mana_width, 1, 0, c_white, 1);
		
			//SAL
			//ATTACK AND DEFENSE MENU
			draw_sprite_ext(button_unselected, bg_img, attdef_sal_x + _bgx, attdef_sal_y + _bgy, attdef_sal_width, attdef_sal_height, 0, c_white, 1);
			//ATTACK
			draw_text_ext_transformed(attdef_sal_attack_x + _bgx, attdef_sal_attack_y + _bgy, "ATK", 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(attdef_sal_attack_val_x + _bgx, attdef_sal_attack_val_y + _bgy, string(obj_sal_stats.dmg), 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			//DEFENSE 
			draw_text_ext_transformed(attdef_sal_attack_x + _bgx, attdef_sal_defense_y + _bgy, "DEF", 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(attdef_sal_attack_val_x + _bgx, attdef_sal_defense_val_y + _bgy, string(obj_sal_stats.def), 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
		
			//ROSE
			//ATTACK AND DEFENSE MENU
			draw_sprite_ext(portrait_rose, bg_img, attdef_sal_x + _bgx, attdef_rose_y + _bgy, attdef_sal_width, attdef_sal_height, 0, c_white, 1);
			//ATTACK
			draw_text_ext_transformed(attdef_sal_attack_x + _bgx, attdef_rose_attack_y + _bgy, "ATK", 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(attdef_sal_attack_val_x + _bgx, attdef_rose_attack_val_y + _bgy, string(obj_rose_stats.dmg), 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			//DEFENSE
			draw_text_ext_transformed(attdef_sal_attack_x + _bgx, attdef_rose_defense_y + _bgy, "DEF", 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(attdef_sal_attack_val_x + _bgx, attdef_rose_defense_val_y + _bgy, string(obj_rose_stats.def), 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
		
			//HP AND MANA TEXT
		
			//SAL
			// "/"
			draw_text_ext_transformed(stats_slash_x + _bgx, stats_slash_sal_y + _bgy, "/", 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(stats_slash_x + _bgx, stats_slash_sal_y + stats_slash_mana_offset + _bgy, "/", 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			// MAX COUNTER
			draw_text_ext_transformed(stats_maxcounter_x + _bgx, stats_slash_sal_y + _bgy, string(obj_sal_stats.hp_max), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(stats_maxcounter_x + _bgx, stats_slash_sal_y + stats_slash_mana_offset + _bgy, string(obj_sal_stats.mana_max), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			// CURRENT COUNTER
			draw_text_ext_transformed(stats_currentcounter_x + _bgx, stats_slash_sal_y + _bgy, string(obj_sal_stats.hp), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(stats_currentcounter_x + _bgx, stats_slash_sal_y + stats_slash_mana_offset + _bgy, string(obj_sal_stats.mana), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
		
			//ROSE
			// "/"
			draw_text_ext_transformed(stats_slash_x + _bgx, stats_slash_rose_y + _bgy, "/", 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(stats_slash_x + _bgx, stats_slash_rose_y + stats_slash_mana_offset + _bgy, "/", 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			// MAX COUNTER
			draw_text_ext_transformed(stats_maxcounter_x + _bgx, stats_slash_rose_y + _bgy, string(obj_rose_stats.hp_max), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(stats_maxcounter_x + _bgx, stats_slash_rose_y + stats_slash_mana_offset + _bgy, string(obj_rose_stats.mana_max), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			// CURRENT COUNTER
			draw_text_ext_transformed(stats_currentcounter_x + _bgx, stats_slash_rose_y + _bgy, string(obj_rose_stats.hp), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(stats_currentcounter_x + _bgx, stats_slash_rose_y + stats_slash_mana_offset + _bgy, string(obj_rose_stats.mana), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			break;
		case 2:
			draw_sprite_ext(button_unselected, bg_img, stats_portrait_sal_x + _bgx, stats_portrait_sal_y + _bgy, portrait_scale, portrait_scale, 0, c_white, 1);
			draw_sprite_ext(portrait_rose, bg_img, stats_portrait_rose_x + _bgx, stats_portrait_rose_y + _bgy, portrait_scale, portrait_scale, 0, c_white, 1);
			draw_sprite_ext(portrait_hazel, bg_img, stats_portrait_hazel_x + _bgx, stats_portrait_hazel_y + _bgy, portrait_scale, portrait_scale, 0, c_white, 1);
			draw_sprite(portrait_sal_sprite, 0, stats_sal_x + _bgx, stats_sal_y + _bgy);
			draw_sprite(portrait_rose_sprite, 0, stats_rose_x + _bgx, stats_rose_y + _bgy);
			draw_sprite(portrait_hazel_sprite, 0, stats_hazel_x + _bgx, stats_hazel_y + _bgy);
		
			//SAL
			//WEAPON ICON
			if (obj_sal_stats.weapon_equiped != noone) {
				draw_sprite_ext(obj_sal_stats.weapon_equiped, 0, stats_weapon_icon_x + _bgx, stats_sal_weapon_y + _bgy, 1, 1, 0, c_white, 1);	
			}
			//ARMOR ICON
			if (obj_sal_stats.armor_equiped != noone) {
				draw_sprite_ext(obj_sal_stats.armor_equiped, 0, stats_weapon_icon_x + armor_offset_x + _bgx, stats_sal_weapon_y + _bgy, 1, 1, 0, c_white, 1);
			}
		
			//ROSE
			//WEAPON ICON
			if (obj_rose_stats.weapon_equiped != noone) {
				draw_sprite_ext(obj_rose_stats.weapon_equiped, 0, stats_weapon_icon_x + _bgx, stats_rose_weapon_y + _bgy, 1, 1, 0, c_white, 1);	
			}
			//ARMOR ICON
			if (obj_rose_stats.armor_equiped != noone) {
				draw_sprite_ext(obj_rose_stats.armor_equiped, 0, stats_weapon_icon_x + armor_offset_x + _bgx, stats_rose_weapon_y + _bgy, 1, 1, 0, c_white, 1);
			}
		
			//HAZEL
			//WEAPON ICON
			if (obj_hazel_stats.weapon_equiped != noone) {
				draw_sprite_ext(obj_hazel_stats.weapon_equiped, 0, stats_weapon_icon_x + _bgx, stats_hazel_weapon_y + _bgy, 1, 1, 0, c_white, 1);	
			}
			//ARMOR ICON
			if (obj_hazel_stats.armor_equiped != noone) {
				draw_sprite_ext(obj_hazel_stats.armor_equiped, 0, stats_weapon_icon_x + armor_offset_x + _bgx, stats_hazel_weapon_y + _bgy, 1, 1, 0, c_white, 1);
			}
		
			//stats rims
			draw_sprite_ext(rim_sprite_bars, 0, rim_x + _bgx, rim_hp_sal_y + _bgy, rim_width, rim_height, 0, c_white, 1);
			draw_sprite_ext(rim_sprite_bars, 0, rim_x + _bgx, rim_mana_sal_y + _bgy, rim_width, rim_height, 0, c_white, 1);
	
			draw_sprite_ext(rim_sprite_bars, 0, rim_x + _bgx, rim_hp_rose_y + _bgy, rim_width, rim_height, 0, c_white, 1);
			draw_sprite_ext(rim_sprite_bars, 0, rim_x + _bgx, rim_mana_rose_y + _bgy, rim_width, rim_height, 0, c_white, 1);
	
			draw_sprite_ext(rim_sprite_bars, 0, rim_x + _bgx, rim_hp_hazel_y + _bgy, rim_width, rim_height, 0, c_white, 1);
			draw_sprite_ext(rim_sprite_bars, 0, rim_x + _bgx, rim_mana_hazel_y + _bgy, rim_width, rim_height, 0, c_white, 1);
		
			//HP AND MANA
			draw_sprite_ext(hp_sprite, 0, hp_x + _bgx, hp_sal_y + _bgy, (obj_sal_stats.hp/obj_sal_stats.hp_max) * hp_width, 1, 0, c_white, 1);
			draw_sprite_ext(mana_sprite, 0, mana_x + _bgx, mana_sal_y + _bgy, (obj_sal_stats.mana/obj_sal_stats.mana_max) * mana_width, 1, 0, c_white, 1);
		
			draw_sprite_ext(hp_sprite, 0, hp_x + _bgx, hp_rose_y + _bgy, (obj_rose_stats.hp/obj_rose_stats.hp_max) * hp_width, 1, 0, c_white, 1);
			draw_sprite_ext(mana_sprite, 0, mana_x + _bgx, mana_rose_y + _bgy, (obj_rose_stats.mana/obj_rose_stats.mana_max) * mana_width, 1, 0, c_white, 1);
		
			draw_sprite_ext(hp_sprite, 0, hp_x + _bgx, hp_hazel_y + _bgy, (obj_hazel_stats.hp/obj_hazel_stats.hp_max) * hp_width, 1, 0, c_white, 1);
			draw_sprite_ext(mana_sprite, 0, mana_x + _bgx, mana_hazel_y + _bgy, (obj_hazel_stats.mana/obj_hazel_stats.mana_max) * mana_width, 1, 0, c_white, 1);
		
			//SAL
			//ATTACK AND DEFENSE MENU
			draw_sprite_ext(button_unselected, bg_img, attdef_sal_x + _bgx, attdef_sal_y + _bgy, attdef_sal_width, attdef_sal_height, 0, c_white, 1);
			//ATTACK
			draw_text_ext_transformed(attdef_sal_attack_x + _bgx, attdef_sal_attack_y + _bgy, "ATK", 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(attdef_sal_attack_val_x + _bgx, attdef_sal_attack_val_y + _bgy, string(obj_sal_stats.dmg), 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			//DEFENSE
			draw_text_ext_transformed(attdef_sal_attack_x + _bgx, attdef_sal_defense_y + _bgy, "DEF", 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(attdef_sal_attack_val_x + _bgx, attdef_sal_defense_val_y + _bgy, string(obj_sal_stats.def), 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
		
			//ROSE
			//ATTACK AND DEFENSE MENU
			draw_sprite_ext(portrait_rose, bg_img, attdef_sal_x + _bgx, attdef_rose_y + _bgy, attdef_sal_width, attdef_sal_height, 0, c_white, 1);
			//ATTACK
			draw_text_ext_transformed(attdef_sal_attack_x + _bgx, attdef_rose_attack_y + _bgy, "ATK", 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(attdef_sal_attack_val_x + _bgx, attdef_rose_attack_val_y + _bgy, string(obj_rose_stats.dmg), 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			//DEFENSE
			draw_text_ext_transformed(attdef_sal_attack_x + _bgx, attdef_rose_defense_y + _bgy, "DEF", 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(attdef_sal_attack_val_x + _bgx, attdef_rose_defense_val_y + _bgy, string(obj_rose_stats.def), 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
		
			//HAZEL
			//ATTACK AND DEFENSE MENU
			draw_sprite_ext(portrait_hazel, bg_img, attdef_sal_x + _bgx, attdef_hazel_y + _bgy, attdef_sal_width, attdef_sal_height, 0, c_white, 1);
			//ATTACK
			draw_text_ext_transformed(attdef_sal_attack_x + _bgx, attdef_hazel_attack_y + _bgy, "ATK", 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(attdef_sal_attack_val_x + _bgx, attdef_hazel_attack_val_y + _bgy, string(obj_hazel_stats.dmg), 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			//DEFENSE
			draw_text_ext_transformed(attdef_sal_attack_x + _bgx, attdef_hazel_defense_y + _bgy, "DEF", 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(attdef_sal_attack_val_x + _bgx, attdef_hazel_defense_val_y + _bgy, string(obj_hazel_stats.def), 0, 43, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
		
			//HP AND MANA TEXT
		
			//SAL
			// "/"
			draw_text_ext_transformed(stats_slash_x + _bgx, stats_slash_sal_y + _bgy, "/", 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(stats_slash_x + _bgx, stats_slash_sal_y + stats_slash_mana_offset + _bgy, "/", 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			// MAX COUNTER
			draw_text_ext_transformed(stats_maxcounter_x + _bgx, stats_slash_sal_y + _bgy, string(obj_sal_stats.hp_max), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(stats_maxcounter_x + _bgx, stats_slash_sal_y + stats_slash_mana_offset + _bgy, string(obj_sal_stats.mana_max), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			// CURRENT COUNTER
			draw_text_ext_transformed(stats_currentcounter_x + _bgx, stats_slash_sal_y + _bgy, string(obj_sal_stats.hp), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(stats_currentcounter_x + _bgx, stats_slash_sal_y + stats_slash_mana_offset + _bgy, string(obj_sal_stats.mana), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
		
			//ROSE
			// "/"
			draw_text_ext_transformed(stats_slash_x + _bgx, stats_slash_rose_y + _bgy, "/", 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(stats_slash_x + _bgx, stats_slash_rose_y + stats_slash_mana_offset + _bgy, "/", 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			// MAX COUNTER
			draw_text_ext_transformed(stats_maxcounter_x + _bgx, stats_slash_rose_y + _bgy, string(obj_rose_stats.hp_max), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(stats_maxcounter_x + _bgx, stats_slash_rose_y + stats_slash_mana_offset + _bgy, string(obj_rose_stats.mana_max), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			// CURRENT COUNTER
			draw_text_ext_transformed(stats_currentcounter_x + _bgx, stats_slash_rose_y + _bgy, string(obj_rose_stats.hp), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(stats_currentcounter_x + _bgx, stats_slash_rose_y + stats_slash_mana_offset + _bgy, string(obj_rose_stats.mana), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
		
			//HAZEL
			// "/"
			draw_text_ext_transformed(stats_slash_x + _bgx, stats_slash_hazel_y + _bgy, "/", 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(stats_slash_x + _bgx, stats_slash_hazel_y + stats_slash_mana_offset + _bgy, "/", 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			// MAX COUNTER
			draw_text_ext_transformed(stats_maxcounter_x + _bgx, stats_slash_hazel_y + _bgy, string(obj_hazel_stats.hp_max), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(stats_maxcounter_x + _bgx, stats_slash_hazel_y + stats_slash_mana_offset + _bgy, string(obj_hazel_stats.mana_max), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			// CURRENT COUNTER
			draw_text_ext_transformed(stats_currentcounter_x + _bgx, stats_slash_hazel_y + _bgy, string(obj_hazel_stats.hp), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			draw_text_ext_transformed(stats_currentcounter_x + _bgx, stats_slash_hazel_y + stats_slash_mana_offset + _bgy, string(obj_hazel_stats.mana), 0, stats_slash_w, attdef_sal_attack_scale, attdef_sal_attack_scale, 0);
			break;
	}
}