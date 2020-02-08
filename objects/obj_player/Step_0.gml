/// @description Movement and Physics

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
if (mouse_check_button(mb_left) && !fire_delay) { // Check for input
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

// Animation Handler
// Idling
if (move == 0 && grounded && !mouse_check_button(mb_left)) {
	if (moving_right) {
		sprite_index = spr_player_idle_right;
	}
	else if (moving_left) {
		sprite_index = spr_player_idle_left;
	}
}

// Moving left or right and not firing
if (move != 0 && grounded && !mouse_check_button(mb_left)) {
	if (move == 1) {
		sprite_index = spr_player_walking_right;	
	}
	else if (move == -1) {
		sprite_index = spr_player_walking_left;	
	}
}
