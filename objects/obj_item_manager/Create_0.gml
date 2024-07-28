depth = -9999;

//create the inventory arrays
global.inv_item = array_create(0);
global.inv_weapon = array_create(0);
global.inv_armor = array_create(0);
global.inv_key = array_create(0);

//item constructor
function scr_create_item(_name, _desc, _icon, _spr, _candrop, _text, _used_text, _effect) constructor {
	name = _name;
	description = _desc;
	icon = _icon;
	ov_sprite = _spr;
	can_drop = _candrop;
	dialogue = _text;
	used_text = _used_text;
	effect = _effect;
}

function scr_create_weapon(_name, _desc, _icon, _spr, _text, _dmg, _effect) constructor {
	w_name = _name;
	w_description = _desc;
	w_icon = _icon;
	w_ov_sprite = _spr;
	w_dialogue = _text;
	w_dmg = _dmg;
	w_effect = _effect;
}

function scr_create_armor(_name, _desc, _icon, _spr, _text, _defense, _effect) constructor {
	a_name = _name;
	a_description = _desc;
	a_icon = _icon;
	a_ov_sprite = _spr;
	a_dialogue = _text;
	a_defense = _defense;
	a_effect = _effect
}

function scr_create_key(_name, _desc, _icon, _spr, _candrop, _text, _used_text, _effect) constructor {
	k_name = _name;
	k_description = _desc;
	k_icon = _icon;
	k_ov_sprite = _spr;
	k_can_drop = _candrop;
	k_dialogue = _text;
	k_used_text = _used_text;
	k_effect = _effect;
}

//create the items

global.item_list = {
	burger : new scr_create_item(
		"Burger", 
		"BURGIER TURUTUTUTUTU", 
		spr_test_burger, 
		spr_test_inv,
		true,
		"Inv_Test",
		"Inv_Test",
		function(_party) {
			with (_party) {
				hp += 10;
			}
				//delete item
			array_delete(global.inv_item, obj_item_menu.item_move_vertical, 1);
			scr_create_textbox("Inv_Test");
			//add the burger why not lol
			//array_insert(inv, selected_item, global.item_list.burger);
		}
	),
	
	cola_espona : new scr_create_item(
		"Cola", 
		"COCA COLA ESPOMA TURMURMRURMR", 
		spr_test_burger, 
		spr_ball,
		true,
		"Inv_Test2",
		"Inv_Test2",
		function(_party) {
			with (_party) {
				hp -= 10;	
			}
			//delete item
			array_delete(global.inv_item, obj_item_menu.item_move_vertical, 1);
			scr_create_textbox("Inv_Test2");
		}
	),
}
	
global.weapon_list = {
	Bachi : new scr_create_weapon(
		"Bachi",
		"Used for taiko drumming.\nDMG - 99",
		spr_test_weapon,
		spr_ball,
		"Bachi_Test",
		99,
		function(_party) {
			with (_party) {
				dmg += 99;	
			}
			//delete item
			array_delete(global.inv_weapon, obj_item_menu.item_move_vertical, 1);
			scr_create_textbox("Inv_Test2");
		}
	),
}

global.armor_list = {
	Garnek : new scr_create_armor(
		"Garnek",
		"ZUPA!!! OBIAD!!!\nDEFENSE - 99",
		spr_test_armor,
		spr_ball,
		"Garnek_Test",
		99,
		function(_party) {
			with (_party) {
				def += 99;	
			}
			//delete item
			array_delete(global.inv_armor, obj_item_menu.item_move_vertical, 1);
			scr_create_textbox("Inv_Test2");
		}
	),
}

global.key_list = {
	test_key : new scr_create_key(
		"Test Key", 
		"How did you get this?", 
		spr_test_burger, 
		spr_test_key,
		false,
		"Inv_Key_Test",
		"Inv_Key_Test_USED",
		function() {
			var _used = false;
			if instance_exists(obj_door_test) {
				with (obj_door_test) {
					if distance_to_object(obj_player_sal) < 20 {
						scr_create_textbox("Inv_Key_Test_USED");
						instance_destroy();
						_used = true
					}
				}
			}
			if (_used == true) {
				array_delete(global.inv_key, obj_item_menu.item_move_vertical, 1);	
			}
			
		}
	),	
}

inv_max = 20

selected_item = -1;
selected_weapon = -1;
selected_armor = -1;
selected_key = -1;

used_item = 0;