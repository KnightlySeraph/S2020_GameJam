/// @description Movement and Physics

// Collect Input
move = keyboard_check(ord("D")) + -keyboard_check(ord("A"));
hsp = move * movementSpeed;
jump = keyboard_check_pressed(vk_space);

if (jump && grounded) {
	vsp = -jumpForce;
}

// Check for grounded
if (place_meeting(x, y + 1, obj_solid)) {
	grounded = true;	
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
