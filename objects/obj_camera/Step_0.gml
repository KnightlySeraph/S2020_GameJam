/// @description Follow Player
x += (xTo - x) / 10;
y += (yTo - y) / 10;

// CLamp to room
x=clamp(x,0+(width/2),room_width-(width/2));
y=clamp(y,0+(height/2),room_height-(height/2));

//As long as player following  is following the player
if(follow != noone){
	xTo = follow.x;
	yTo = follow.y;
}

//Shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1/shake_length) * shake_mag));


var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(player_cam, vm);

////Zoom camera functionality
//if (mouse_wheel_up()) {
//	height -= zoomSpeed;
//	width = (height / aspectRatio);
//	clamp(height, 540, 2160);
//	clamp(width, 960, 3840);
//	pm = matrix_build_projection_ortho(width, height, 1, 10000);
//	camera_set_proj_mat(player_cam, pm);
//}
//if (mouse_wheel_down()) {
//	height += zoomSpeed;
//	width = (height / aspectRatio)
//	clamp(height, 540, 2160);
//	clamp(width, 960, 3840);
//	pm = matrix_build_projection_ortho(width, height, 1, 10000);
//	camera_set_proj_mat(player_cam, pm);
//}

if (zooming) {
	height = lerp(height, newHeight, lerpOut);
	event_user(0);
	if (height == newHeight) {
		zoomOut = false;	
	}
}
if (zoomOut) {
	height = lerp(height, newHeight, lerpOut);
	event_user(0);
	if (height == newHeight) {
		zoomOut = false;	
	}
}
