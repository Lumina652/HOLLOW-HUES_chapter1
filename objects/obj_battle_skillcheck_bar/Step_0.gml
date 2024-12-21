//decrease the bar every frame
if (skillcheck_bar_current <= 0) skillcheck_bar_current = 0;
var _full_difficulty = 0.2 * skillcheck_bar_enemy * global.difficulty;
skillcheck_bar_current -= _full_difficulty;

//player input
if (keyboard_check_pressed(global.controls_interact)) {
	skillcheck_bar_current += 10;
}

if (skillcheck_bar_current >= skillcheck_bar_length) {
	won = true;
	instance_destroy();
}
else if (skillcheck_bar_current <= 0) {
	won = false;
	instance_destroy();
}