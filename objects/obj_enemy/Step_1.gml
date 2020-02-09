text_alpha = 0;

if(place_meeting(x,y,obj_player) && !hollow) {
	if(obj_player.suckEnemy == noone && ready && !hollow) {
		obj_player.suckEnemy = self;
	}
	else if(obj_player.suckEnemy == self && obj_player.sucking && dark_alpha < 1) dark_alpha += 0.01;
	
	if(!obj_player.sucking) text_alpha = 1;
}
else if(dark_alpha > 0) dark_alpha -= 0.05;