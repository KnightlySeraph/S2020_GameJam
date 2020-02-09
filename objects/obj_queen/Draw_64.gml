/// @description Draw queen health
if (!pipAway) {
	for (i = 0; i < healthPips; i++) {
		draw_sprite(spr_healthPipQueen, 0, 1800 - (i * hitpointOffset), 900);
	}
}
else {
	for (i = 0; i < healthPips; i++) {
		if (i != healthPips - 1) {
			draw_sprite(spr_healthPipQueen, 0, 1800 - (i * hitpointOffset), 900);	
		}
		else {
			draw_sprite(spr_healthPipQueen, image_index, 1800 - (i * hitpointOffset), 900);	
		}
	}	
}