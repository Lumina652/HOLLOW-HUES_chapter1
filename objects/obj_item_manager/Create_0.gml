depth = -9999;

//item constructor
function scr_create_item(_name, _desc, _icon, _spr, _candrop, _text, _effect) constructor {
	name = _name;
	description = _desc;
	icon = _icon;
	ov_sprite = _spr;
	can_drop = _candrop;
	dialogue = _text;
	effect = _effect;
}

//pizza = new create_item("Pizza", " o cholera czy to FREDDY FAZBEAR?? URURURURURUR", spr_test_burger);

//create the items

global.item_list = {
	burger : new scr_create_item(
		"Burger", 
		"BURGIER TURUTUTUTUTU", 
		spr_test_burger, 
		spr_test_inv,
		true,
		"Inv_Test",
		function() {
			obj_player_sal.hp += 10;
			//delete item
			array_delete(inv, selected_item, 1);
			
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
		function() {
			obj_player_sal.hp -= 10;
			//delete item
			array_delete(inv, selected_item, 1);
		}
	),
	
	test_key : new scr_create_item(
		"Test Key", 
		"How did you get this?", 
		spr_test_burger, 
		spr_test_key,
		false,
		"Inv_Key_Test",
		function() {
			var _used = false;
			if instance_exists(obj_door_test) {
				with (obj_door_test) {
					if distance_to_object(obj_player_sal) < 20 {
						obj_player_sal.hasControl = false;
						instance_destroy();
						_used = true
						scr_create_textbox("Inv_Key_Test_USED");
					}
				}
			}
			if (_used == true) {
				array_delete(inv, selected_item, 1);	
			}
			
		}
	),
}



//create the inventory
inv = array_create(0);

inv_max = 16;
selected_item = -1;

sep = 24;
screen_border = 16;