if (!instance_exists(obj_text_box)) && (shop_keeper != 0) && (obj_player_sal.in_shop) {
	switch (shop_keeper) {
		case 1:
			if (once != 1) {
				scr_shop_make();
				once = 1;
				with (obj_shop_menu) {
					array_push(shop_item_list, global.shopLibrary.shop_burger);
					array_push(shop_item_list, global.shopLibrary.shop_burger);
					array_push(shop_item_list, global.shopLibrary.shop_burger);
					array_push(shop_item_list, global.shopLibrary.shop_mana_burg);
					array_push(shop_item_list, global.shopLibrary.shop_mana_burg);
					array_push(shop_item_list, global.shopLibrary.shop_mana_burg);
				}
			}
			break;
	}
}