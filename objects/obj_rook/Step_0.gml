if(state != "DEATH" && state != "HOLLOW") mask_index = spr_rook_idle;
//else mask_index = spr_pawn_ready;

switch(state) {
	case "IDLE":
		timer += 1;
		if(alert && timer > 120) {
			state = "ATTACK";
			timer = 0;
		}
		
		break;
		
	case "ATTACK":
		instance_create_depth(x,y-80,depth,obj_rook_bullet);
		state = "IDLE";
		break;
		
	case "DEATH":
		if(!ready) sprite_index = spr_rook_death;
		else image_index = 15;
		break;
		
	case "HOLLOW":
		break;
}

if(currentHealth <= 0 && !ready) state = "DEATH";

if(abs(obj_player.x - x) < 640 && abs(obj_player.y - y) < 192) {
	alert = true;
	alert_timer = 0;
}
else if(currentHealth > 0) {
	alert_timer += 1;
	if(alert_timer > 30) {
		alert = false;
		exclamation = false;
		sprite_index = spr_rook_idle;
	}
}

if(alert && sprite_index != spr_rook_hide && sprite_index != spr_rook_idle_hide && currentHealth > 0) {
	sprite_index = spr_rook_hide;
}

if(alert && !exclamation && state != "DEATH" && state != "HOLLOW") {
	exclamation = true;
	var point = instance_create_depth(x,y,depth,obj_alert);
	point.parent = self;
	point.yoffset = -96;
}

if(hurt) image_alpha = random_range(0.4, 0.9);
else image_alpha = 1;

if(current_sprite != sprite_index) {
	current_sprite = sprite_index;
	image_index = 0;
}