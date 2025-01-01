//DEBUG
//show_debug_message(enemy_reached_death);
x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);
//run state machine
battle_state();

//cursor control
if (cursor.active) {
	with (cursor) {
		var _key_up = keyboard_check_pressed(global.controls_up);
		var _key_down = keyboard_check_pressed(global.controls_down);
		var _key_left = keyboard_check_pressed(global.controls_left);
		var _key_right = keyboard_check_pressed(global.controls_right);
		var _key_toggle = false;
		var _key_confirm = false;
		var _key_cancel = false;
		confirm_delay++;
		if (confirm_delay > 1) {
			_key_toggle = keyboard_check_pressed(global.controls_toggle);
			_key_confirm = keyboard_check_pressed(global.controls_interact);
			_key_cancel = keyboard_check_pressed(global.controls_back);
		}
		var _move_v = _key_down - _key_up;
		
		if (active_action.whoTarget == CANTARGET.BOTH) {
			var _move_h = _key_right - _key_left;
		
			if (_move_h == -1) target_side = obj_battle.party_units;
			if (_move_h == 1) target_side = obj_battle.enemy_units;	
		}
		
		if (active_action.whoTarget == CANTARGET.ENEMY) {
			target_side = obj_battle.enemy_units;
		}
		
		if (active_action.whoTarget == CANTARGET.PARTY) {
			target_side = obj_battle.party_units;
		}
		
		//verify target list
		if (target_side == obj_battle.enemy_units) {
			target_side = array_filter(target_side, function(_element, _index) {
				return _element.hp > 0;	
			});
		}
		
		//mmove between targets
		if (target_all == false) { //single target mode
			if (_move_v == 1) target_index++;
			if (_move_v == -1) target_index--;
			
			//wrap
			var _targets = array_length(target_side);
			if (target_index < 0) target_index = _targets - 1;
			if (target_index > (_targets - 1)) target_index = 0;
			
			//identify target
			active_target = target_side[target_index];
			
			//toggle all mode
			if (active_action.targetAll == MODE.VARIES) && (_key_toggle) { //swith to all mode
				target_all = true;
			}
		}
		else { //target all mode
			active_target = target_side;
			if (active_action.targetAll == MODE.VARIES) && (_key_toggle) { // swith to single mode
				target_all = false;	
			}
		}
		
		//SFX
		//option pick sound
		if (_key_right) || (_key_left) || (_key_up) || (_key_down) {
			audio_play_sound(snd_select, 6, false, global.sound_volume * global.master_volume);	
		}
		
		//confirm action
		if (_key_confirm) {
			audio_play_sound(snd_confirm, 6, false, global.sound_volume * global.master_volume);	
			with (obj_battle) battle_begin_action(cursor.active_user, cursor.active_action, cursor.active_target);
			with (obj_battle_menu) instance_destroy();
			active = false;
			confirm_delay = 0;
		}
		
		//cancel action
		if (_key_cancel) && !(_key_confirm) {
			audio_play_sound(snd_cancel, 6, false, global.sound_volume * global.master_volume);	
			with (obj_battle_menu) active = true;
			active = false;
			confirm_delay = 0;
		}
	}
}