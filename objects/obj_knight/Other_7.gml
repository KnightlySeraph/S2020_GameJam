if(sprite_index == spr_knight_death) ready = true;
if(sprite_index == spr_knight_jump) {
	vsp = -32;
	jumped = true;
	direct = -sign(obj_player.x - x);	
}
else if(sprite_index == spr_knight_land) {
	state = "IDLE";
	jumped = false;	
}