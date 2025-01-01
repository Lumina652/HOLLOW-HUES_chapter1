if (!obj_player_sal.in_cutscene) {
	if (page >= page_number - 1) && (option_number <= 0) {
		obj_player_sal.hasControl = true;
		obj_player_sal.in_text = 0;
	}
}
else {
	if (page >= page_number - 1) && (option_number <= 0) {
		scr_textbox_cutscene_destroy();
	}
}

//if (obj_player_sal.in_shop) {
//	switch (obj_player_sal.shop_keeper) {
//		case obj_shop_keeper_parent:
//			if (page >= page_number - 1) && (option_number <= 0) {
//				scr_shop_make();
//				with (obj_shop_menu) {
//					array_push(shop_item_list, global.shopLibrary.shop_burger);
//					array_push(shop_item_list, global.shopLibrary.shop_burger);
//					array_push(shop_item_list, global.shopLibrary.shop_burger);
//					array_push(shop_item_list, global.shopLibrary.shop_mana_burg);
//					array_push(shop_item_list, global.shopLibrary.shop_mana_burg);
//					array_push(shop_item_list, global.shopLibrary.shop_mana_burg);
//				}
//			}
//			break;
//	}
//}