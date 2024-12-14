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
in_inv = 0;
opened_inv = false;
in_text = 0;
canInv = true;

global.follower_count = 0;
party_position = 0;

#region FIGHTING SYSTEM

#endregion

#region STATS

weapon_selected = -1;

weapon_equiped = noone;
armor_equiped = noone;
#endregion

#endregion
#region OTHER
alarm[0] = 1 * room_speed;

instance_create_layer(x, y, "Player", obj_interact);
//instance_create_layer(x, y, "Player", obj_rose_follower);
//instance_create_layer(x, y, "Player", obj_hazel_follower);
#endregion

#region FOLLOWERS

if (instance_exists(obj_rose_follower)) {
	global.follower_count ++;
}
if (instance_exists(obj_hazel_follower)) {
	global.follower_count ++;
}
#endregion