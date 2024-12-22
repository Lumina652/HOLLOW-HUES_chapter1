var _fulldiff = 1 * skillcheck_circle_bar_diff;
skillcheck_circle_bar_rotate += _fulldiff;

//if (skillcheck_circle_bar_rotate == 360) skillcheck_circle_bar_rotate = 0;

//win
if (keyboard_check_pressed(global.controls_interact)) {
	with (obj_battle_skillcheck_circle_hit) {
		if (place_meeting(x,y,obj_battle_skillcheck_circle_hitpoint)) {
			//audio_play_sound(snd_malachi_teleport, 1, false);
			instance_destroy(obj_battle_skillcheck_circle_hitpoint);
			
			with (other) {
				battle_change_hp(hp_enemy, -hp_amount, 0);
			}
			
			instance_destroy(other);
			instance_destroy();
		}
	}
}
//Lose from misinput
if (keyboard_check_pressed(global.controls_interact)) {
	with (obj_battle_skillcheck_circle_hit) {
		if (!place_meeting(x,y,obj_battle_skillcheck_circle_hitpoint)) {	
			instance_destroy(obj_battle_skillcheck_circle_hitpoint);
			
			with (other) {
				battle_change_hp(hp_party, round(-hp_amount / 3), 0);
			}
			
			instance_destroy(other);
			instance_destroy();
		}
	}
}
//lose from not inputing at all
if (skillcheck_circle_bar_rotate >= 720) {
	skillcheck_circle_bar_rotate = 0;
	battle_change_hp(hp_party, round(-hp_amount / 3), 0);
	instance_destroy(obj_battle_skillcheck_circle_hitpoint);
	instance_destroy(obj_battle_skillcheck_circle_hit);
	instance_destroy();
}