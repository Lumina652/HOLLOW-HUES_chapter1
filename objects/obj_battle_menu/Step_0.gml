if (active) {
	//control
	hover += keyboard_check_pressed(global.controls_down) - keyboard_check_pressed(global.controls_up);
	if (hover > array_length(options) - 1) hover = 0;
	if (hover < 0) hover = array_length(options) - 1;
	
	if (keyboard_check_pressed(global.controls_interact)) {
		if (array_length(options[hover]) > 1) && (options[hover][3] == true) {
			if (options[hover][1] != -1) {
				var _func = options[hover][1];
				if (options[hover][2] != -1) script_execute_ext(_func, options[hover][2]); else _func();
			}
		}
	}
	
	if (keyboard_check_pressed(global.controls_back)) {
		if (sub_menu_level > 0) battle_menu_go_back();	
	}
	
}