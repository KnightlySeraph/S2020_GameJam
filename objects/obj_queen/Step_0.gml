if(state != "DEATH" && state != "HOLLOW") mask_index = spr_queen_idle;
else mask_index = spr_queen_ready;

switch(state) {
	case "IDLE":
		sprite_index = spr_queen_idle;
		hsp = 0;
		timer += 1;
		
		if(timer > 60) {
			state = "WALK";
			timer = 0;
		}
		if(abs(x-obj_player.x) < 400) {
			state = "ATTACK";
			hsp = 0;
			timer = 0;
		}
		
		break;
	
	case "WALK":
		sprite_index = spr_queen_cloak_walk;
		if(vsp==0) hsp = spd * -direct;
		direct = -sign(obj_player.x - x);
		if(abs(x-obj_player.x) < 400) {
			state = "ATTACK";
			hsp = 0;
		}
		break;
		
	case "ATTACK":
		sprite_index = spr_queen_attack;
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

if(currentHealth > 0) {
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