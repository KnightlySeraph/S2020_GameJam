if(sprite_index = spr_bishop_death) ready = true;
if(sprite_index = spr_bishop_rise) {
	state = "IDLE";
	timer = 0;
	drill_step = 1;
	random_num = irandom_range(90,120);
}
if(sprite_index = spr_bishop_crouch) drill_step = 2;

if(sprite_index == spr_bishop_teleport_first) {
	if(obj_player.grounded) {
		image_alpha = 1;
		spot_chosen = true;
		var target_x = obj_player.x;
		var target_y = obj_player.y - 128;
		var offset = choose(-1,1) * 250;
	
		var warning = 0;
	
		if(place_meeting(target_x + offset, target_y, obj_solid)) offset = -offset;
	
		while(place_meeting(target_x + offset, target_y, obj_solid)) {
			target_y -= 1;
			warning += 1;
			if(warning > 1000) break;
		}
	
		x = target_x + offset;
		y = target_y;

		direct = sign(obj_player.x-x);
	}
	else {
		image_index = image_index - 1;
		image_alpha = 0;
	}
}
else if(sprite_index == spr_bishop_teleport_second) {
	spot_chosen = false;
	state = "IDLE";
	timer = 0;
	random_num = irandom_range(90,120);
}