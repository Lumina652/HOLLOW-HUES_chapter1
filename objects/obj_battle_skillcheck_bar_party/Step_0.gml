//decrease the bar every frame
if (skillcheck_bar_party_current <= 0) skillcheck_bar_party_current = 0;
var _full_difficulty = 0.1 * skillcheck_bar_party_enemy * global.difficulty;
skillcheck_bar_party_current -= _full_difficulty;


//player input
if (keyboard_check_pressed(global.controls_interact)) {
	skillcheck_bar_party_current += 10 / skillcheck_bar_party_enemy;
}

//won
if (skillcheck_bar_party_current >= skillcheck_bar_party_length) {
	battle_change_hp(hp_enemy, -hp_amount, 0);
	instance_destroy();	
}

//lost
else if (skillcheck_bar_party_current <= 0) {
	instance_destroy();	
}