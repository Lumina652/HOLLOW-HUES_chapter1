global.actionLibrary =
{
	action_attack:
	{
		name: "Attack",
		preDescription: "Basic attack",
		description: "{0} attacks!",
		subMenu: -1,
		manaCost: 0,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		whoTarget: CANTARGET.ENEMY,
		userAnimation: "attack",
		effectSprite: spr_hit_test,
		effectOnTarget: MODE.ALWAYS,
		damage_bool: DAMAGE.SUBTRACT,
		func: function(_user, _targets)
		{
			//NORMAL ATTACK
			var _crit = ceil(random_range(0, 15));
			var _crit_damage = 0;
			if (_crit == 5) _crit_damage = 15;
			var _damage = ceil(_user.attack + random_range(-_user.attack * 0.25, _user.attack * 0.25) / _targets[0].defense) + _crit_damage;
			battle_change_hp(_targets[0], -_damage, _crit, 0);
		}
	},
	action_attack_enemy:
	{
		name: "Attack",
		description: "{0} attacks!",
		subMenu: -1,
		manaCost: 0,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		whoTarget: CANTARGET.PARTY,
		userAnimation: "attack",
		effectSprite: spr_hit_test,
		effectOnTarget: MODE.ALWAYS,
		event: EVENTS.SKILLCHECKBAR,
		damage_bool: DAMAGE.SUBTRACT,
		func: function(_user, _targets)
		{
			//COUNTERABLE
			var _damage = ceil(_user.attack + random_range(-_user.attack * 0.25, _user.attack * 0.25) / _targets[0].defense);
			var _counter_chance = round(random_range(0, 8));
			if (_counter_chance == 5) {
				battle_skillcheck_bar(_targets[0], 3, _damage, _user);	
			}
			else {
				battle_change_hp(_targets[0], -_damage, 0, 0);
			}
		}
	},
	attack_circle:
	{
		name: "Sal Bomboclat",
		description: "{0} attacks!",
		subMenu: "Skills",
		manaCost: 10,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		whoTarget: CANTARGET.ENEMY,
		userAnimation: "attack",
		effectSprite: spr_hit_test,
		effectOnTarget: MODE.ALWAYS,
		event: EVENTS.SKILLCHECKCIRCLE,
		damage_bool: DAMAGE.SUBTRACT,
		func: function(_user, _targets)
		{
			//CIRCLE SKILL CHECK
			if (_user.mana >= manaCost) {
				var _damage = ceil(_user.attack * 3)
				battle_skillcheck_circle(_user, 6.5, _damage, _targets[0]);
				battle_change_mana(_user, -manaCost);
			}
			else {
				battle_change_mana(_user, -manaCost);	
			}
		}
	},
	attack_combo:
	{
		name: "Wombo Combo",
		description: "{0} attacks!",
		subMenu: "Skills",
		manaCost: 50,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		whoTarget: CANTARGET.ENEMY,
		userAnimation: "attack",
		effectSprite: spr_hit_test,
		effectOnTarget: MODE.ALWAYS,
		event: EVENTS.SKILLCHECKCIRCLE,
		damage_bool: DAMAGE.SUBTRACT,
		func: function(_user, _targets)
		{
			//CIRCLE SKILL CHECK MULTIPLE TIMES
			if (_user.mana >= manaCost) {
				var _damage = ceil(_user.attack * 20);
				battle_skillcheck_circle_combo(_user, 6, 5, _damage, _targets[0]);
				battle_change_mana(_user, -manaCost);
			}
			else {
				battle_change_mana(_user, -manaCost);	
			}
		}
	},
	healtest:
	{
		name: "Heal",
		description: "{0} heals!",
		subMenu: "Skills",
		manaCost: 32,
		targetRequired: true,
		targetEnemyByDefault: false, //0: party/self, 1:enemy
		targetAll: MODE.NEVER,
		whoTarget: CANTARGET.PARTY,
		userAnimation: "attack",
		effectSprite: spr_hit_test,
		effectOnTarget: MODE.ALWAYS,
		damage_bool: DAMAGE.ADD,
		func: function(_user, _targets)
		{
			var _heal = ceil(random_range(10, 40));
			battle_change_hp(_targets[0], _heal, 0, 0);
		}
	},
	ice:
	{
		name: "Ice",
		description: "{0} casts ice!",
		subMenu: "Skills",
		manaCost: 20,
		targetRequired: true,
		targetEnemyByDefault: true, //0: party/self, 1:enemy
		targetAll: MODE.VARIES,
		whoTarget: CANTARGET.ENEMY,
		userAnimation: "attack",
		effectSprite: spr_hit_test,
		effectOnTarget: MODE.ALWAYS,
		damage_bool: DAMAGE.SUBTRACT,
		func: function(_user, _targets)
		{
			for (var i = 0; i < array_length(_targets); ++i) {
				if (array_length(_targets) >= 1) var _damage = ceil(_user.attack + irandom_range(10, 35) / _targets[i].defense);
				battle_change_hp(_targets[i], -_damage, 0, 0);
				//battle_change_mana(_user, -manaCost);
			}
		}
	},
	action_home_run:
	{
		name: "Home Run",
		preDescription: "Strong attack\n\n! Skill check !",
		description: "{0} hits a home run!",
		subMenu: "Skills",
		manaCost: 3,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		whoTarget: CANTARGET.ENEMY,
		userAnimation: "attack",
		effectSprite: spr_hit_test,
		effectOnTarget: MODE.ALWAYS,
		damage_bool: DAMAGE.SUBTRACT,
		func: function(_user, _targets)
		{	
			//CIRCLE SKILL CHECK
			if (_user.mana >= manaCost) {
				var _crit = ceil(random_range(0, 15));
				var _crit_damage = 0;
				if (_crit == 5) _crit_damage = round(_user.attack / 2);
				var _damage = ceil(_user.attack * 3 / _targets[0].defense) + _crit_damage;
				battle_skillcheck_circle(_user, 4, _damage, _targets[0]);
				battle_change_mana(_user, -manaCost);
			}
			else {
				battle_change_mana(_user, -manaCost);	
			}
		}
	},
	action_our_guild:
	{
		name: "Our Guild",
		preDescription: "Combo attack\n\n! Skill check !",
		description: "{0} delivers a strong blow!",
		subMenu: "Skills",
		manaCost: 10,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		whoTarget: CANTARGET.ENEMY,
		userAnimation: "attack",
		effectSprite: spr_hit_test,
		effectOnTarget: MODE.ALWAYS,
		damage_bool: DAMAGE.SUBTRACT,
		func: function(_user, _targets)
		{	
			//CIRCLE SKILL CHECK
			if (_user.mana >= manaCost) {
				var _crit = round(random_range(0, 15));
				var _crit_damage = 0;
				if (_crit == 5) _crit_damage = round(_user.attack / 2);
				var _damage = ceil(_user.attack * 20 / _targets[0].defense) + _crit_damage;
				battle_skillcheck_circle_combo(_user, 5.3, 5, _damage, _targets[0]);
				battle_change_mana(_user, -manaCost);
			}
			else {
				battle_change_mana(_user, -manaCost);	
			}
		}
	},
	action_pickpocket:
	{
		name: "Pickpocket",
		preDescription: "Steal an item from the enemy",
		description: "{0} tries to sneakily steal\nfrom the enemy!",
		subMenu: "Skills",
		manaCost: 5,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		whoTarget: CANTARGET.ENEMY,
		userAnimation: "attack",
		effectSprite: spr_hit_test,
		effectOnTarget: MODE.ALWAYS,
		damage_bool: DAMAGE.SUBTRACT,
		func: function(_user, _targets)
		{	
			//CIRCLE SKILL CHECK
			if (_user.mana >= manaCost) {
				var _damage = round(random_range(1, 10) / _targets[0].defense);
				battle_skillcheck_circle_combo(_user, 4.8, 3, _damage, _targets[0]);
				battle_steal_item(global.item_list.burger, global.item_list.mana_burg, global.item_list.burger, global.item_list.burger, global.item_list.mana_burg);
				battle_change_mana(_user, -manaCost);
			}
			else {
				battle_change_mana(_user, -manaCost);	
			}
		}
	},
	action_vagrant_ditty:
	{
		name: "Vagrant Ditty",
		preDescription: "Increase defense",
		description: "{0} calls for their party!\nTheir defense increased!",
		subMenu: "Skills",
		manaCost: 5,
		targetRequired: true,
		targetEnemyByDefault: false,
		targetAll: MODE.ALWAYS,
		whoTarget: CANTARGET.PARTY,
		userAnimation: "attack",
		effectSprite: spr_hit_test,
		effectOnTarget: MODE.ALWAYS,
		damage_bool: DAMAGE.ADD,
		func: function(_user, _targets)
		{	
			if (_user.mana >= manaCost) {
				for (var i = 0; i < array_length(_targets); ++i) {
				    battle_status_defenseup(_targets[i]);
				}
			}
			else {
				battle_change_mana(_user, -manaCost);	
			}
		}
	},
}
	
