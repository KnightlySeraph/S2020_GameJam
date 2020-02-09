switch(state) {
	case("THROW"):
		if(image_index > 8 && !throw) {
			instance_create_depth(x-100,y,depth,obj_dagger);
			throw = true;
		}
		break;
		
	case "DEATH":
		if(!ready) sprite_index = spr_king_death;
		else sprite_index = spr_king_ready;
		hsp = 0;
		break;
		
	case "HOLLOW":
		sprite_index = spr_king_hollow;
		break;
}

if(currentHealth <= 0 && !ready) {
	if(abs(obj_player.x - x) > 1000) currentHealth = 1;
	else state = "DEATH";
}
if(hollow) state = "HOLLOW";

suck_x = x+178;

if(currentSprite != sprite_index) {
	image_index = 0;
	currentSprite = sprite_index;
}