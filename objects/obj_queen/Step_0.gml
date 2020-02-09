if(state == "SWORDS") mask_index = spr_queen_summon_loop;
else if(state != "DEATH" && state != "HOLLOW") mask_index = spr_queen_idle;
else mask_index = spr_queen_ready;

switch(state) {
	case "IDLE":
		sprite_index = spr_queen_idle;
		hsp = 0;
		timer += 1;
		
		if(timer > 60) {
			if(attacks >= attack_num) {
				state = "SWORDS";
				hsp = 0;
				timer = 0;
				attacks = 0;
				attack_num = random_range(2,4);
				sprite_index = spr_queen_summon_start;
				swords = 0;
			}
			else {
				if(abs(x-obj_player.x) < 475) {
					state = "ATTACK";
					hsp = 0;
					timer = 0;
					direct = -sign(obj_player.x - x);
					attacks += 1;
				}
				else {
					state = "WALK";
					timer = 0;
				}
			}
		}

		
		break;
	
	case "WALK":
		sprite_index = spr_queen_cloak_walk;
		if(vsp==0) hsp = spd * -direct;
		direct = -sign(obj_player.x - x);
		if(abs(x-obj_player.x) < 475) {
			state = "ATTACK";
			hsp = 0;
			attacks += 1;
		}
		break;
		
	case "ATTACK":
		sprite_index = spr_queen_attack;
		break;
		
	case "SWORDS":
		hsp = 0;
		if(sprite_index = spr_queen_summon_loop) {
			timer += 1;
			if(timer > 30) {
				if(swords > (16-healthPips)) sprite_index = spr_queen_summon_end;
				else {
					swords += 1;
					timer = 0;
				}
			}
		}
		break;
		
	case "DEATH":
		if(!ready) sprite_index = spr_queen_death;
		else sprite_index = spr_queen_ready;
		hsp = 0;
		break;
		
	case "HOLLOW":
		sprite_index = spr_queen_hollow;
		break;
}

if(currentHealth <= nextPip) {
	healthPips -= 1;
	nextPip -= pipAmount;
}
if(currentHealth <= 0 && !ready) {
	state = "DEATH";
	if(damage_box != noone) {
		with(damage_box) instance_destroy();
		damage_box = noone;
	}
}
if(hollow) state = "HOLLOW";

if(hurt) image_alpha = random_range(0.4, 0.9);
else image_alpha = 1;

vsp += grav;

if(currentHealth > 0 && state != "SWORD") {
if(place_meeting(x+hsp,y, obj_solid)) {
	while(!place_meeting(x+sign(hsp),y, obj_solid)) {
		x += sign(hsp);
	}
	hsp = 0;
	direct = -direct;
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

image_xscale = -direct;

if(current_sprite != sprite_index) {
	current_sprite = sprite_index;
	image_index = 0;
}