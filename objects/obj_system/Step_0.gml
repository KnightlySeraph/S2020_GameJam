/// @description Insert description here
// You can write your code in this editor
//===============================================================FULLSCREEN======================================================================================
if (keyboard_check_pressed(vk_f11) && window_get_fullscreen()) {
	window_set_fullscreen(false);	
}
else if (keyboard_check_pressed(vk_f11)) {
	window_set_fullscreen(true);	
}

if(keyboard_check_pressed(vk_escape)) {
	if(room == MainMenu) game_end();
	else room_goto(MainMenu);
}