//pickup items
function scr_item_add(_item) {
	var _added = false;
	
	if (array_length(obj_item_manager.inv_item) < obj_item_manager.inv_max) {
		array_push(obj_item_manager.inv_item, _item);
		_added = true;
	}
	
	return _added;
}