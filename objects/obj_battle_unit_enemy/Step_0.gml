event_inherited();

if (hp <= 0) {
	image_blend = c_red;
	image_alpha -= 0.01;
	
	if (done = 0) {
		obj_battle.enemy_reached_death--;
		obj_battle.full_exp += xpValue;
		done = 1;
	}
}