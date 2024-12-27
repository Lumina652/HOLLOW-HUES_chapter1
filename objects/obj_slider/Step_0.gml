var _collision = place_meeting(x,y,obj_mouse);

if (mouse_check_button(mb_left)) && (_collision) {
	selected_slider = true;
}
else {
	selected_slider = false;	
}

if (selected_slider) {
	slider_value = clamp(mouse_x - x, 0, 200);	
}

drawn_slider_value = round(slider_value / 2);