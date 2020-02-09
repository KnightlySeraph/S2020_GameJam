mask_index = spr_queen_cloak_idle;

if(player_start == infinity) {
	if(instance_exists(obj_player)) player_start = obj_player.x;
}
else {
	if(!letsdothis) {
		if(obj_player.hsp != 0) {
			sprite_index = spr_queen_cloak_walk;
			if(obj_player.hsp > 0) image_xscale = -1;
			else image_xscale = 1;
		}
		else sprite_index = spr_queen_cloak_idle;
	
		x = my_start - abs(player_start - obj_player.x);
	
		if(abs(obj_player.x - x) < 600) {
			letsdothis = true;
			x -= 152;
			sprite_index = spr_queen_reveal;
			image_index = 0;
		}
	}
	else sprite_index = spr_queen_reveal;
}