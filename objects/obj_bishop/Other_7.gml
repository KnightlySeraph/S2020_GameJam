//if(sprite_index = spr_pawn_attack) state = "IDLE";
//if(sprite_index = spr_pawn_death) ready = true;
if(sprite_index = spr_bishop_rise) {
	state = "IDLE";
	timer = 0;
	drill_step = 1;
}
if(sprite_index = spr_bishop_crouch) drill_step = 2;