global.actionItemsLibrary =
{
	items_burger:
	{
		name: "Burger",
		preDescription: "Heals 10 HP",
		description: "{0} used a burger!",
		subMenu: "Inventory",
		manaCost: 0,
		targetRequired: true,
		targetEnemyByDefault: false,
		targetAll: MODE.NEVER,
		whoTarget: CANTARGET.PARTY,
		userAnimation: "attack",
		effectSprite: spr_hit_test,
		effectOnTarget: MODE.ALWAYS,
		damage_bool: DAMAGE.ADD,
		func: function(_user, _targets)
		{
			//item functionality:
			battle_change_hp(_targets[0], 10, 0, 0);
			
			//delete item from action list
			for (var i = 0; i < array_length(global.party); ++i) {
			    var _find = function(_element) {
					return (_element == global.actionItemsLibrary.items_burger); //CHANGE ITEMS_X
				}
				var _index_action = array_find_index(global.party[i].actions, _find);
				array_delete(global.party[i].actions, _index_action, 1);
			}
			
			//delete item from item inv
			var _find_item = function(_element) {
				return (_element == global.item_list.burger); //CHANGE ITEMS_X
			}
			var _index_item = array_find_index(global.inv_item, _find_item);
			array_delete(global.inv_item, _index_item, 1);
		}
	},
	items_manaburg:
	{
		name: "Mana burger",
		preDescription: "Increases mana by 50",
		description: "{0} used a mana burger!",
		subMenu: "Inventory",
		manaCost: 0,
		targetRequired: true,
		targetEnemyByDefault: false,
		targetAll: MODE.NEVER,
		whoTarget: CANTARGET.PARTY,
		userAnimation: "attack",
		effectSprite: spr_hit_test,
		effectOnTarget: MODE.ALWAYS,
		damage_bool: DAMAGE.ADD,
		func: function(_user, _targets)
		{
			//item functionality:
			battle_change_mana(_targets[0], 50);
			
			//delete item from action list
			for (var i = 0; i < array_length(global.party); ++i) {
			    var _find = function(_element) {
					return (_element == global.actionItemsLibrary.items_manaburg); //CHANGE ITEMS_X
				}
				var _index_action = array_find_index(global.party[i].actions, _find);
				array_delete(global.party[i].actions, _index_action, 1);
			}
			
			//delete item from item inv
			var _find_item = function(_element) {
				return (_element == global.item_list.mana_burg); //CHANGE ITEMS_X
			}
			var _index_item = array_find_index(global.inv_item, _find_item);
			array_delete(global.inv_item, _index_item, 1);
		}
	},
	items_cocacola:
	{
		name: "Cola",
		preDescription: "Decrease HP by 10",
		description: "{0} used a COKE!",
		subMenu: "Inventory",
		manaCost: 0,
		targetRequired: true,
		targetEnemyByDefault: false,
		targetAll: MODE.NEVER,
		whoTarget: CANTARGET.PARTY,
		userAnimation: "attack",
		effectSprite: spr_hit_test,
		effectOnTarget: MODE.ALWAYS,
		damage_bool: DAMAGE.ADD,
		func: function(_user, _targets)
		{
			//item functionality:
			battle_change_hp(_targets[0], -10, 0, 0);
			
			//delete item from action list
			for (var i = 0; i < array_length(global.party); ++i) {
			    var _find = function(_element) {
					return (_element == global.actionItemsLibrary.items_cocacola); //CHANGE ITEMS_X
				}
				var _index_action = array_find_index(global.party[i].actions, _find);
				array_delete(global.party[i].actions, _index_action, 1);
			}
			
			//delete item from item inv
			var _find_item = function(_element) {
				return (_element == global.item_list.cola_espona); //CHANGE ITEMS_X
			}
			var _index_item = array_find_index(global.inv_item, _find_item);
			array_delete(global.inv_item, _index_item, 1);
		}
	}
}

