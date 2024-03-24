if (obj_player_sal.x != obj_player_sal.xprevious) || (obj_player_sal.y != obj_player_sal.yprevious) {
	ds_queue_enqueue(following_que2, obj_player_sal.x);
	ds_queue_enqueue(following_que2, obj_player_sal.y);
	ds_queue_enqueue(following_que2, obj_player_sal.image_index);
	ds_queue_enqueue(following_que2, obj_player_sal.sprite_index);
	ds_queue_enqueue(following_que2, obj_player_sal.xspd);
	ds_queue_enqueue(following_que2, obj_player_sal.yspd);
}

if (ds_queue_size(following_que2) > 200)
{
    x = ds_queue_dequeue(following_que2);
    y = ds_queue_dequeue(following_que2);
    image_index = ds_queue_dequeue(following_que2);
	sprite_index = ds_queue_dequeue(following_que2);
	x_spd = ds_queue_dequeue(following_que2);
	y_spd = ds_queue_dequeue(following_que2);
}

// Convert
switch (sprite_index)
{
    case spr_player_walk_down:
        sprite_index = spr_hazel_walk_down;
        break;
	case spr_player_walk_up:
        sprite_index = spr_hazel_walk_up;
        break;
	case spr_player_walk_left:
        sprite_index = spr_hazel_walk_left;
        break;
	case spr_player_walk_right:
        sprite_index = spr_hazel_walk_right;
        break;
}

if (x_spd == 0) && (y_spd == 0) {
	image_speed = 0;
	image_index = 0;
}

//depth fix
if (obj_rose_follower.sprite_index == spr_rose_walk_up) {
	depth = over_depth;
}
if (obj_rose_follower.sprite_index == spr_rose_walk_down) {
	depth = under_depth;
}

//fail save
