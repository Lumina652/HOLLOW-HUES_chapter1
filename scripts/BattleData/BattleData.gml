global.actionLibrary =
{
	attack:
	{
		name: "Attack",
		description: "{0} attacks!",
		subMenu: -1,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_hit_test,
		effectOnTarget: MODE.ALWAYS,
		func: function(_user, _targets)
		{
			var _damage = ceil(_user.attack + random_range(-_user.attack * 0.25, _user.attack * 0.25) / _user.defense);
			battle_change_hp(_targets[0], -_damage, 0);
		}
	},
	attack2test:
	{
		name: "Sal Bomboclat",
		description: "{0} attacks!",
		subMenu: "Skills",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_hit_test,
		effectOnTarget: MODE.ALWAYS,
		func: function(_user, _targets)
		{
			battle_change_hp(_targets[0], -1000, 0);
		}
	},
	healtest:
	{
		name: "Heal",
		description: "{0} heals!",
		subMenu: "Skills",
		manaCost: 14,
		targetRequired: true,
		targetEnemyByDefault: false, //0: party/self, 1:enemy
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_hit_test,
		effectOnTarget: MODE.ALWAYS,
		func: function(_user, _targets)
		{
			var _heal = ceil(random_range(10, 40));
			battle_change_hp(_targets[0], _heal, 0);
		}
	},
	ice:
	{
		name: "Ice",
		description: "{0} casts ice!",
		subMenu: "Skills",
		manaCost: 14,
		targetRequired: true,
		targetEnemyByDefault: true, //0: party/self, 1:enemy
		targetAll: MODE.VARIES,
		userAnimation: "attack",
		effectSprite: spr_hit_test,
		effectOnTarget: MODE.ALWAYS,
		func: function(_user, _targets)
		{
			for (var i = 0; i < array_length(_targets); ++i) {
				if (array_length(_targets) >= 1) var _damage = ceil(_user.attack + irandom_range(10, 35) / _user.defense);
				battle_change_hp(_targets[i], -_damage);
				//battle_change_mana(_user, -manaCost);
			}
		}
	}
}

enum MODE {
	NEVER = 0,
	ALWAYS = 1,
	VARIES = 2
}

global.party = 
[
	{
		name: "Sal",
		hp: 100,
		hpMax: 100,
		mana: 100,
		manaMax: 100,
		attack: 10,
		defense: 1,
		weapon_equiped: noone,
		armor_equiped: noone,
		last_equiped_weapon: -1,
		last_equiped_armor: -1,
		sprites: { idle: spr_player_walk_down, attack: spr_player_walk_up, defend: spr_player_walk_left, down: spr_player_walk_right},
		actions: [global.actionLibrary.attack, global.actionLibrary.attack2test, global.actionLibrary.healtest, global.actionLibrary.ice]
	}
	,
	{
		name: "Rose",
		hp: 100,
		hpMax: 100,
		mana: 100,
		manaMax: 100,
		attack: 5,
		defense: 1,
		weapon_equiped: noone,
		armor_equiped: noone,
		last_equiped_weapon: -1,
		last_equiped_armor: -1,
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
		attack: 10,
		defense: 1,
		weapon_equiped: noone,
		armor_equiped: noone,
		last_equiped_weapon: -1,
		last_equiped_armor: -1,
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
		actions: [global.actionLibrary.attack],
		xpValue: 15,
		battle_dialogue: ["Battle_Generic"],
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