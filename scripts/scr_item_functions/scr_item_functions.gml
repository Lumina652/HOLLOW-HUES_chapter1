//pickup items
function scr_item_add(_item) {
	//inventory
	var _added = false;
	
	if (array_length(global.inv_item) < obj_item_manager.inv_max) {
		array_push(global.inv_item, _item);
		//battles
		switch (_item) {
			case global.item_list.burger:
				for (var i = 0; i < array_length(global.party); ++i) {
				   array_push(global.party[i].actions, global.actionItemsLibrary.items_burger);
				}
				break;
			case global.item_list.cola_espona:
				for (var i = 0; i < array_length(global.party); ++i) {
				   array_push(global.party[i].actions, global.actionItemsLibrary.items_cocacola);
				}
				break;
			case global.item_list.mana_burg:
				for (var i = 0; i < array_length(global.party); ++i) {
				   array_push(global.party[i].actions, global.actionItemsLibrary.items_manaburg);
				}
				break;
		}
		
		_added = true;
	}
	
	return _added;
}

function scr_weapon_add(_item) {
	var _added = false;
	
	if (array_length(global.inv_weapon) < obj_item_manager.inv_max) {
		array_push(global.inv_weapon, _item);
		_added = true;
	}
	
	return _added;
}

function scr_armor_add(_item) {
	var _added = false;
	
	if (array_length(global.inv_armor) < obj_item_manager.inv_max) {
		array_push(global.inv_armor, _item);
		_added = true;
	}
	
	return _added;
}

function scr_key_add(_item) {
	var _added = false;
	
	if (array_length(global.inv_key) < obj_item_manager.inv_max) {
		array_push(global.inv_key, _item);
		_added = true;
	}
	
	return _added;
}