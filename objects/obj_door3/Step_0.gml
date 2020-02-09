/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_queen)) {
	if (obj_queen.hollow = true) {
		image_speed = 1;	
	}
}

if (place_meeting(x, y, obj_player) && keyboard_check_pressed(ord("S"))) {
	if (instance_exists(obj_transition)) obj_transition.transition = true;	
}