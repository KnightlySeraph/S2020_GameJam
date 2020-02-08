if(state != "DEATH" && state != "HOLLOW") {
	currentHealth -= 1;
	hurt = true;
	alarm[0] = 20;
	alert = true;
	alert_timer = 0;
	var bullet = instance_place(x,y,obj_bullet);
	// with(bullet) instance_destroy();
}