/// @description Insert description here

//Mask
mask_index = spr_player_bullet;

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

// Spawn Particles
if (alarm[1] < 0) alarm[1] = room_speed * spawnRate;