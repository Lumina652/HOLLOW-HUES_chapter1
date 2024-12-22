instance_deactivate_all(true);
instance_activate_object(obj_game);
instance_activate_object(obj_item_manager);
instance_activate_object(obj_music);
instance_activate_object(obj_settings);
instance_activate_object(obj_player_sal);
instance_activate_object(obj_item_menu);
instance_activate_object(obj_item_manager);
instance_activate_object(obj_text_box);

last_music = obj_music.target_song_asset;
scr_set_song_ingame(battle_music, 0, 0, true);

anim_run = 0;

//HEADINGS
text_enemy_x = 20;
text_name_x = 200;
text_hp_x = 400;
text_mana_x = 500;
text_header_y = 325;
text_enemy_name_y = 360;


units = [];
turn = 0;
unit_turn_order = [];
unit_render_order = [];

enemy_reached_death = 0;

//show_debug_message(creator);

turn_count = 0;
round_count = 0;
battle_wait_time_frames = global.battle_wait_time;
battle_wait_time_remaining = 0;
battle_text = "";
current_user = 0;
current_action = -1;
current_targets = noone;

//targeting arrow
cursor =  {
	active_user: noone,
	active_target: noone,
	active_action: -1,
	target_side: -1,
	target_index: 0,
	target_all: false,
	confirm_delay: 0,
	active: false
}

//battle text
battle_textbox = noone;
battle_textbox_limit = 0;

once = 0;

full_exp = 0;

//make enemies cool
for (var i = 0; i < array_length(enemies); i++) {
	enemy_units[i] = instance_create_depth(x + 500 + (i * 30), y + 260 + (i * 20) - 20, depth - 10, obj_battle_unit_enemy, enemies[i]);
	array_push(units, enemy_units[i]);
}

//make partey
for (var i = 0; i <= global.follower_count; i++) {
	party_units[i] = instance_create_depth(x + 140 - (i * 30), y + 260 + (i * 20) - 20, depth - 10, obj_battle_unit_pc, global.party[i]);
	array_push(units, party_units[i]);
}

//turn order
unit_turn_order = array_shuffle(units);

enemy_reached_death = array_length(enemy_units);

//get render order
refresh_render_order = function() {
	unit_render_order = [];
	array_copy(unit_render_order, 0, units, 0, array_length(units));
	array_sort(unit_render_order, function(_1, _2) {
		return _1.y - _2.y;
	});
}

refresh_render_order();

function battle_state_select_action() {
	once = 0;
	
	if (!instance_exists(obj_battle_menu)) {
		var _unit = unit_turn_order[turn];
	
		//check if unit is dead or is unable to act
		if (!instance_exists(_unit)) || (_unit.hp <= 0) {
			battle_state = battle_state_victory_check;
			exit;
		}
	
		//select an action to perform
	
		//if unit is player controlled:
		if (_unit.object_index == obj_battle_unit_pc) {
			if (!instance_exists(obj_battle_skillcheck_bar)) && (!instance_exists(obj_battle_skillcheck_circle)) {
				//compile the action menu
				var _menu_options = [];
				var _sub_menus = {};
				var _action_list = _unit.actions;
			
				for (var i = 0; i < array_length(_action_list); i++) {
					var _action = _action_list[i];
					var _available = true; //check mana cost here
					var _name_and_count = _action.name; //
				
					if (_action.subMenu == -1) {
						array_push(_menu_options, [_name_and_count, battle_menu_select_action, [_unit, _action], _available]);
					}
					else {
						if (is_undefined(_sub_menus[$ _action.subMenu])) {
							variable_struct_set(_sub_menus, _action.subMenu, [[_name_and_count, battle_menu_select_action, [_unit, _action], _available]]);
						}
						else {
							array_push(_sub_menus[$ _action.subMenu], [_name_and_count, battle_menu_select_action, [_unit, _action], _available]);	
						}
					}
				
				}
			
				//turn sub menus into an array
				var _sub_menus_array = variable_struct_get_names(_sub_menus);
				
				for (var i = 0; i < array_length(_sub_menus_array); i++) {
					//sort submenu if needed
					//here kurwa
					
					//add back option at the end of each submenu
					array_push(_sub_menus[$ _sub_menus_array[i]], ["Back", battle_menu_go_back, -1, true]);
					//add submenu into main menu
					array_push(_menu_options, [_sub_menus_array[i], battle_sub_menu, [_sub_menus[$ _sub_menus_array[i]]], true]);
				}
			
				battle_make_menu(x, y+320, _menu_options,,20*9, 20*8);
			}
		}
		else { //if unit is an enemy
			var _enemy_action = _unit.AIscript();
			if (_enemy_action != -1) {
				if (!instance_exists(obj_battle_skillcheck_bar)) && (!instance_exists(obj_battle_skillcheck_circle)) {
					battle_begin_action(_unit.id, _enemy_action[0], _enemy_action[1]);
				}
			}
		}
	}
}

