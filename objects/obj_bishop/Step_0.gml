if(state != "DEATH" && state != "HOLLOW") mask_index = spr_bishop_idle;
else mask_index = spr_bishop_ready;

switch(state) {
	case "IDLE":
		sprite_index = spr_bishop_idle;
		hsp = 0;
		if(alert) {
			timer += 1;
			if(timer > random_num) {
				direct = -sign(x-obj_player.x);
				if(abs(x-obj_player.x) < 600 && abs(y - obj_player.y) < 192) {
					state = "ATTACK";
					hsp = 0;
					timer = 0;
					drill_step = 1;
					direct = -sign(x-obj_player.x);
				}
				else {
					state = "TELEPORT";
					hsp = 0;
					timer = 0;
					spot_chosen = false;
				}
			}
		}
		break;
		
	case "ATTACK":
		if(drill_step == 1) sprite_index = spr_bishop_crouch;
		else if(drill_step == 3) sprite_index = spr_bishop_rise;
		else {
			sprite_index = spr_bishop_drill;
			// Audio work from justin
			if (!audio_is_playing(snd_drillAttack)) audio_play_sound(snd_drillAttack, 0.5, false);
			if(damage_box == noone) damage_box = instance_create_depth(x,y,depth,obj_enemy_damage);
			if(damage_box != noone) {
				damage_box.x = x + 46*direct;
				damage_box.y = y + 66;
				damage_box.image_xscale = 3.6;
				damage_box.image_yscale = 1.3;
			}
			hsp = direct * spd;
			timer += 1
			if(timer > 45) {
				if(damage_box != noone) {
					with(damage_box) instance_destroy();
					damage_box = noone;
				}
				drill_step = 3;
				hsp = 0;
				timer = 0;
			}
		}
		break;
		
	case "TELEPORT":
		if(!spot_chosen) {
			sprite_index = spr_bishop_teleport_first;
			// Audio from justin
			if (!audio_is_playing(snd_warp)) audio_play_sound(snd_warp, 0.5, false);
		}
		else {
			sprite_index = spr_bishop_teleport_second;
			// Audio work from justin
			if (!audio_is_playing(snd_sweepAttack)) audio_play_sound(snd_sweepAttack, 0.5, false);
			if(image_index > 8 && image_index < 11 && damage_box == noone) damage_box = instance_create_depth(x,y,depth,obj_enemy_damage);
			if(damage_box != noone) {
				damage_box.x = x;
				damage_box.y = y + 189;
				damage_box.image_xscale = 6.6;
				damage_box.image_yscale = 1;
				if(image_index > 11) {
					with(damage_box) instance_destroy();
					damage_box = noone;
				}
			}
		}
		break;
		
	case "DEATH":
		if(!ready) sprite_index = spr_bishop_death;
		else sprite_index = spr_bishop_ready;
		// Audio work from justin
		if (!deathSndPlayed) {
			audio_play_sound(snd_break, 0.5, false);
			deathSndPlayed = true;
		}
		hsp = 0;
		break;
		
	case "HOLLOW":
		sprite_index = spr_bishop_hollow;
		break;
}

if(currentHealth <= 0 && !ready) {
	state = "DEATH";
	if(damage_box != noone) {
		with(damage_box) instance_destroy();
		damage_box = noone;
	}
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
	point.yoffset = -128;
	point.image_xscale = direct;
}

if(hurt) image_alpha = random_range(0.4, 0.9);
else if(sprite_index != spr_bishop_teleport_first) image_alpha = 1;

vsp += grav;

if(place_meeting(x+hsp,y, obj_solid)) {
	while(!place_meeting(x+sign(hsp),y, obj_solid)) {
		x += sign(hsp);
	}
	hsp = 0;
	timer = 500;
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