enum MODE {
	NEVER = 0,
	ALWAYS = 1,
	VARIES = 2
}

enum EVENTS {
	NONE = 0,
	SKILLCHECKBAR = 1,
	SKILLCHECKCIRCLE = 2
}

enum DAMAGE {
	SUBTRACT = 0,
	ADD = 1
}
	
enum CANTARGET {
	ENEMY = 0,
	PARTY = 1,
	BOTH = 2
}

global.party_money = 0;

global.party = 
[
	{
		name: "Sal",
		hp: 50,
		hpMax: 50,
		mana: 30,
		manaMax: 30,
		attack: 1,
		defense: 1,
		weapon_equiped: noone,
		armor_equiped: noone,
		last_equiped_weapon: -1,
		last_equiped_armor: -1,
		level: 1,
		xp: 0,
		portrait_sprite: spr_text_box_sal,
		portrait_sprite_char: spr_inv_portrait_sal,
		sprites: { idle: spr_player_walk_down, attack: spr_player_walk_up, defend: spr_player_walk_left, down: spr_player_walk_right},
		actions: [global.actionLibrary.action_attack, global.actionLibrary.action_home_run, global.actionLibrary.action_pickpocket, global.actionLibrary.action_vagrant_ditty ,global.actionLibrary.action_our_guild]
	}
	,
	{
		name: "Rose",
		hp: 70,
		hpMax: 70,
		mana: 50,
		manaMax: 50,
		attack: 3,
		defense: 3,
		weapon_equiped: noone,
		armor_equiped: noone,
		last_equiped_weapon: -1,
		last_equiped_armor: -1,
		level: 1,
		xp: 0,
		portrait_sprite: spr_text_box_rose,
		portrait_sprite_char: spr_inv_portrait_rose,
		sprites: { idle: spr_rose_walk_down, attack: spr_rose_walk_up, defend: spr_rose_walk_left, down: spr_rose_walk_right},
		actions: [global.actionLibrary.action_attack]
	}
	,
	{
		name: "Hazel",
		hp: 80,
		hpMax: 80,
		mana: 50,
		manaMax: 50,
		attack: 5,
		defense: 2,
		weapon_equiped: noone,
		armor_equiped: noone,
		last_equiped_weapon: -1,
		last_equiped_armor: -1,
		level: 1,
		xp: 0,
		portrait_sprite: spr_text_box_hazel,
		portrait_sprite_char: spr_inv_portrait_hazel,
		sprites: { idle: spr_hazel_walk_down, attack: spr_hazel_walk_up, defend: spr_hazel_walk_left, down: spr_hazel_walk_right},
		actions: [global.actionLibrary.action_attack]	
	}
];

