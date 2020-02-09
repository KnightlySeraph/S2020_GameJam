/// @description Movement and Physics

// Debug Block
if (keyboard_check_pressed(ord("T"))) {
	show_debug_message("Invin is " + string(invin));	
}

// Collision mask
mask_index = spr_player_idle_left;

// Reset image speed
if (image_speed == 0.0) {
	if (sprite_index != spr_player_jump_left && sprite_index != spr_player_jump_right) {
		image_speed = 1.0;	
	}
}

// Collect Input
move = keyboard_check(ord("D")) + -keyboard_check(ord("A"));
hsp = move * movementSpeed;
jump = keyboard_check_pressed(vk_space);

if (jump && jumps > 0) {
	vsp = -jumpForce;
	jumps -= 1;
}

// Check for grounded
if (place_meeting(x, y + 1, obj_solid)) {
	grounded = true;	
}
else {
	grounded = false;	
}

// Check for last known direction
if (move == 1) {
	moving_right = true;
	moving_left = false;
}
else if (move == -1) {
	moving_right = false;
	moving_left = true;
}

// Reset jumps
if (grounded) {
	jumps = maxJumps;
}

// Gravity
if (vsp < termVel) {
	vsp += mass;	
}

// Do the suck
if (keyboard_check(ord("S")) && place_meeting(x, y, obj_enemy) && grounded) {
	if(suckEnemy != noone) {
		if(suckEnemy.ready && !suckEnemy.hollow && abs(suckEnemy.suck_x - x) > 192) {
			if(sign(suckEnemy.suck_x - x) == 1) {
				moving_right = true; 
				moving_left = false;
			}
			else {
				moving_left = true; 
				moving_right = false;
			}
			sucking = true;
			if(sprite_index != spr_player_feast_left && sprite_index != spr_player_feast_right) image_index = 0;
	
			// Begin a camera zoom
			scr_cam_zoom(800, 3, 0.01, 0.01);
			// Begin a screen shake
			scr_camShake(suckShake, 30);
			suckShake += suckShakeInc;
			suckShake = clamp(suckShake, 0.0, 30);
			// Screen dim
			with (obj_lightSys) {
				intensity += 0.01;	
				intensity = clamp(intensity, 0.0, 0.8);
			}
		}
		else {
			sucking = false;
			scr_cam_zoom(1080, 1, 0.1, 1);
			suckShake = oriSuckShake;
			// Make screen light
			with (obj_lightSys) {
				if (intensity > 0.6) {
					intensity -= 0.01;
					intensity = clamp(intensity, 0.0, 1.0);
				}	
			}
			var direct = -sign(suckEnemy.suck_x - x);
			hsp = direct * movementSpeed;
			var temp_x = x;
			var temp_collide = false;
			while(abs(suckEnemy.suck_x - temp_x) < 192) {
				temp_x += hsp;
				if(place_meeting(temp_x,y,obj_solid)) temp_collide = true;
			}
			if(temp_collide) hsp = -hsp;
		}
	}
}
else {
	sucking = false;
	suckEnemy = noone;
	scr_cam_zoom(1080, 1, 0.1, 1);
	suckShake = oriSuckShake;
	// Make screen light
	if (!obj_transition.transition && !allowDarken) {
		with (obj_lightSys) {
			if (intensity > 0.6) {
				intensity -= 0.01;
				intensity = clamp(intensity, 0.0, 1.0);
			}	
		}
	}
}

// Collision
//Horizontal Collision
if (place_meeting(x + hsp, y, obj_solid)){
	while(!place_meeting(x+sign(hsp), y, obj_solid)){
		x += sign(hsp);	
	}
	hsp = 0;
}
//Vertical Collision
if (place_meeting(x, y + vsp, obj_solid)){
	while(!place_meeting(x, y+sign(vsp), obj_solid)){
		y += sign(vsp);	
	}
	vsp = 0;
}

// Update the player's position
x += hsp;
y += vsp;

