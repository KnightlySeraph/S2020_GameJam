/// @desc scr_lighting (target, step)
/// @arg target Between 0 and 1, 1 is darkest 0 is brightest
/// @arg step Between 0 and 1, how quickly the target is reached

target = argument0;
step = argument1;

if (target % step != 0.0) {
	show_debug_message("Warning, step should be a multiple of target");	
}

if (instance_exists(obj_lightSys)) {
	if (obj_lightSys.intensity != target) {
		obj_lightSys.fade = true;
		obj_lightSys.fadeStep = step;
		obj_lightSys.fadeTarget = target;
	}
}
else {
	show_debug_message("No lightsource exists in the room");	
}