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
		if(image_index > 4 && image_index < 6 && damage_box == noone) damage_box = instance_create_depth(x,y,depth-1,obj_enemy_damage);
		if(damage_box != noone) {
			if(image_index > 11) {
				with(damage_box) instance_destroy();
				damage_box = noone;
			}
			else if(image_index > 10) {
				damage_box.x = x + 165*direct;
				damage_box.y = y + 110;
				damage_box.image_xscale = 2.75;
				damage_box.image_yscale = 4.75;
				damage_box.image_angle = -15 * direct;
			}
			else if(image_index > 9) {
				damage_box.x = x + 178*direct;
				damage_box.y = y - 201;
				damage_box.image_xscale = 1.9;
				damage_box.image_yscale = 5;
				damage_box.image_angle = 0;
			}
			else if(image_index > 8) {
				damage_box.x = x + 44*direct;
				damage_box.y = y - 448;
				damage_box.image_xscale = 3.2;
				damage_box.image_yscale = 2;
				damage_box.image_angle = -15 * direct;
			}
			else if(image_index > 7) {
				damage_box.x = x - 202*direct;
				damage_box.y = y - 512;
				damage_box.image_xscale = 5.2;
				damage_box.image_yscale = 2.55;
				damage_box.image_angle = 0;
			}
			else if(image_index > 6) {
				damage_box.x = x - 387*direct;
				damage_box.y = y - 351;
				damage_box.image_xscale = 2.4;
				damage_box.image_yscale = 5.8;
				damage_box.image_angle = 0;
			}
			else if(image_index > 5) {
				damage_box.x = x - 480*direct;
				damage_box.y = y - 42;
				damage_box.image_xscale = 1.55;
				damage_box.image_yscale = 7;
				damage_box.image_angle = 35 * direct;
			}
			else if(image_index > 4) {
				damage_box.x = x - 215*direct;
				damage_box.y = y + 212;
				damage_box.image_xscale = 4;
				damage_box.image_yscale = 0.875;
				damage_box.image_angle = -35 * direct;
			}
		}
		break;
		
	case "SWORDS":
		hsp = 0;
		if(sprite_index = spr_queen_summon_loop) {
			timer += 1;
			if(timer > 90) {
				if(swords > (16-healthPips)) sprite_index = spr_queen_summon_end;
				else {
					instance_create_depth(x,y,depth,obj_queen_sword);
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