/// @description Insert description here

if (moveTo) {
	speed = b_speed;
	direction = point_direction(x, y, locX, locY);
	moveTo = false;
}

image_angle = direction;

// Delete on contact with solids
if (place_meeting(x, y, obj_solid)) {
	// Shake
	scr_camShake(2, 15);
	
	instance_destroy();
}

// Shake on meeting enemy
