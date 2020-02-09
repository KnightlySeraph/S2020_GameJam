if(speed != 0) {
	var enemy = instance_place(x,y,obj_enemy);
	if(sprite_index = spr_player_bullet && enemy.state != "DEATH" && enemy.state != "HOLLOW") {
		enemy.currentHealth -= 1;
		enemy.hurt = true;
		enemy.alarm[0] = 20;
		enemy.alert = true;
		enemy.alert_timer = 0;
		
			
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