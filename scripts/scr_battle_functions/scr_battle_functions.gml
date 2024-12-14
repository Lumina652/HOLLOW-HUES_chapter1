function scr_NewEncounter(_enemies, _bg, _music) {
	instance_create_depth
	(
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]),
		-9999,
		obj_battle,
		{
			enemies: _enemies,
			creator: id,
			battle_background: _bg,
			battle_music: _music
		}
	);
}

function battle_change_hp(_target, _amount, _aliveDeadOrEither = 0) {
	//alive... 0 = alive only, 1 = dead only, 2 = any;
	var _failed = false;
	if (_aliveDeadOrEither == 0) && (_target.hp <= 0) _failed = true;
	if (_aliveDeadOrEither == 1) && (_target.hp > 0) _failed = true;
	
	var _col = c_white;
	if (_amount > 0) _col = c_lime;
	if (_failed) {
		_col = c_white;
		_amount = "failed";
	}
	instance_create_depth(
		_target.x,
		_target.y,
		_target.depth-1,
		obj_battle_floating_text,
		{font: global.font_main, col: _col, text: string(_amount)}
	);
	if (!_failed) _target.hp = clamp(_target.hp + _amount, 0, _target.hpMax);
}

function battle_make_menu (_x, _y, _options, _desc = -1, _width = undefined, _height = undefined) {
	with (instance_create_depth(_x, _y, -999999, obj_battle_menu)) {
		options = _options;
		description = _desc;
		var _optionsCount = array_length(_options);
		visible_options_max = _optionsCount;
		
		//set up size
		xymargin = 20;
		scr_draw_set_text(c_white, global.font_main, fa_left, fa_top);
		height_line = 18;
		
		//auto width
		if (_width == undefined) {
			width = 1;
			if (description != -1) width = max(width, string_width(_desc));
			for (var i = 0; i < _optionsCount; i++) {
				width = max(width, string_width(_options[i][0]));	
			}
			width_full = width + xymargin * 2;
		} else width_full = _width;
		
		//auto height
		if (_height == undefined) {
			height = height_line * (_optionsCount + !(description == -1));	
			height_full = height + xymargin * 2;
		}
		else {
			height_full = _height;
			//scrolling?
			if (height_line * (_optionsCount + !(description == -1)) > _height - (xymargin*2)) {
				scrolling = true;
				visible_options_max = (_height - xymargin * 2) div height_line;
			}
		}
	}
}

function battle_sub_menu (_options) {
	//store old options in array and increase submenu level
	options_above[sub_menu_level] = options;
	sub_menu_level++;
	options = _options;
	hover = 0;
}

function battle_menu_go_back() {
	sub_menu_level--;
	options = options_above[sub_menu_level];
	hover = 0;
}
	
function battle_menu_select_action(_user, _action) {
	with (obj_battle_menu) active = false;
	
	//activate the targetting cursor if needed, or simply begin the action
	with (obj_battle) {
		if (_action.targetRequired) {
			with (cursor) {
				active = true;
				active_action = _action;
				target_all = _action.targetAll;
				if (target_all == MODE.VARIES) target_all = true;
				active_user = _user;
				
				//which side to target by default?
				if (_action.targetEnemyByDefault) {
					target_index = 0;
					target_side = obj_battle.enemy_units;
					active_target = obj_battle.enemy_units[target_index];
				}
				else {
					target_side = obj_battle.party_units;
					active_target = active_user;
					var _find_self = function(_element) {
						return (_element == active_target)	
					}
					target_index = array_find_index(obj_battle.party_units, _find_self);
				}
			}
		}
		else {
			//if no target needed - begin the action and end the menu
			battle_begin_action(_user, _action, -1);
			with (obj_battle_menu) instance_destroy();
		}
	}
}