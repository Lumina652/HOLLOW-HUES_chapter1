#region PLAYER ANIMATIONS
enum playerAnimsCUTSCENE {
	LEFT,
	UP,
	RIGHT,
	DOWN,
	LAYING
}

animation = playerAnimsCUTSCENE.DOWN;

sprite[playerAnimsCUTSCENE.LEFT] = spr_player_walk_left;
sprite[playerAnimsCUTSCENE.UP] = spr_player_walk_up;
sprite[playerAnimsCUTSCENE.RIGHT] = spr_player_walk_right;
sprite[playerAnimsCUTSCENE.DOWN] = spr_player_walk_down;
sprite[playerAnimsCUTSCENE.LAYING] = spr_player_idle;


#endregion