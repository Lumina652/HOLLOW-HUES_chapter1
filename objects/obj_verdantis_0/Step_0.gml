if (start == 1) {
	shake_timer ++;
	
	if (shake_timer == shake_time) {
		start = 0;
		shake_timer = 0;
	}
}