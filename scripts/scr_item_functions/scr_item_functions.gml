//pickup items
function scr_item_add(_item) {
	var _added = false;
	
	if (array_length(global.inv_item) < obj_item_manager.inv_max) {
		array_push(global.inv_item, _item);
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