function battle_begin_action(_user, _action, _targets) {
	current_user = _user;
	current_action = _action;
	current_targets = _targets;
	battle_text = string_ext(_action.description, [_user.name]);
	
	if (!is_array(current_targets)) current_targets = [current_targets];
	battle_wait_time_remaining = battle_wait_time_frames;
	with (_user) {
		acting = true;
		//play user animation if it is defined for that action, and the user
		if (!is_undefined(_action[$ "userAnimation"])) && (!is_undefined(_user.sprites[$ _action.userAnimation])) {
			sprite_index = sprites[$ _action.userAnimation];
			image_index = 0;
		}
	}
	if (!instance_exists(obj_battle_skillcheck_bar)) && (!instance_exists(obj_battle_skillcheck_circle)) {
		battle_state = battle_state_perform_action;	
	}
}

function battle_state_perform_action() {
	//if animation etc is still playing
	if (current_user.acting) {
		//when it ends, perform action effect if it exists
		if (current_user.image_index >= current_user.image_number -1) {
			with (current_user) {
				sprite_index = sprites.idle;
				image_index = 0;
				acting = false;
			}
			
			if (variable_struct_exists(current_action, "effectSprite")) {
				if (current_action.effectOnTarget == MODE.ALWAYS) || (current_action.effectOnTarget == MODE.VARIES) && (array_length(current_targets) <= 1) {
					for (var i = 0; i < array_length(current_targets); i++) {
						instance_create_depth(current_targets[i].x, current_targets[i].y, current_targets[i].depth-1, obj_battle_effect, {sprite_index: current_action.effectSprite});	
					}
				}
				else { //play at x=0 ; y=0 (like fullscreen animation)
					var _effect_sprite = current_action.effectSprite
					if (variable_struct_exists(current_action, "effectSpriteNoTarget")) _effect_sprite = current_action.effectSpriteNoTarget;
					instance_create_depth(x,y,depth-100,obj_battle_effect,{sprite_index: _effect_sprite});
				}
			}
			current_action.func(current_user, current_targets);
		}
	}
	else { //wait for the delay and then end the turn
		if (!instance_exists(obj_battle_effect)) && (!instance_exists(obj_battle_skillcheck_bar)) && (!instance_exists(obj_battle_skillcheck_circle)) {
			battle_wait_time_remaining--;
			if (battle_wait_time_remaining == 0) {
				battle_state = battle_state_victory_check;	
			}
		}
	}
}

function battle_state_victory_check () {
	if (enemy_reached_death == 0) {
		scr_set_song_ingame(last_music, 60, 60, true);
		instance_activate_all();
		
		for (var i = 0; i < array_length(party_units); ++i) {
		    //hp and mana
			global.party[i].hp = party_units[i].hp;
			global.party[i].mana = party_units[i].mana;
			
			//add exp
			global.party[i].xp += full_exp;
			
			//levels
			var _level = global.party[i].level;
		
			if (global.party[i].xp >= round(power(_level * 3, 1.6))) {
				global.party[i].xp -= round(power(_level * 3, 1.6));
				global.party[i].level ++;
			}
		}
		
		instance_destroy(creator);
		instance_destroy(obj_battle);
	}
	else {
		battle_state = battle_state_turn_progression;	
	}
	
	
	//battle_state = battle_state_turn_progression;
}

function battle_state_turn_progression() {
	battle_text = ""; //reset battle text
	if (once == 0) {
		turn_count++;
		turn++;
	}
	//loop turns
	if (turn > array_length(unit_turn_order) - 1) {
		turn = 0;
		if (once == 0) {
			round_count++;
			battle_textbox_limit = round_count;
		}
	}
	
	once = 1;
	
	for (var i = 0; i < array_length(enemy_units); ++i) {
		var _max = array_length(enemy_units[i].battle_dialogue) - 1;
		battle_textbox_limit = clamp(battle_textbox_limit, 0, _max);
		//clamp(battle_textbox_limit, 0, array_length(enemy_units[i].battle_dialogue));
		battle_textbox = enemy_units[i].battle_dialogue[battle_textbox_limit];
	}
	
	//battle text <3
	if (unit_turn_order[turn].object_index == obj_battle_unit_enemy) && (unit_turn_order[turn].object_index.hp > 0) {
		if (battle_textbox != noone) {
			scr_create_textbox(battle_textbox);
		}
		else {
			battle_state = battle_state_select_action;	
		}
	}
	else {
		battle_state = battle_state_select_action;	
	}
	//if (keyboard_check_pressed(global.controls_interact)) text_timer = 0;
	if (unit_turn_order[turn].object_index == obj_battle_unit_pc) {
		battle_state = battle_state_select_action;	
	}
	
}

battle_state = battle_state_select_action;