if(place_meeting(x,y,obj_player)) {
	if(obj_player.suckEnemy == noone && ready && !hollow) {
		obj_player.suckEnemy = self;
	}
}