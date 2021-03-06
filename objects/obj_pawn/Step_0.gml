if(state != "DEATH" && state != "HOLLOW") mask_index = spr_pawn_idle;
else mask_index = spr_pawn_ready;

switch(state) {
	case "IDLE":
		sprite_index = spr_pawn_idle;
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
			if(abs(x-obj_player.x) < 96) {
				state = "ATTACK";
				hsp = 0;
				timer = 0;
			}
		}
		
		break;
	
	case "WALK":
		sprite_index = spr_pawn_walk;
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
			if(abs(x-obj_player.x) < 96) {
				state = "ATTACK";
				hsp = 0;
			}
		}
		break;
		
	case "ATTACK":
		sprite_index = spr_pawn_attack;
		if (!audio_is_playing(snd_rookShoot)) audio_play_sound(snd_rookShoot, 0.6, false);
		if(image_index > 6 && image_index < 8 && damage_box == noone) damage_box = instance_create_depth(x,y,depth,obj_enemy_damage);
		if(damage_box != noone) {
			damage_box.x = x - 77*direct;
			damage_box.y = y + 75;
			damage_box.image_xscale = 0.7
			damage_box.image_yscale = 0.75
			if(image_index > 8) {
				with(damage_box) instance_destroy();
				damage_box = noone;
			}
		}
		break;
		
	case "DEATH":
		if(!ready) sprite_index = spr_pawn_death;
		else sprite_index = spr_pawn_ready;
		if (!deathNoise) {
			audio_play_sound(snd_break, 0.6, false);
			deathNoise = true;
		}
		hsp = 0;
		break;
		
	case "HOLLOW":
		sprite_index = spr_pawn_hollow;
		break;
}

if(currentHealth <= 0 && !ready) {
	state = "DEATH";
	if(place_meeting(x-(direct * 70), y, obj_solid) || !place_meeting(x-(direct*70), y+1, obj_solid)) {
		direct = -direct;
	}
	if(damage_box != noone) {
		with(damage_box) instance_destroy();
		damage_box = noone;
	}
}
if(hollow) state = "HOLLOW";

if(abs(obj_player.x - x) < 640 && abs(obj_player.y - y) < 192 && sign(obj_player.x - x) == -direct) {
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
	direct = -direct;
}
else if(!place_meeting(x + (sign(hsp) * 45), y + 1, obj_solid)) {
	hsp = 0;
	if(!alert) direct = -direct;
	else state = "IDLE"
}
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