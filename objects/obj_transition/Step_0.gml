/// @description Insert description here
// You can write your code in this editor
if (transition) {
	if (instance_exists(obj_lightSys)) {
		with(obj_lightSys) {
			intensity += 0.05;	
		}
	}
	if (alarm[0] < 0) alarm[0] = room_speed * 1.5;
}