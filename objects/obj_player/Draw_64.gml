/// @description Draw Healthpoints

if (!hurt) {
	for (i = 0; i < hitpoints; i++) {
		draw_sprite(spr_player_health, 0, 100 + (i * hitpointOffset), 100);
	}
}
else {
	for (i = 0; i < hitpoints; i++) {
		if (i != hitpoints - 1) {
			draw_sprite(spr_player_health, 0, 100 + (i * hitpointOffset), 100);	
		}
		else {
			draw_sprite(spr_player_health, image_index, 100 + (i * hitpointOffset), 100);	
		}
	}	
}

