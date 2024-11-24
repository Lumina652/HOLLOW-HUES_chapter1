instance_deactivate_all(true);
anim_run = 0;


units = [];

//make enemies cool
for (var i = 0; i < array_length(enemies); i++) {
	enemy_units[i] = instance_create_depth(x + 500 + (i * 40), y + 260 + (i * 20), depth - 10, obj_battle_unit_enemy, enemies[i]);
	array_push(units, enemy_units[i]);
}

//make partey
for (var i = 0; i < array_length(global.party); i++) {
	party_units[i] = instance_create_depth(x + 140 + (i * 40), y + 260 + (i * 20), depth - 10, obj_battle_unit_pc, global.party[i]);
	array_push(units, party_units[i]);
}