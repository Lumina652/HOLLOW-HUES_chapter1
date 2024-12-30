//DRAW ALL BOXES
var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_x(view_camera[0]);
//im a big dum dum and decided very late that I want these at the bottom of the screen instead of at the top
var _move_down = 300;
var _move_down_small = 80;

shop_box_img += shop_box_speed;
draw_sprite_ext(shop_box_sprite, shop_box_img, shop_textbox_x + _x, shop_textbox_y + _y + _move_down, shop_textbox_width, shop_textbox_height, 0, c_white, 1);
draw_sprite_ext(shop_box_sprite, shop_box_img, shop_moneybox_x + _x, shop_spacebox_y + _y + _move_down_small, shop_moneybox_width, shop_moneybox_height, 0, c_white, 1);
draw_sprite_ext(shop_box_sprite, shop_box_img, shop_spacebox_x + _x, shop_spacebox_y + _y + _move_down_small, shop_moneybox_width, shop_moneybox_height, 0, c_white, 1);
draw_sprite_ext(shop_box_sprite, shop_box_img, shop_iconbox_x + _x, shop_iconbox_y + _y + _move_down, shop_iconbox_width, shop_iconbox_height, 0, c_white, 1);
draw_sprite_ext(shop_box_sprite, shop_box_img ,shop_menubox_x + _x, shop_menubox_y + _y + _move_down, shop_menubox_width, shop_menubox_height, 0, c_white, 1);

//shop list
scr_draw_set_text(c_white, global.font_main, fa_left, fa_top);
if (array_length(shop_item_list) <= shop_item_list_max_on_screen) {
	for (var i = 0; i < array_length(shop_item_list); i++) {
	    draw_text_ext(shop_item_x + _x, ((shop_item_y * (i + 1) / 2) + shop_item_y/2) + _y  + _move_down, shop_item_list[i].name, 0, shop_item_w);
		//shop_cursor_y = ((shop_cursor_y * (i + 1) / 2) + shop_cursor_y/2)
	}
}

draw_sprite(spr_arrow_left_sal, 0, shop_cursor_x + _x, shop_cursor_y + _y + _move_down);
shop_cursor_y = ((shop_cursor_y * (shop_current_item_list + 1) / 2) + shop_cursor_y/2)

//icon of current item
draw_sprite_ext(shop_item_list[shop_current_item_list].icon, 0, shop_icon_x + _x, shop_icon_y + _y + _move_down, shop_icon_width, shop_icon_height, 0, c_white, 1);

//TEXT
draw_text_ext(shop_item_name_x + _x, shop_item_name_y + _y + _move_down + 4, string(shop_item_list[shop_current_item_list].name), 0, shop_item_name_w);
draw_text_ext(shop_cost_x + _x, shop_cost_y + _y + 4 + _move_down, "COST: " + string(shop_item_list[shop_current_item_list].cost) + "$", 0, shop_cost_w);
draw_text_ext(shop_description_x + _x, shop_description_y + _y + _move_down, string(shop_item_list[shop_current_item_list].description), 18, shop_description_w);
draw_text_ext(shop_money_x + _x, shop_space_y + _y + 4 + _move_down_small, "MONEY: " + string(global.party_money) + "$", 0, shop_money_w);

//this is gonna be more complicated later using ShopData enum SHOP_WHICH_INV
switch (shop_item_list[shop_current_item_list].inv) {
	case SHOP_WHICH_INV.ITEM:
		draw_text_ext(shop_space_x + _x, shop_space_y + _y + 4 + _move_down_small, "ITEM SPACE: " + string(array_length(global.inv_item)) + "/" + string(obj_item_manager.inv_max), 0, shop_space_w);
		break;
	case SHOP_WHICH_INV.WEAPON:
		draw_text_ext(shop_space_x + _x, shop_space_y + _y + 4 + _move_down_small, "WEAPON SPACE: " + string(array_length(global.inv_weapon)) + "/" + string(obj_item_manager.inv_max), 0, shop_space_w);
		break;
	case SHOP_WHICH_INV.ARMOR:
		draw_text_ext(shop_space_x + _x, shop_space_y + _y + 4 + _move_down_small, "ARMOR SPACE: " + string(array_length(global.inv_armor)) + "/" + string(obj_item_manager.inv_max), 0, shop_space_w);
		break;
	case SHOP_WHICH_INV.KEY:
		draw_text_ext(shop_space_x + _x, shop_space_y + _y + 4 + _move_down_small, "KEY ITEM SPACE: " + string(array_length(global.inv_key)) + "/" + string(obj_item_manager.inv_max), 0, shop_space_w);
		break;
}