// Debug for Health
if (keyboard_check_pressed(vk_add)) {
	hitpoints++;	
}
else if (keyboard_check_pressed(vk_subtract)) {
	hurt = true;
	invin = true;
}

// Health Stuff
if (hurt) {
	if (alarm[3] < 0) alarm[3] = room_speed * 0.5;	
	if (!invin) invin = true;
}
// Death
if (hitpoints <= 0) {
	dying = true;
	if (moving_left) {
		sprite_index = spr_player_death_left;	
	}
	else {
		sprite_index = spr_player_death_right;	
	}
}

// Gunplay
if (mouse_check_button(mb_left) && !fire_delay && grounded) { // Check for input
	pointX = mouse_x;
	pointY = mouse_y;
	is_firing = true;
	
	fire_delay = true;
}

// Fire a bullet
if (is_firing) {
	// Set up tmp bullet
	tmpBullet = instance_create_depth(x, y, 0, obj_bullet);
	tmpBullet.b_speed = projectile_speed;
	tmpBullet.locX = pointX;
	tmpBullet.locY = pointY;
	
	tmpBullet = noone;
	
	fire_delay = true;
	
	// Start the alarm
	alarm[0] = room_speed * fire_rate;
	
	is_firing = false;
}

// Invincibility Frames
if (invin) {
	if (alarm[1] < 0) alarm[1] = room_speed * flashSpeed;
	if (alarm[2] < 0) alarm[2] = room_speed * invinTime;
}
// Debug for IFrames
if (keyboard_check_pressed(ord("I"))) {
	invin = true;	
}

// Animation Handler
// Idling
if (move == 0 && grounded && !mouse_check_button(mb_left) && !sucking && !dying) {
	if (moving_right) {
		sprite_index = spr_player_idle_right;
	}
	else if (moving_left) {
		sprite_index = spr_player_idle_left;
	}
}

// Moving left or right and not firing
if (move != 0 && grounded && !mouse_check_button(mb_left) && !sucking && !dying) {
	if (move == 1) {
		sprite_index = spr_player_walking_right;	
	}
	else if (move == -1) {
		sprite_index = spr_player_walking_left;	
	}
	
	// Play walk cycle sound
	if (!audio_is_playing(snd_playerWalk)) {
		audio_play_sound(snd_playerWalk, 1, false);	
	}
}

// Sucking
if (move == 0 && sucking && grounded && !dying) {
	if (moving_right) {
		sprite_index = spr_player_feast_right;	
	}
	else if (moving_left) {
		sprite_index = spr_player_feast_left;	
	}
	
	// Play suck sound
	if (!audio_is_playing(snd_suck)) {
		audio_play_sound(snd_suck, 0.8, false);	
	}
}

// Shooting, idle
if (move == 0 && grounded && mouse_check_button(mb_left) && !dying) {
	if (moving_right) {
		sprite_index = spr_player_shoot_idle_right;	
	}
	else if (moving_left) {
		sprite_index = spr_player_shoot_idle_left;	
	}
	 // Play shooting sound
	 if (!audio_is_playing(snd_firing)) {
		 audio_play_sound(snd_firing, 0.4, false);
	 }
}

// Falling Animation
if (!grounded && vsp > 0 && !dying) {
	if (moving_right) {
		sprite_index = spr_player_fall_right;	
	}
	else if (moving_left) {
		sprite_index = spr_player_fall_left;	
	}
}

// Firing while moving
if (grounded && move != 0 && mouse_check_button(mb_left) && !dying) {
	if (move == 1) {
		sprite_index = spr_walk_shoot_right;	
	}
	else if (move == -1) {
		sprite_index = spr_walk_shoot_left;	
	}
	// Play shooting sound
	 if (!audio_is_playing(snd_firing)) {
		 audio_play_sound(snd_firing, 0.4, false);
	 }
}

// Jumping Animation
if(vsp <= 0 && !grounded && !dying) {
	if (moving_right) {
		sprite_index = spr_player_jump_right;	
	}
	else if (moving_left) {
		sprite_index = spr_player_jump_left;	
	}	
}
