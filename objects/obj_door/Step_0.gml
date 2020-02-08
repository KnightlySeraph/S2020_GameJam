/// @description Insert description here
// You can write your code in this editor
if (open) {
	image_speed = 1;	
}

// Open if enemies dead
if (!instance_exists(obj_enemy)) {
	open = true;	
}

// Debug
if (keyboard_check_pressed(ord("O"))) {
	open = true;	
}