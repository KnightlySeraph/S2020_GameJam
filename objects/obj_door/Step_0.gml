/// @description Insert description here
// You can write your code in this editor
if (open && place_meeting(x, y, obj_player)) {
	image_speed = 1;	
}


// Debug
if (keyboard_check_pressed(ord("O"))) {
	open = true;	
}

// Check if all enemies are hollowed
var i;
var enemy;

for (i = 0; i < instance_number(obj_enemy); i += 1) {
	enemy[i] = instance_find(obj_enemy, i);
}

for (i = 0; i < instance_number(obj_enemy); i++) {
	if (enemy[i].hollow) {
		numEnemies--;	
	}
	if (numEnemies <= 0) {
		open = true;	
	}
}

numEnemies = instance_number(obj_enemy);

if (open && place_meeting(x, y, obj_player) && keyboard_check_pressed(ord("S"))) {
	if (instance_exists(obj_transition)) {
		obj_transition.transition = true;	
	}
}