#region PLAYER ANIMATIONS
enum playerAnims {
	LEFT,
	UP,
	RIGHT,
	DOWN,
	LAYING
}

sprite[playerAnims.LEFT] = spr_player_walk_left;
sprite[playerAnims.UP] = spr_player_walk_up;
sprite[playerAnims.RIGHT] = spr_player_walk_right;
sprite[playerAnims.DOWN] = spr_player_walk_down;
sprite[playerAnims.LAYING] = spr_player_idle;


#endregion
#region VARIABLES
faceDir = playerAnims.DOWN;
xspd = 0;
yspd = 0;
walkspd = 1.5;
runspd = 3.5;
hasControl = true;
canRun = true;
whatCutscene = -1;
in_cutscene = false;
in_inv = 0;
opened_inv = false;
in_text = 0;
canInv = true;
global.follower_count = 0;
//party_position = 0;
in_shop = false;
#endregion
#region OTHER
instance_create_layer(x, y, "Player", obj_interact);
instance_create_layer(x, y, "Player", obj_rose_follower);
instance_create_layer(x, y, "Player", obj_hazel_follower);
#endregion
#region FOLLOWERS
followers_array_size = 94;

for (var i = followers_array_size-1; i >= 0; --i) {
    followers_pos_x[i] = x;
	followers_pos_y[i] = y;
	followers_to_record_sprite[i] = spr_player_walk_down;
}


if (instance_exists(obj_rose_follower)) {
	global.follower_count ++;
}
if (instance_exists(obj_hazel_follower)) {
	global.follower_count ++;
}
#endregion