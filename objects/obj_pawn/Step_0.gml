mask_index = spr_pawn_idle;

switch(state) {
	case "IDLE":
		sprite_index = spr_pawn_idle;
		hsp = 0;
		if(!alert) {
			timer += 1;
			if(timer > random_num) {
				state = "WALK";
				timer = 0;
				random_num = irandom_range(60,90);
				direct = choose(1,-1);
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
			if(abs(x-obj_player.x) < 128) {
				state = "ATTACK";
				hsp = 0;
			}
		}
		break;
		
	case "ATTACK":
		sprite_index = spr_pawn_attack;
		break;
		
	case "DEATH":
		break;
		
	case "HOLLOW":
		break;
}


if(abs(obj_player.x - x) < 640 && abs(obj_player.y - y) < 192 && sign(obj_player.x - x) == -direct) alert = true;
else alert = false

vsp += grav;


if(place_meeting(x+hsp,y, obj_solid)) {
	while(!place_meeting(x+sign(hsp),y, obj_solid)) {
		x += sign(hsp);
	}
	hsp = 0;
	direct = -direct;
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

if(current_sprite != sprite_index) {
	current_sprite = sprite_index;
	image_index = 0;
}