depth = -9999;

//create the inventory arrays
global.inv_item = array_create(0);
global.inv_weapon = array_create(0);

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

function scr_create_weapon(_name, _desc, _icon, _spr, _text, _dmg) constructor {
	w_name = _name;
	w_description = _desc;
	w_icon = _icon;
	w_ov_sprite = _spr;
	w_dialogue = _text;
	w_dmg = _dmg;
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
		function() {
			obj_player_sal.hp += 10;
			//delete item
			array_delete(global.inv_item, selected_item, 1);
			
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
		function() {
			obj_player_sal.hp -= 10;
			//delete item
			array_delete(global.inv_item, selected_item, 1);
		}
	),
	
	test_key : new scr_create_item(
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
						instance_destroy();
						_used = true
					}
				}
			}
			if (_used == true) {
				array_delete(global.inv_item, selected_item, 1);	
			}
			
		}
	),
}
	
global.weapon_list = {
	Bachi : new scr_create_weapon(
		"Bachi",
		"Used for taiko drumming. Packs a punch!\nDMG - 99",
		spr_test_burger,
		spr_ball,
		"Bachi_Test",
		99,
	),
}




inv_max = 20

selected_item = -1;
selected_weapon = -1;

used_item = 0;