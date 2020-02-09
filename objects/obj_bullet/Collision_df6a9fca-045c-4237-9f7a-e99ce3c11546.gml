if(speed != 0) {
	var dag = instance_place(x,y,obj_dagger);
	if(sprite_index == spr_player_bullet) {
		with(dag) instance_destroy();
		
		scr_camShake(2, 15);
		
		// Change Effect
		sprite_index = spr_player_bullet_boom;
		speed = 0;
		image_index = 0;
		image_angle = irandom_range(0,360);
	
		// Play Snd FX
	
		audio_play_sound(snd_bulletImpact, 0.6, false);
	}
}