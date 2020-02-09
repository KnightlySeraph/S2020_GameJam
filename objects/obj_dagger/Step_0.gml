if(place_meeting(x,y,obj_solid)) instance_destroy();
if(place_meeting(x,y,obj_player)) {
	if(!obj_player.invin) obj_player.hurt = true;
	instance_destroy();
}