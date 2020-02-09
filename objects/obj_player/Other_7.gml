/// @description Insert description here
// You can write your code in this editor
if (sprite_index == spr_player_jump_left || sprite_index == spr_player_jump_right) {
	image_speed = 0;
	image_index = (image_number - 1);
}
if(sprite_index = spr_player_feast_left || sprite_index = spr_player_feast_right) {
	if(suckEnemy != noone) suckEnemy.hollow = true;
	// Increase Health
	hitpoints++;
	hitpoints = clamp(hitpoints, 0, hitpointMax);
}

// Reset the room on death
if (sprite_index == spr_player_death_left || sprite_index == spr_player_death_right) {
	room_restart();	
}