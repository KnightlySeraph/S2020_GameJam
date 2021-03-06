if(state != "DEATH" && state != "HOLLOW") mask_index = spr_rook_idle;
else mask_index = spr_rook_ready;

switch(state) {
	case "IDLE":
		timer += 1;
		if(alert && timer > 180) {
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
		else sprite_index = spr_rook_ready
		if (!deathSndPlayed) {
			audio_play_sound(snd_break, 0.5, false);
			deathSndPlayed = true;
		}
		break;
		
	case "HOLLOW":
		sprite_index = spr_rook_hollow;
		break;
}

if(currentHealth <= 0 && !ready) state = "DEATH";
if(hollow) state = "HOLLOW";

if(abs(point_distance(x,y,obj_player.x,obj_player.y) < 800) && !collision_line(x,y,obj_player.x,obj_player.y,obj_solid,true,true)) {
	alert = true;
	alert_timer = 0;
}
else if(currentHealth > 0) {
	alert_timer += 1;
	if(alert_timer > 30) {
		alert = false;
		exclamation = false;
		sprite_index = spr_rook_reveal;
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