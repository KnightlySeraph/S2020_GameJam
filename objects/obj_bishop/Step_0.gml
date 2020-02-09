if(state != "DEATH" && state != "HOLLOW") mask_index = spr_bishop_idle;
//else mask_index = spr_bishop_ready;

switch(state) {
	case "IDLE":
		sprite_index = spr_bishop_idle;
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
			if(abs(x-obj_player.x) < 96) {
				state = "ATTACK";
				hsp = 0;
				timer = 0;
			}
		}
		
		break;
		
	case "ATTACK":
		break;
		
	case "DEATH":
		//if(!ready) sprite_index = spr_bishop_death;
		//else sprite_index = spr_bishop_ready;
		hsp = 0;
		break;
		
	case "HOLLOW":
		//sprite_index = spr_bishop_hollow;
		break;
}

if(currentHealth <= 0 && !ready) {
	state = "DEATH";
	if(place_meeting(x-(direct * 70), y, obj_solid) || !place_meeting(x-(direct*70), y+1, obj_solid)) {
		direct = -direct;
	}
}

if(abs(obj_player.x - x) < 640 && abs(obj_player.y - y) < 192 && sign(obj_player.x - x) == -direct && !alert) {
	alert = true;
	alert_timer = 0;
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

if(place_meeting(x+hsp,y, obj_solid)) {
	while(!place_meeting(x+sign(hsp),y, obj_solid)) {
		x += sign(hsp);
	}
	hsp = 0;
	direct = -direct;
}
else if(!place_meeting(x + (sign(hsp) * 45), y + 1, obj_solid)) {
	hsp = 0;
	if(!alert) direct = -direct;
	else state = "IDLE"
}

if(place_meeting(x,y+vsp, obj_solid)) {
	while(!place_meeting(x,y+sign(vsp), obj_solid)) {
		y += sign(vsp);
	}
	vsp = 0;
}

x+=hsp;
y+=vsp;

image_xscale = direct;
suck_x = x-(direct * 70)

if(current_sprite != sprite_index) {
	current_sprite = sprite_index;
	image_index = 0;
}