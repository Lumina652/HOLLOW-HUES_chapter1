skillcheck_circle_bar_rotate = 0;
skillcheck_circle_bar_goal = ceil(random_range(100, 360));
skillcheck_circle_bar_diff = 1;

hp_enemy = -1;
hp_amount = -1;
hp_party = -1;

instance_create_depth(x, y, depth -2, obj_battle_skillcheck_circle_hit);
instance_create_depth(x, y, depth -1, obj_battle_skillcheck_circle_hitpoint);