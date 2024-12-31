shop_current_item_list += keyboard_check_pressed(global.controls_down) - keyboard_check_pressed(global.controls_up);
shop_current_item_list = clamp(shop_current_item_list, 0, array_length(shop_item_list) - 1);

if (keyboard_check_pressed(global.controls_down)) || (keyboard_check_pressed(global.controls_up)) {
	audio_play_sound(snd_select, 1, false, global.sound_volume * global.master_volume);
}

if (keyboard_check_pressed(global.controls_interact)) {
	switch (shop_item_list[shop_current_item_list].inv) {
		case SHOP_WHICH_INV.ITEM:
			if (shop_item_list[shop_current_item_list].cost <= global.party_money) && (array_length(global.inv_item) < obj_item_manager.inv_max) {
				scr_shop_buy_item(global.inv_item, shop_item_list[shop_current_item_list]);	
				audio_play_sound(snd_malachi_teleport, 10, false, global.sound_volume * global.master_volume);
				array_delete(shop_item_list, shop_current_item_list, 1);
				shop_current_item_list = 0;
			}
			else {
				audio_play_sound(snd_cancel, 10, false, global.sound_volume * global.master_volume);
			}
			break;
		case SHOP_WHICH_INV.WEAPON:
			if (shop_item_list[shop_current_item_list].cost <= global.party_money) && (array_length(global.inv_weapon) < obj_item_manager.inv_max) {
				scr_shop_buy_item(global.inv_weapon, shop_item_list[shop_current_item_list]);	
				audio_play_sound(snd_malachi_teleport, 10, false, global.sound_volume * global.master_volume);
				array_delete(shop_item_list, shop_current_item_list, 1);
				shop_current_item_list = 0;
			}
			else {
				audio_play_sound(snd_cancel, 10, false, global.sound_volume * global.master_volume);
			}
			break;
		case SHOP_WHICH_INV.ARMOR:
			if (shop_item_list[shop_current_item_list].cost <= global.party_money) && (array_length(global.inv_armor) < obj_item_manager.inv_max) {
				scr_shop_buy_item(global.inv_armor, shop_item_list[shop_current_item_list]);	
				audio_play_sound(snd_malachi_teleport, 10, false, global.sound_volume * global.master_volume);
				array_delete(shop_item_list, shop_current_item_list, 1);
				shop_current_item_list = 0;
			}
			else {
				audio_play_sound(snd_cancel, 10, false, global.sound_volume * global.master_volume);
			}
			break;
		case SHOP_WHICH_INV.KEY:
			if (shop_item_list[shop_current_item_list].cost <= global.party_money) && (array_length(global.inv_key) < obj_item_manager.inv_max) {
				scr_shop_buy_item(global.inv_key, shop_item_list[shop_current_item_list]);	
				audio_play_sound(snd_malachi_teleport, 10, false, global.sound_volume * global.master_volume);
				array_delete(shop_item_list, shop_current_item_list, 1);
				shop_current_item_list = 0;
			}
			else {
				audio_play_sound(snd_cancel, 10, false, global.sound_volume * global.master_volume);
			}
			break;
	}
}

if (keyboard_check_pressed(global.controls_back)) || (array_length(shop_item_list) <= 0) {
	obj_player_sal.hasControl = true;
	obj_player_sal.in_shop = false;
	instance_destroy();	
}