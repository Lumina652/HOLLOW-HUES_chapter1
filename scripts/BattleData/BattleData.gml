global.actionLibrary =
{
	attack:
	{
		name: "Attack",
		description: "{0} attacks!",
		subMenu: -1,
		manaCost: 0,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
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
	attack_enemy:
	{
		name: "Attack",
		description: "{0} attacks!",
		subMenu: -1,
		manaCost: 0,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_hit_test,
		effectOnTarget: MODE.ALWAYS,
		event: EVENTS.SKILLCHECKBAR,
		damage_bool: DAMAGE.SUBTRACT,
		func: function(_user, _targets)
		{
			//COUNTERABLE
			var _damage = ceil(_user.attack + random_range(-_user.attack * 0.25, _user.attack * 0.25) / _targets[0].defense);
			battle_skillcheck_bar(_targets[0], 3, _damage, _user);
		}
	},
	attack2test:
	{
		name: "Sal Bomboclat",
		description: "{0} attacks!",
		subMenu: "Skills",
		manaCost: 10,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
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
	attackcombo_test:
	{
		name: "Wombo Combo",
		description: "{0} attacks!",
		subMenu: "Skills",
		manaCost: 50,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
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
	}
}
	
global.actionItemsLibrary =
{
	items_burger:
	{
		name: "Burger",
		description: "{0} used a burger!",
		subMenu: "Inventory",
		manaCost: 0,
		targetRequired: true,
		targetEnemyByDefault: false,
		targetAll: MODE.NEVER,
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
		description: "{0} used a mana burger!",
		subMenu: "Inventory",
		manaCost: 0,
		targetRequired: true,
		targetEnemyByDefault: false,
		targetAll: MODE.NEVER,
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
		description: "{0} used a COKE!",
		subMenu: "Inventory",
		manaCost: 0,
		targetRequired: true,
		targetEnemyByDefault: false,
		targetAll: MODE.NEVER,
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

global.party = 
[
	{
		name: "Sal",
		hp: 90,
		hpMax: 90,
		mana: 100,
		manaMax: 100,
		attack: 1,
		defense: 1,
		weapon_equiped: noone,
		armor_equiped: noone,
		last_equiped_weapon: -1,
		last_equiped_armor: -1,
		level: 1,
		xp: 0,
		sprites: { idle: spr_player_walk_down, attack: spr_player_walk_up, defend: spr_player_walk_left, down: spr_player_walk_right},
		actions: [global.actionLibrary.attack, global.actionLibrary.attack2test, global.actionLibrary.healtest, global.actionLibrary.ice, global.actionLibrary.attackcombo_test]
	}
	,
	{
		name: "Rose",
		hp: 80,
		hpMax: 80,
		mana: 100,
		manaMax: 100,
		attack: 1,
		defense: 3,
		weapon_equiped: noone,
		armor_equiped: noone,
		last_equiped_weapon: -1,
		last_equiped_armor: -1,
		level: 1,
		xp: 0,
		sprites: { idle: spr_rose_walk_down, attack: spr_rose_walk_up, defend: spr_rose_walk_left, down: spr_rose_walk_right},
		actions: [global.actionLibrary.attack, global.actionLibrary.healtest]
	}
	,
	{
		name: "Hazel",
		hp: 100,
		hpMax: 100,
		mana: 100,
		manaMax: 100,
		attack: 3,
		defense: 2,
		weapon_equiped: noone,
		armor_equiped: noone,
		last_equiped_weapon: -1,
		last_equiped_armor: -1,
		level: 1,
		xp: 0,
		sprites: { idle: spr_hazel_walk_down, attack: spr_hazel_walk_up, defend: spr_hazel_walk_left, down: spr_hazel_walk_right},
		actions: [global.actionLibrary.attack, global.actionLibrary.ice]	
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
		actions: [global.actionLibrary.attack_enemy],
		xpValue: 5,
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
		actions: [global.actionLibrary.attack],
		xpValue: 66666,
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