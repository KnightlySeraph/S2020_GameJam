if(place_meeting(x,y,obj_solid)) instance_destroy();
if(place_meeting(x,y,obj_player)) {
	obj_player.hurt = true;
	instance_destroy();
}