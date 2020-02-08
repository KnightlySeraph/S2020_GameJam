/// @description Movement and Physics

// Debug Block
if (keyboard_check_pressed(ord("T"))) {
	show_debug_message("Invin is " + string(invin));	
}

// Collision mask
mask_index = spr_player_idle_left;

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
if (keyboard_check(ord("S")) && place_meeting(x, y, obj_enemy)) {
	sucking = true;	
	
	// Begin a camera zoom
	scr_cam_zoom(800, 3, 0.01, 0.01);
	// Begin a screen shake
	scr_camShake(suckShake, 30);
	suckShake += suckShakeInc;
	suckShake = clamp(suckShake, 0.0, 30);
	// Screen dim
	with (obj_lightSys) {
		intensity += 0.01;	
		intensity = clamp(intensity, 0.0, 0.6);
	}
}
else {
	sucking = false;	
	scr_cam_zoom(1080, 1, 0.1, 1);
	suckShake = oriSuckShake;
	// Make screen light
	with (obj_lightSys) {
		intensity -= 0.01;
		intensity = clamp(intensity, 0.0, 1.0);
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
if (move == 0 && grounded && !mouse_check_button(mb_left) && !sucking) {
	if (moving_right) {
		sprite_index = spr_player_idle_right;
	}
	else if (moving_left) {
		sprite_index = spr_player_idle_left;
	}
}

// Moving left or right and not firing
if (move != 0 && grounded && !mouse_check_button(mb_left) && !sucking) {
	if (move == 1) {
		sprite_index = spr_player_walking_right;	
	}
	else if (move == -1) {
		sprite_index = spr_player_walking_left;	
	}
}

// Sucking
if (move == 0 && sucking && grounded) {
	if (moving_right) {
		sprite_index = spr_player_feast_right;	
	}
	else if (moving_left) {
		sprite_index = spr_player_feast_left;	
	}
}

// Shooting, idle
if (move == 0 && grounded && mouse_check_button(mb_left)) {
	if (moving_right) {
		sprite_index = spr_player_shoot_idle_right;	
	}
	else if (moving_left) {
		sprite_index = spr_player_shoot_idle_left;	
	}
}
