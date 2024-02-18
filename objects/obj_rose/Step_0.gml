#region ANIMATION
switch (obj_player_sal.to_record_spr[record]) {
	case spr_player_walk_down:	sprite_index = roseAnims.DOWN;	break;
	case spr_player_walk_up:	sprite_index = roseAnims.UP;	break;
	case spr_player_walk_left:	sprite_index = roseAnims.LEFT;	break;
	case spr_player_walk_right:	sprite_index = roseAnims.RIGHT;	break;
}

image_speed = obj_player_sal.image_speed;

#endregion
#region MOVEMENT
x = obj_player_sal.party_pos_x[record];
y = obj_player_sal.party_pos_y[record];
#endregion