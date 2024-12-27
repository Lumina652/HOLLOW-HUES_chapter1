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
			global.party[_party].hp += 10;
			//delete item
			array_delete(global.inv_item, obj_item_menu.item_move_vertical, 1);
			for (var i = 0; i < array_length(global.party); ++i) {
			    var _find = function(_element) {
					return (_element == global.actionItemsLibrary.items_burger); //CHANGE ITEMS_X
				}
				var _index_action = array_find_index(global.party[i].actions, _find);
				array_delete(global.party[i].actions, _index_action, 1);
			}
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
			global.party[_party].hp -= 10;
			//delete item
			array_delete(global.inv_item, obj_item_menu.item_move_vertical, 1);
			for (var i = 0; i < array_length(global.party); ++i) {
			    var _find = function(_element) {
					return (_element == global.actionItemsLibrary.items_cocacola); //CHANGE ITEMS_X
				}
				var _index_action = array_find_index(global.party[i].actions, _find);
				array_delete(global.party[i].actions, _index_action, 1);
			}
			scr_create_textbox("Inv_Test2");
		}
	),
	
	mana_burg : new scr_create_item(
		"Mana burger", 
		"Where did you find this?\nMANA - +50", 
		spr_test_burger_1, 
		spr_ball,
		true,
		"Inv_manatest",
		"Inv_manatest-USED",
		function(_party) {
			global.party[_party].mana += 50;
			//delete item
			array_delete(global.inv_item, obj_item_menu.item_move_vertical, 1);
			for (var i = 0; i < array_length(global.party); ++i) {
			    var _find = function(_element) {
					return (_element == global.actionItemsLibrary.items_manaburg); //CHANGE ITEMS_X
				}
				var _index_action = array_find_index(global.party[i].actions, _find);
				array_delete(global.party[i].actions, _index_action, 1);
			}
			scr_create_textbox("Inv_manatest-USED");
			//add the burger why not lol
			//array_insert(inv, selected_item, global.item_list.burger);
		}
	),
}
	
global.weapon_list = {
	Bachi : new scr_create_weapon(
		"Bachi",
		"Used for taiko drumming.\nDMG - +6",
		spr_test_weapon,
		spr_ball,
		"Bachi_Test",
		6,
		function(_party) {
			if (global.party[_party].last_equiped_weapon != -1) {
				global.party[_party].attack -= global.party[_party].last_equiped_weapon.w_dmg; 	
			}
			global.party[_party].attack += global.weapon_list.Bachi.w_dmg;
			//delete item
			array_delete(global.inv_weapon, obj_item_menu.item_move_vertical, 1);
			if (global.party[_party].last_equiped_weapon != -1) {
				//global.party[_party].attack -= last_equiped_weapon.w_dmg;
				array_insert(global.inv_weapon, obj_item_menu.item_move_vertical, global.party[_party].last_equiped_weapon);
			}
			global.party[_party].last_equiped_weapon = global.weapon_list.Bachi;
			scr_create_textbox("Inv_Test2");
		}
	),
}

global.armor_list = {
	Garnek : new scr_create_armor(
		"Garnek",
		"ZUPA!!! OBIAD!!!\nDEFENSE - +10",
		spr_test_armor,
		spr_ball,
		"Garnek_Test",
		10,
		function(_party) {
			if (global.party[_party].last_equiped_armor != -1) {
				global.party[_party].defense -= global.party[_party].last_equiped_armor.a_defense; 	
			}
			global.party[_party].defense += global.armor_list.Garnek.a_defense;
			
			//delete item
			array_delete(global.inv_armor, obj_item_menu.item_move_vertical, 1);
			if (global.party[_party].last_equiped_armor != -1) {
				array_insert(global.inv_armor, obj_item_menu.item_move_vertical, global.party[_party].last_equiped_armor);
			}
			global.party[_party].last_equiped_armor = global.armor_list.Garnek;
			scr_create_textbox("Inv_Test2");
		}
	),
	
	Scarf : new scr_create_armor(
		"Scarf",
		"LOL\nDEFENSE - +3",
		spr_test_armor_1,
		spr_ball,
		"Garnek_Test",
		3,
		function(_party) {
			if (global.party[_party].last_equiped_armor != -1) {
				global.party[_party].defense -= global.party[_party].last_equiped_armor.a_defense; 	
			}
			global.party[_party].defense += global.armor_list.Scarf.a_defense;
			
			//delete item
			array_delete(global.inv_armor, obj_item_menu.item_move_vertical, 1);
			if (global.party[_party].last_equiped_armor != -1) {
				array_insert(global.inv_armor, obj_item_menu.item_move_vertical, global.party[_party].last_equiped_armor);
			}
			global.party[_party].last_equiped_armor = global.armor_list.Scarf;
			scr_create_textbox("Inv_Test2");
		}
	),
}

global.key_list = {
	test_key : new scr_create_key(
		"Test Key", 
		"How did you get this? Looks like it can open pink walls.", 
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