/// @description Insert description here
// You can write your code in this editor
//===============================================================FULLSCREEN======================================================================================
if (keyboard_check_pressed(vk_f11) && window_get_fullscreen()) {
	window_set_fullscreen(false);	
}
else if (keyboard_check_pressed(vk_f11)) {
	window_set_fullscreen(true);	
}

if(keyboard_check(vk_escape)) {
	exiting++;
	with (obj_lightSys) {
		intensity += 0.01;
		intensity = clamp(intensity, 0.0, 1.0);
	}
}
else exiting = 0;
if (exiting > 60) {
	if(room == MainMenu) game_end();
	else room_goto(MainMenu);
	exiting = 0;
}
