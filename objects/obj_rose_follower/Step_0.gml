x = obj_player_sal.followers_pos_x[record];
y = obj_player_sal.followers_pos_y[record];

switch (obj_player_sal.followers_to_record_sprite[record]) {
	case spr_player_walk_down: sprite_index = spr_rose_walk_down; break;	
	case spr_player_walk_up: sprite_index = spr_rose_walk_up; break;	
	case spr_player_walk_left: sprite_index = spr_rose_walk_left; break;	
	case spr_player_walk_right: sprite_index = spr_rose_walk_right; break;	
}

if (obj_player_sal.faceDir == playerAnims.UP) {
	depth = over_depth;
}
if (obj_player_sal.faceDir == playerAnims.DOWN) {
	depth = under_depth;
}

image_speed = obj_player_sal.image_speed;

if (obj_player_sal.image_speed == 0) {
	image_speed = 0;
	image_index = 0;
}