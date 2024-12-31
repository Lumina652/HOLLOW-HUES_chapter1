depth = -9999999;

obj_player_sal.hasControl = false;

#region SHOPBOX
shop_item_list = [];

//PUT IN SHOP KEEPER
array_push(shop_item_list, global.shopLibrary.shop_burger);
array_push(shop_item_list, global.shopLibrary.shop_cola);
array_push(shop_item_list, global.shopLibrary.shop_mana_burg);
array_push(shop_item_list, global.shopLibrary.shop_burger);
array_push(shop_item_list, global.shopLibrary.shop_cola);
array_push(shop_item_list, global.shopLibrary.shop_mana_burg);

//x and y
shop_menubox_x = 20;
shop_menubox_y = 20;
shop_textbox_x = 180;
shop_textbox_y = 20;
shop_moneybox_x = 400;
//shop_moneybox_y = 160;
shop_spacebox_x = 180;
shop_spacebox_y = 200;
shop_iconbox_x = 200;
shop_iconbox_y = 40;

//scale
shop_menubox_width = 7;
shop_menubox_height = 7;
shop_textbox_width = 22;
shop_textbox_height = 7;
shop_moneybox_width = 11;
shop_moneybox_height = 2;
shop_iconbox_width = 5;
shop_iconbox_height = 5;

//icon
shop_icon_x = 200;
shop_icon_y = 40;
shop_icon_width = 5;
shop_icon_height = 5;

//sprite
shop_box_sprite = spr_text_box_inv;
shop_box_img = 0; //frame of the pause box
shop_box_speed = 6 / room_speed; //how fast the pause box
#endregion

#region TEXT
//list of items you can buy
shop_item_x = 40;
shop_item_y = 40;
shop_item_w = 117;

shop_item_name_x = 310;
shop_item_name_y = 40;
shop_item_name_w = 188;

shop_cost_x = 500;
shop_cost_y = 40;
shop_cost_w = 116;

shop_description_x = 310;
shop_description_y = 80;
shop_description_w = 304;

shop_money_x = 410;
//shop_money_y = 170;
shop_money_w = 205;

shop_space_x = 190;
shop_space_y = 210;
shop_space_w = 205;

#endregion

#region CURSOR
//draw
shop_cursor_x = 42;
shop_cursor_y = 47;

//functionality
shop_current_item_list = 0;
shop_item_list_max_on_screen = 5;
shop_cursor_y_1 = 47;
shop_cursor_y_2 = 67;
shop_cursor_y_3 = 87;
shop_cursor_y_4 = 107;
shop_cursor_y_5 = 127;

#endregion