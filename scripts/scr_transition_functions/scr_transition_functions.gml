/// @desc SlideTransition (mode, targetroom)
/// @arg Mode sets transition between next, restart and goto
/// @arg Target sets target room when using goto
function scr_transition(){
	with (obj_transition) {
		mode = argument[0];
		if (argument_count > 1) {
			target = argument[1];
		}
	}
}

function scr_transition_white(){
	with (obj_transition_white) {
		mode = argument[0];
		if (argument_count > 1) {
			target = argument[1];
		}
	}
}