if(state != "DEATH" && state != "HOLLOW") mask_index = spr_knight_idle;
else mask_index = spr_knight_ready;

switch(state) {
	case "IDLE":
		sprite_index = spr_knight_idle;
		hsp = 0;
		timer += 1;
		if(!alert) {
			if(timer > random_num) {
				state = "WALK";
				timer = 0;
				random_num = irandom_range(60,90);
				direct = choose(1,-1);
			}
		}
		else {
			if(timer > 60) {
				state = "WALK";
				timer = 0;
			}
		}	
		break;
	
	case "WALK":
		sprite_index = spr_knight_walk;
		if(vsp==0) hsp = spd * -direct;
		if(!alert) {
			timer += 1;
			if(timer > random_num) {
				state = "IDLE";
				timer = 0;
				random_num = irandom_range(90,120);
			}
		}
		else {
			direct = -sign(obj_player.x - x);
			if(abs(y-obj_player.y) > 192 && y > obj_player.y && abs(x-obj_player.x) < 480) {
				if(!collision_line(x,y,x, y-784, obj_solid, false, false) && obj_player.grounded) {
					state = "JUMP";
					var temp_vsp = 0;
					var temp_y = y-528;
					var y_dist = 0;
					while(!place_meeting(obj_player.x,temp_y, obj_solid)) {
						temp_vsp += 1;
						temp_y += temp_vsp;
						y_dist += 1;
					}
					var x_dist = abs(x-obj_player.x);
					jump_hsp = x_dist/y_dist;
				}
				else {
					alert = false;
					exclamation = false;
				}
			}
		}
		break;
		
	case "JUMP":
		if(grounded) {
			timer = 0;
			if(!jumped) {
				sprite_index = spr_knight_jump;
			}
			else {
				sprite_index = spr_knight_land;
			}
		}
		else sprite_index = spr_knight_midair;
		if(vsp < 0) hsp = 0;
		else if(!grounded) hsp = -direct * jump_hsp;
		break;
		
	case "DEATH":
		if(!ready) sprite_index = spr_knight_death;
		else sprite_index = spr_knight_ready;
		hsp = 0;
		break;
		
	case "HOLLOW":
		sprite_index = spr_knight_hollow;
		break;
}

if(currentHealth <= 0 && !ready) {
	state = "DEATH";
}
if(hollow) state = "HOLLOW";

if(abs(obj_player.x - x) < 640 && abs(obj_player.y - y) < 192 && sign(x-obj_player.x) == -direct && !alert) {
	alert = true;
	alert_timer = 0;
	direct = -sign(x-obj_player.x);
}
else if(abs(point_distance(x,y,obj_player.x, obj_player.y)) < 1080 && alert) {
	alert = true;
	alert_timer = 0;
}
else {
	alert_timer += 1;
	if(alert_timer > 30) {
		alert = false;
		exclamation = false;
	}
}

if(alert && !exclamation && state != "DEATH" && state != "HOLLOW") {
	exclamation = true;
	var point = instance_create_depth(x,y,depth,obj_alert);
	point.parent = self;
	point.yoffset = -16;
	point.image_xscale = direct;
}

if(hurt) image_alpha = random_range(0.4, 0.9);
else image_alpha = 1;

vsp += grav;

if(currentHealth > 0) {
if(place_meeting(x+hsp,y, obj_solid)) {
	while(!place_meeting(x+sign(hsp),y, obj_solid)) {
		x += sign(hsp);
	}
	hsp = 0;
	if(!alert) direct = -direct;
}
}

if(place_meeting(x,y+vsp, obj_solid)) {
	while(!place_meeting(x,y+sign(vsp), obj_solid)) {
		y += sign(vsp);
	}
	if(vsp < 0 ) {
		alert = false;
		exclamation = false;
	}
	grounded = true;
	vsp = 0;
}
else grounded = false;


x+=hsp;
y+=vsp;

image_xscale = direct;
suck_x = x-(direct * 70)

if(current_sprite != sprite_index) {
	current_sprite = sprite_index;
	image_index = 0;
}