global.enemies =
{
	slime:
	{
		name: "Slime",
		hp: 30,
		hpMax: 30,
		mana: 0,
		manaMax: 0,
		attack: 5,
		defense: 2,
		sprites: { idle: spr_malachi_idle_1, attack: spr_malachi_flee_1},
		actions: [global.actionLibrary.action_attack_enemy],
		xpValue: 5,
		moneyValue: 3,
		portrait_sprite: spr_text_box_malachi,
		portrait_sprite_char: spr_inv_portrait_sal,
		battle_dialogue: [noone],    //"Battle_Generic"],
		AIscript: function()
		{
			//attack random party member
			var _action = actions[0];
			var _possible_targets = array_filter(obj_battle.party_units, function (_unit, _index) {
				return (_unit.hp > 0);
			});
			var _target = _possible_targets[irandom(array_length(_possible_targets) - 1)];
			return [_action, _target];
		}
	},
	Malachi:
	{
		name: "Malachi",
		hp: 66666,
		hpMax: 66666,
		mana: 0,
		manaMax: 0,
		attack: 12,
		defense: 200,
		sprites: { idle: spr_malachi_idle_1, attack: spr_malachi_flee_1},
		actions: [global.actionLibrary.action_attack],
		xpValue: 66666,
		moneyValue: 1,
		portrait_sprite: spr_text_box_malachi,
		portrait_sprite_char: spr_inv_portrait_sal,
		battle_dialogue: ["Boss_Malachi0", "Boss_Malachi1", "Boss_Malachi2", "Boss_Malachi3", "Boss_Malachi4", "Boss_Malachi5", "Boss_Malachi6", "Boss_Malachi7", "Boss_Malachi8", "Boss_Malachi9", "Boss_Malachi10"],
		AIscript: function()
		{
			//attack random party member
			var _action = actions[0];
			var _possible_targets = array_filter(obj_battle.party_units, function (_unit, _index) {
				return (_unit.hp > 0);
			});
			var _target = _possible_targets[irandom(array_length(_possible_targets) - 1)];
			return [_action, _target];
		}
	}
}