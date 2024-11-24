global.party = 
[
	{
		name: "Sal",
		hp: 100,
		hpMax: 100,
		mana: 100,
		manaMax: 100,
		attack: 0,
		defense: 0,
		sprites: { idle: spr_player_walk_down, attack: spr_player_walk_down, defend: spr_player_walk_left, down: spr_player_walk_right},
		actions: []
	}
	,
	{
		name: "Rose",
		hp: 100,
		hpMax: 100,
		mana: 100,
		manaMax: 100,
		attack: 0,
		defense: 0,
		sprites: { idle: spr_rose_walk_down, attack: spr_rose_walk_down, defend: spr_rose_walk_left, down: spr_rose_walk_right},
		actions: []
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
		sprites: { idle: spr_malachi_idle_1, attack: spr_malachi_idle_1},
		actions: [],
		xpValue: 15,
		AIscript: function()
		{
			//enemy turn ai goes here	
		}
	}
}