#region PLAYER ANIMATIONS
enum playerAnims {
	LEFT,
	UP,
	RIGHT,
	DOWN
}

sprite[playerAnims.LEFT] = spr_player_walk_left;
sprite[playerAnims.UP] = spr_player_walk_up;
sprite[playerAnims.RIGHT] = spr_player_walk_right;
sprite[playerAnims.DOWN] = spr_player_walk_down;


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
inInventory = false;

global.inventory = [-1];

#endregion
#region OTHER
alarm[0] = 1 * room_speed;

instance_create_layer(x, y, "Player", obj_interact);
#endregion
#region PARTY
party_pos_array_size = 94;
for (var i = party_pos_array_size - 1; i >= 0; i--) {
	party_pos_x[i] = x;
	party_pos_y[i] = y;
	
	to_record_spr[i] = faceDir;
	//to_record_x_scale[i] = image_xscale;
	
}

var _follower_1 = instance_create_layer(x, y, "Player", obj_rose);
_follower_1.record = 17;

#endregion